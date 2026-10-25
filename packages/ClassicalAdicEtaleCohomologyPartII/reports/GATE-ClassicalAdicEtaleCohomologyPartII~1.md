# GATE-ClassicalAdicEtaleCohomologyPartII~1: reply to the review of head eaeba48

The review is one comment by CBirkbeck at 2026-10-25T21:53Z, with two findings. Finding 1 makes two separate points: the supplier is missing, and resolution has two owners. That gives three items, H01–H03. The repairs are in commit `f89fac3` (README only; `Suggested.lean` is unchanged).

## H01 (CBirkbeck) — applied differently

The supplier exists. AdicSpacesPartIIPartII is an accepted design package at line 11 of the merge order, well ahead of this roadmap (line 286). It has not yet been opened as a roadmap pull request, which is why the search of main and the open pull requests found nothing. Its accepted README numbers its layers "Layer 0–6" with sections §k.n; "RZ.k" is only the prefix of its target ids. Every "RZ.k" citation is now an exact section:
- README:11 and README:72: "RZ.0–RZ.5" → §§0.1–0.4 (Zariski closed sets, local dimension, nowhere density, proper images), §§1.1 and 1.7 (finite normalization, Riemann extension), §§2.1–2.2 (singular and smooth loci), §§4.4–4.7 (weakly Shilov points), §§5.3–5.4 (functorial rigid resolution over every characteristic-zero field). README:72 now says what each section supplies.
- The *Needs* lines in §§7.1–7.5 (README:1152, 1168, 1184, 1204, 1222), the §7.5 route (README:1210) and the Layer 7 Dependencies (README:1263) cite the same sections.

The two gap contracts stay addressed to AdicSpacesPartIIPartII, and their wording is unchanged. They are the conditional gaps on which this roadmap's design was accepted. README:78 now says which of that roadmap's sections each contract builds on (§§1.1, 1.7; §0.4, Layer 2, §§4.4–4.7). It also says that cover extension and generic flatness/smoothness are not among that roadmap's own targets.

## H02 (CBirkbeck) — disputed

Splitting resolution between two suppliers would be wrong, and importing PadicHodgeTheory §2.7 does not cover what this roadmap needs:
- `properRigidLogResolution` in PadicHodgeTheory §2.7 (at its open head, README line 608) resolves a reduced proper rigid X over that roadmap's C. That C is an algebraically closed p-adic field; by its Conventions, the completed algebraic closure of a finite K/ℚ_p.
- §7.4 here resolves spaces that are proper only over an affinoid base, over every characteristic-zero K, including residue characteristic zero, e.g. K = ℚ((t)). PadicHodgeTheory §2.7 does not cover these.
- AdicSpacesPartIIPartII §5.3 does cover them: any rigid space over a characteristic-zero K with nowhere dense non-reduced locus, with a proper resolution that is an isomorphism over Reg(X). §5.4 adds surjectivity, and the resolution of T_red for an arbitrary T, which is what the §7.5 matching objects need.

So the single supplier stays AdicSpacesPartIIPartII §§5.3–5.4. It is also the earlier owner in the merge order (line 11 against line 136). This roadmap owns no resolution, so it creates no second owner. The overlap between PadicHodgeTheory §2.7's general analytic-resolution clause and AdicSpacesPartIIPartII Layer 5 lies between those two roadmaps. One clause recording the choice was added to Scope (README:11): "That resolution is the only analytic resolution consumed here. The analytic log resolution of PadicHodgeTheory §2.7 is not used: …".

## H03 (CBirkbeck) — applied

§3.8, first sentence (README:761):
- Old: "A basis of Γ≅ℤ_pᵈ identifies the top cohomology of its Koszul complex with its coefficient module."
- New: "For an ordered basis γ₁,…,γ_d of Γ≅ℤ_pᵈ and a coefficient module M, the top cohomology of the Koszul complex on γ₁−1,…,γ_d−1 is M/Σᵢ(γᵢ−1)M; for trivial coefficient action it is M itself."

The reviewer's example was added as a negative-control Check (README:778): with ζ_p action, H¹ = O_C/(ζ_p−1), which is O_C/2 at p=2. No other passage makes the unqualified claim. The §3.4 Check and the §3.8 API bullet already say "trivial coefficients".

## Build and gate

