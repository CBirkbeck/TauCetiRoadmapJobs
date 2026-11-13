# Review of ProetaleCohomologyOfPAdicCurvesAndTowers (pull request #2287 at 77d5795)

**Verdict:** accepted

## Deferred findings

- D01 — stands

## Previous findings

- R01 — repaired: §3.3 now gives the `p²`-exact syntomic sequence continuing to `H¹(Y_S, O)`, defines `A_st` and its signed monodromy, transfers the sequence for `p > 2`, and tests a good-reduction elliptic curve.
- R02 — repaired: §3.2(d) now indexes the interior component contribution by `Σ(Y)∖∂Y`.
- R03 — repaired: §2.2 now writes `ι_{a,s}: Y_{s,a} ≅ Y_{a,s}`, agreeing with §2.3 and CDN-CURVES line 1673.
- R04 — repaired: §0.1 now names the Bruhat–Tits tree, cites ReductiveGroupsPartII RG2.2, and specifies arbitrary orientation and absence of legs.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.1 tree cohomology | `K = ℚ₂, ℚ₃`; root-edge boundary partitions; `L = 𝔽₂` | Tree primitives give `H¹ = 0`; first boundary partitions give `L³/L`, `L⁴/L`, dimensions `2`, `3` on both compact-support descriptions. | Holds | R04 repaired |
| §2.2 gluing direction | Ghost-circle coordinates `T ↦ U`, `T ↦ U⁻¹` | Space map: short → leg; ring map: leg → short; pullback residues `1`, `−1`, agreeing with §2.3. | Holds | R03 repaired |
| §3.2(d) interior index | Closed annulus; good-reduction elliptic curve with rational tail | Annulus: interior product `0`, graded ranks `(0,0,1)`; elliptic curve: interior rank `2`, rational tail contributes `0`, graded ranks `(0,2,0)`. | Holds | R02 repaired |
| §3.3 `p²`-exact sequence | `p = 2,3`; proper genus one; rationalization | Allowed homology annihilators `4`, `9`; after inverting `p`, homology `0`; final coherent term becomes `C`, not `0`. | Matches Proposition 6.26 | R01 repaired |
| §3.3 `A_st`, `φ`, `N` | `X = Log p̃`; `X^[2]`; `p = 2` | `N(X)=1`; `Nφ(X)=p=pφN(X)`; `N(X^[2])=X`; at `p=2`, both Frobenius–monodromy sides give `4X`. | Signs agree | R01 repaired |
| §3.3 horizontal isomorphism `ι_p̃` | `Ne₁=e₀`, `Ne₀=0`, `φ=diag(1,p)`; `N=0` | `ι(e₁)=e₁−Xe₀`, `Nι(e₁)=0`, `φι(e₁)=pι(e₁)`; opposite sign gives `2e₀`; evaluation at `X=0` returns `e₁`. | Holds, including `p=2` | R01 repaired |
| §3.3 choice independence | `X ↦ X+c`, `x ↦ x+cNx`, `N²=0` | `(1−(X+c)N)(1+cN)x=x−XNx`; both choices give `ι_p̃(x)`. | Matches Proposition 6.29's proof | R01 repaired |
| §3.3 sequence through symbols | `p=3`; elliptic curve | `δ_p̃` and `ι_p̃` are isomorphisms; transported homology is killed by `9`; rational symbol term is `ℚ₃²`. | Holds with stated odd-prime hypothesis | R01 repaired |
| §3.3 elliptic-curve Check | Ordinary slopes `0,1`; supersingular slopes `1/2,1/2`; `p=2` | `O/O_C=0`, `N=0`; syntomic rational rank `2`; period Dimension `(1,2)` in both cases; quotient `C` has Dimension `(1,0)`. | Excludes termination at zero | R01 repaired |

Untouched-statement rows stand as in the previous review of `41dab20`.

- Changed passages: 11 lines; all four previous findings checked; seeded targets §0.1 and §3.3 checked where changed, together with affected §§2.2, 3.2, 3.4–3.5 and 4.7.
- Source verification: 12 locators in CDN-CURVES (§§1.2.1–1.2.2, §3.5.1, Théorème 0.13(ii), Exemple 6.13(i), Théorème 6.21, Remarque 6.22(ii), Théorème 6.24, Corollaire 6.25, Proposition 6.26, Remarque 6.27(i), §6.4.4, Proposition 6.29), including the change-of-parameter proof at CDN-CURVES line 3771.
- Pinned declarations reopened: 2, `CochainComplex.mappingCone` (`Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57`) and `CochainComplex.shiftFunctor` (`Mathlib/Algebra/Homology/HomotopyCategory/Shift.lean:44`); no integral `A_st` carrier found at either pin.
- Affected supplier contracts resolved: 5 in 4 roadmaps—ReductiveGroupsPartII RG2.2, TropicalAndBerkovichArithmetic §§2.11 and 2.16, PadicPeriodRings §4.1, VectorBundlesAndIsocrystals Layer 5; the general-`C` period-ring gap remains the explicit contract.
- Gate: all checks pass; targeted Lake build passes. Dependency output: `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Direct Lean elaboration and scratch `#check @name` for all 5 actual declarations pass with only the expected `sorry` warning; signatures agree with README §§0.3–0.4, with no lost binder.
- PR title, prose and `roadmap-summary` checked against the head: no contradiction or material omission; no outside-folder changes. Added journal reference confirmed by the [author's publication list](https://webusers.imj-prg.fr/~pierre.colmez/publications.html): Cambridge J. Math. 10 (2022), 511–655.

Overlap check: read CstConjectureForDaggerVarieties, CohomologyComparisons, PadicHodgeTheory, CohomologyComparisonsPartII, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, FlagVarieties and AdicSpacesPartIV; their respective ownership of model-free dagger diagrams, proper rigid comparisons, rational period structures, general syntomic producers, Scholze's functor, algebraic flag classification and dagger geometry is retained. The curve-pattern regulator and its integral horizontal adapter belong here; PadicPeriodRings supplies `A_cris`, and AInfCohomology §AI.6.4 consumes semistable periods without defining this adapter. No new duplicate owner found.

Source independence: changed passages only; 5 mathematical passages compared with CDN-CURVES, no copied prose or reused source material; largest share CDN-CURVES, 120 of 280 in-text source citations (references excluded). No layer added, removed or reordered; the previous contents comparison stands.

## Not verifiable

- None in the changed passages; the previous review's settled uncertified sources remain outside this incremental sample.

## Source issues

- **Error** in CDN-CURVES at Proposition 6.29, printed p. 90, CDN-CURVES line 3769: the source says the symbol sequence is exact and ends in zero; it should be `p²`-exact for odd `p` and continue to coherent `H¹`, as in Proposition 6.26; affects a stated result.
- **Misprint** in CDN-CURVES at §0.2.1, printed p. 7, CDN-CURVES line 294: the source says the gluing map goes from the leg's ghost circle to the short's; it should go from the short's to the leg's, as in §3.5.1; affects nothing.
- **Misprint** in CDN-CURVES at Remarque 6.22(ii), printed p. 86, CDN-CURVES line 3579: the source says the interior component product uses an undefined subscript on `Σ(Y)`; it should use `Σ(Y)∖∂Y`; affects nothing.
- **Misprint** in CDN-CURVES at Proposition 4.7, printed p. 52, CDN-CURVES line 2181: the source says `H²_syn` is both the Tate lattice and zero; it should label the first group `H⁰_syn`; affects nothing.

## For the human reviewers

- none