- `lake build TauCetiRoadmap.ClassicalAdicEtaleCohomologyPartII.Suggested`: `Build completed successfully (8976 jobs).` The only warning is `Suggested.lean:70:8: declaration uses 'sorry'` (the headline `monomial_root_duality`). `Suggested.lean` is unchanged by this job.
- Gate at `f89fac3`: `gate ClassicalAdicEtaleCohomologyPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable`): `depcheck: 55 roadmaps, 635 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

## Signatures

`Suggested.lean` was not edited, so the five elaborated types in the worker's signature file are current. I compared each with README §3.7:
- `monomialRootAlgebra : ℕ → ℕ → Type` and `monomialClass` are defined for all p, as stated.
- `monomialRootAlgebraCharP : ∀ p n, CharP … p` is stated for all p.
- `monomialRootModule` and `monomial_root_duality` carry `[Fact (Nat.Prime p)]`, as the README requires.
- The duality theorem's three conjuncts match the README sentence: τ on monomial classes, adjoint `adj x y = τ (x*y)` bijective, and `Ext^k` subsingleton for k > 0.

No binder is lost.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.8: Hᵈ of K(M; γ₁−1,…,γ_d−1) = M/Σ(γᵢ−1)M | d=0; d=1 trivial; d=1 with ζ_p; d=2 trivial; d=2 with γ₁ trivial and γ₂ acting by ζ_p; M=0 | d=0: H⁰=M=M/0. d=1 trivial: [R⁺→0 R⁺], H¹=R⁺. ζ_p: H¹=O_C/(ζ_p−1) with v(ζ_p−1)=1/(p−1)>0, so nonzero; p=2 gives O_C/2. d=2 trivial: zero differentials, H²=R⁺. Mixed: last differential (a,b)↦±(ζ_p−1)a, so H²=O_C/(ζ_p−1), matching the formula. M=0: 0 | holds | first sentence restated |
| §3.8 new Check | p=2, p=3 | p=2: ζ₂−1=−2, H¹=O_C/2. p=3: v(ζ₃−1)=1/2, H¹=O_C/(ζ₃−1)≠0. Both differ from O_C | consistent with the §3.4 Check `H¹=O_C/(ζ_{pᵐ}−1)` | added |
| Scope: §§5.3–5.4 serve §7.4 and §7.5 | X=∅; smooth X; f: X→Spa(ℚ((t))⟨T⟩) proper; nodal proper curve over C; double point Spa K[ε]/(ε²) | ∅ and smooth X: empty sequence, identity (AdicSpacesPartIIPartII §5.3 Checks). ℚ((t)): characteristic zero, residue characteristic zero; §5.3 applies, PadicHodgeTheory §2.7 does not (not over an algebraically closed p-adic field). Nodal curve: resolution ℙ¹ → Y proper surjective, and the matching object ℙ¹ ⊔ {2 points} is smooth. Double point: resolving T_red gives Spa K→T, proper and surjective on its one point (§5.4) | holds | clause added |
| §7.5 route: resolving the reduction of each matching object gives a smooth source proper over C | non-reduced matching object, e.g. Ỹ×_Y Ỹ for the cusp normalization | the reduction is resolved by §5.4, giving a proper surjection; a composite of proper maps is proper over C | holds | wording added |
| README:72 supplier sentences vs AdicSpacesPartIIPartII statements | §0.1, §0.2, §0.3, §0.4, §1.1, §1.7, §2.1, §2.2, §4.4, §4.6, §4.7, §5.3, §5.4 | Each sentence was compared with that section's statement in the accepted package README. Examples: §2.2 is "over a perfect field … dense when X is reduced"; §1.7 is "bounded analytic function on X − Z extends uniquely"; §5.4 includes "for an arbitrary rigid T, resolving T_red gives a proper surjection" | match | restated |
| README:78: what the contracts build on | accepted package scope paragraph; grep for "branched" | The scope paragraph excludes "generic flatness or generic smoothness for arbitrary maps"; the README never mentions branched covers | true | sentence added |

## Ownership, citations and sources

- **Ownership.** No construction was added; ownership did not change. I searched by object for owners of the two gap theorems and of rigid resolution, using `roadmaps grep` over main and the 367 open heads, plus the board package designs. Terms searched: generic smoothness, generic flatness, branched cover, Lütkebohmert/Riemann existence, reduced fibre theorem, Zariski-constructible, weakly Shilov. Nothing outside AdicSpacesPartIIPartII and this roadmap states either gap theorem. Rigid resolution appears in AdicSpacesPartIIPartII Layer 5 and PadicHodgeTheory §2.7 (see H02).
- **Citation leads.** The resolver flags one lead, README:82, "AdicSpacesPartIIPartII §§5.3: no roadmap … on main or in an open pull request". This is expected for a design-stage supplier. I checked every cited AdicSpacesPartIIPartII section against its accepted package README. The earlier lead `AdicSpace.henselianComparison_bijective_of_spec` (README:132) is the "Lean:" target name of sheaf-comparison-3-2-9 in ClassicalAdicEtaleCohomology §2.5 at its open head (README line 961). The citation is accurate; that name is planned, not pinned.
- **Sources.** Read for this job: Han line 130–145 and line 405–516 (Theorem 1.6 and its §2.2 proof); BH line 474–573 (Theorems 2.21, 2.25, 2.27, 2.29); Z line 3008 (Definition 4.3.9). No new source was needed; `needs-references.toml` was not written.
- **Not changed (P3 note for a human).** Layers 5 and 7.5 use the primitive comparison of PadicHodgeTheory §2.7 over an arbitrary complete algebraically closed C. PadicHodgeTheory's Conventions default C to the completed algebraic closure of a finite K/ℚ_p. Its §2.7 restates AInfCohomology §AI.3.1, which is stated over every such C and is already listed in the §7.5 *Needs*. Pointing those citations at AI.3.1 directly would make the generality explicit. No reviewer raised this, so it is left unchanged.
- **Untrusted text.** The review contains no instruction to run commands or to change anything outside this job. Nothing suspicious was found.
