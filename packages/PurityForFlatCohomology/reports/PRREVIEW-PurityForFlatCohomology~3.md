# Review of PurityForFlatCohomology (pull request #1840 at 8cbde9b)

**Verdict:** needs changes

Full re-review of `TauCetiRoadmap/PurityForFlatCohomology/` (README.md, 2893 lines; Suggested.lean, 368 lines). The head first applied the previous review's renumbering of the GroupSchemesOverABase ids (94b4ba4). It then replaced those citations with five new sections (§§7.13a–7.13e) and sixteen new Lean declarations that plan the same theory here (8cbde9b). The gate fails on `statement-hygiene=3`, all three hits in the new declarations. Three findings follow. Two of them block.

## R01 (P1) — §7.13's route rests on Boutot's finiteness of local Picard groups, and no roadmap owns it

**Location.** `TauCetiRoadmap/PurityForFlatCohomology/README.md` lines 2068–2071: “`Pic(U_{S^{sh}})_tors` is infinite while `Pic(U_{S^{sh}⟦t⟧})` is finitely generated ([Bou78] V, Corollaire 4.9)”. The *Needs:* line 2072 lists only §§0.1, 7.6, 7.8, 7.12 and SchemeAndStackFoundations §§2.11, 2.15, 2.22.

**Claim.** §7.13 is a “Prove:” target, and its route needs the finite generation of `Pic` of the punctured spectrum of the three-dimensional ring `S^{sh}⟦t⟧`. That input is not a target here, not a named supplier section and not a pinned declaration. A citation of [Bou78] is not a supplier.

**Witness.** `roadmaps grep -i 'Boutot|Bou78|local Picard (scheme|group)'` finds it only in this README. §7.6 gives just torsion-freeness of `Pic(U_{S^{sh}⟦t⟧})`, which does not suffice: `ℚ ↠ ℚ/ℤ` is a torsion-free group mapping onto infinite torsion.

**Why finiteness is needed.** The sequence of [CS24] Remark 7.2.6 (CS24 lines 3784–3790, p. 90) gives `Pic(U_{S^{sh}⟦x⟧}) ⊕ Pic(U_{S^{sh}⟦y⟧}) → Pic(U_{S^{sh}}) → H²(U_R, 𝔾_m)`. The cokernel has infinite torsion only if the image meets `Pic(U_{S^{sh}})_tors` in a finite group. That holds when the source is finitely generated. It does not follow from torsion-freeness.

**Repair.** Choose one of two options.
- (a) Own the input. In §7.13, before “Route:”, add the target “Prove: `Pic(Spec S^{sh}⟦t⟧ ∖ {𝔪})` is finitely generated ([Bou78] V, Corollaire 4.9)”, with its own route and with its inputs added to the *Needs:* line.
- (b) Drop the target. Remove “Prove:” from §7.13 and record the two examples as Checks of §7.12 citing [CS24] Remark 7.2.6, p. 90, as §7.6 already does for `Pic(U_S)_tors`. Then repoint the four Checks that cite §7.13 (lines 2020–2021, 2059–2060, 2457–2458 and 2560–2561) to that Check.

Tested on the refuting instance: under (b) no route uses [Bou78] V 4.9. Under (a) the input has an owner and a locator.

## R02 (P2) — §§7.13a–7.13e and sixteen Suggested.lean declarations re-plan GroupSchemesOverABase Layers 1–2

**Location.**
- README lines 2081–2329 (§§7.13a–7.13e) and lines 52–57, 77–80, 101–104, 248–258, 275–294, 337–342 and 1763–1766.
- The *Needs:* lines of §§7.14 (2349), 7.15 (2390), 7.16 (2410), 8.2 (2476), 8.5 (2528), 8.8 (2568) and 8.11 (2621).
- Layer 7 Dependencies (2429–2433) and Layer 8 Dependencies (2778).
- Suggested.lean imports (lines 4–7), docstring (lines 28–33 and 65–68) and declarations at lines 223–365.

**Claim.** This roadmap now owns diagonalizable groups `D_S(M)`, groups of multiplicative type, tori, character sheaves, subgroups, quotients and largest subtori over a base. An open roadmap earlier in the supply order owns the same objects. That gives two owners of one object.

**Witness.** GroupSchemesOverABase (#1522, head 6b17dff) README line 35 owns “diagonalizable groups `D_S(M)`… groups of multiplicative type…, tori, character and cocharacter sheaves”. Its Suggested.lean lines 95–178 declare `diagonalizable`, `smooth_diagonalizable_iff`, `IsMultiplicativeType`, `IsTorus`.

**Correspondence.**

| This head | GroupSchemesOverABase at 6b17dff |
|---|---|
| §7.13a and its declarations | 1.1 Construction, 1.2 Homomorphisms, 1.5 Cartier duality |
| §7.13b | 1.3 Smoothness, 1.4 Exactness |
| §7.13c | 2.1 Definitions, 2.2 Quasi-isotriviality |
| §7.13d | 2.3 The character sheaf and the anti-equivalence |
| §7.13e | 2.7 Cocharacters, subtori, quotients |

**Supply direction.** GroupSchemesOverABase is a new roadmap folder by another author, so it is an admissible supplier. Its suppliers are:
- on main: ModularCurves, SchemeAndStackFoundations, ReductiveGroups, SchubertGeometry, FlagVarieties;
- in `ORDER.txt`: AlgebraicModuliForArithmeticGeometry (line 36), AbelianSchemesAndArithmeticModuli (45), InverseGaloisAndArithmeticFundamentalGroups (48), FiniteFlatGroupsAndIntegralPadicHodgeTheory (50), NeronModelsAndSemistableAbelianVarieties (51);
- the open new roadmap EquivariantIntersectionTheory (#1685), whose suppliers are on main.

So it is placed before this roadmap (line 220) and is the earlier owner. SpringerResolutionAndCharacteristicCycles (line 258) appears there only as a consumer.

**History and padding.** PRREVIEW~1 R02 asked for exactly this citation. 433a91d and 94b4ba4 made it, and 8cbde9b undid it. Ownership aside, none of the sixteen declarations is a headline of this roadmap or needed to state one. The docstring (lines 65–68) itself says purity for multiplicative type is not statable. The sixteen are therefore an API catalogue.

**Repair.** Return to the 94b4ba4 design, keeping one correction from this head.
1. Delete §§7.13a–7.13e. In Suggested.lean delete `diagonalizableGroup` through `isMultiplicativeType_iff_etale_cartierDual` (lines 223–365), the four TauCeti imports at lines 4–7 and the docstring paragraph at lines 28–33.
2. Docstring lines 65–68 become: “there are no groups of multiplicative type over a base scheme at the pins (GroupSchemesOverABase §2.1 plans them), and no fppf cohomology of a group over a scheme with restriction maps”.
3. Restore the Scope bullet and the `### From TauCetiRoadmap.GroupSchemesOverABase` contract with the ids of 94b4ba4 (its lines 138–144 and 450–460): §§1.3, 1.4, 2.1–2.3, 2.7.
4. Repoint the *Needs:* lines to those ids: §7.14 to §§1.3, 1.4, 2.1–2.3, 2.7; §7.15 to §§2.1, 2.3; §§7.16, 8.2, 8.5 and 8.8 to §2.1; §8.11 to §§2.1, 2.3. Make the same change in the Layer 7 and Layer 8 Dependencies.
5. §7.14 Check 4 reads “(§§1.4, 2.3)”, and §7.14(b) cites “the largest subtorus of GroupSchemesOverABase §2.7”.
6. Keep this head's addition of SchemeAndStackFoundations §0.9 to the Scope bullet (line 95) and to the contract (line 311). §§0.3, 3.3 and 3.6 cite §0.9, and 94b4ba4 omitted it from both places.
7. Drop the entries used only by §§7.13a–7.13e:
   - SchemeAndStackFoundations §1.1;
   - the ModularCurves 0B and 0E sentences;
   - the Mathlib entries at lines 248–258;
   - the Tau Ceti entries at lines 280–294.

The pull request's merge-order paragraph then names GroupSchemesOverABase (#1522). Also restore line 279 to “GroupSchemesOverABase §2.1 extends them to a base scheme”.

Tested on the refuting instance:
- The dependency check on the 94b4ba4 README prints `depcheck: 239 roadmaps, 2426 edges, 0 problem(s)`.
- Each of `### 1.3`, `### 1.4`, `### 2.1`, `### 2.2`, `### 2.3` and `### 2.7` occurs exactly once in GroupSchemesOverABase at 6b17dff.
- Suggested.lean at 94b4ba4 is byte-identical to 433a91d, whose build and gate passed.

## R03 (P3) — gate `statement-hygiene`: three theorems conclude `Nonempty` of an isomorphism

**Location.** `TauCetiRoadmap/PurityForFlatCohomology/Suggested.lean` line 254 (`diagonalizableGroup_spec_iso`), line 262 (`diagonalizableGroup_pullback_iso`) and line 270 (`diagonalizableGroup_points_equiv`, “`Nonempty ((T ⟶ (diagonalizableGroup S M).X) ≃ (M →* (Γ(T.left, ⊤))ˣ))`”).

**Claim.** The gate rule forbids a theorem concluding `Nonempty (A ≅ B)` unless it is named `nonempty_*`. For the points statement the defect is also mathematical. README line 2110 promises a natural bijection that is compatible with the group structures. The Lean statement says only that two types are equinumerous.

**Witness.** The rerun of `gate … --base origin/main` prints `statement-hygiene=3 … FAIL` with these three lines. Any bijection of hom-sets, natural or not, satisfies line 270.

**Repair.** Applying R02 deletes all three. If they were kept, the gate's own repair would apply: state the canonical comparison as a real-bodied map with an `IsIso` theorem (no sorry'd data), or rename the theorem to `nonempty_*`. The points statement would also need naturality in `T` and multiplicativity.

## Previous findings

- **PRREVIEW~2 R01 (P2, `GSk.n` ids).** The stale ids are gone, but the requested repair has not survived: `grep 'GroupSchemesOverABase\|§GS'` finds nothing at this head. Commit 94b4ba4 applied the renumbering exactly as asked. Commit 8cbde9b then deleted the citations and planned the material here, which is R02 above. So the finding is superseded rather than repaired.
- **PRREVIEW~1 R02 (P3, §7.14 restating multiplicative type).** It was repaired at 433a91d and has regressed at this head (R02).
- **PRREVIEW~1 R01 and R03.** Their repaired passages are unchanged: the declared gaps at lines 371, 445, 464 and the §3.3 locator CS24 §5.1.11, p. 52, at line 1151.

## Verified sound

**Gate, dependency check, build, outside-folder diff.**
- The gate rerun at 8cbde9b reports every check 0 except `statement-hygiene=3` (R03).
- The dependency check with `--movable` prints `depcheck: 239 roadmaps, 2426 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean` exits 0 with exactly 22 `declaration uses 'sorry'` warnings and no error.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PurityForFlatCohomology'` is empty.

**Signatures.**
- I appended `#check @…` for all 32 declarations to a scratch copy and elaborated it once. All 32 elaborate, and the file has no section `variable`s, so no binder can be lost.
- Each elaborated type matches its README statement, except `diagonalizableGroup_points_equiv` (R03).
- Spot checks: `localPicard_torsion_eq_one` carries `IsNoetherianRing`, `IsCompleteIntersection` and `3 ≤ ringKrullDim R`. `etale_diagonalizableGroup_iff` carries `[Nonempty S]`. `diagonalizableGroupMap_bijective` carries `[ConnectedSpace S]`, which includes nonemptiness.

**One-tactic probe.** Every `sorry` in a scratch copy was replaced by `first | rfl | infer_instance | simp | decide | aesop`. All 22 fail; `isCommMonObj_diagonalizableGroup` (line 239) fails `infer_instance`. So nothing closes in one tactic. The padding verdict on the new declarations is in R02.

**Headline theorems.** The README lists `zariskiNagata_full_faithful_connected`, `zariskiNagata_isEquivalence`, `localPicard_torsion_eq_one`, `localPicard_subsingleton`, `frobeniusSemilinear_exists_fixed_basis`, `free_of_endomorphisms_iso_pi` and `isRegularLocalRing_uniqueFactorizationMonoid`. All are stated. The module docstring (lines 35–75) names, for each flat-cohomological headline, the missing carrier: fppf cohomology with supports and restriction maps, animated rings, prismatic Dieudonné modules, torsors under finite locally free groups, the Azumaya Brauer group, and `𝒪(1)` on `Proj`.

**Sources, the seeded sample.** CS24 is arXiv 1912.10932v3, C19 is arXiv 1711.06456v4, and pages are taken from the cache's page markers.

| Target | Source check |
|---|---|
| 0.3 | “Limit formalism for flat cohomology” is invoked in CS24's proof of Corollary 5.6.9 (line 3200, p. 76) and of Theorem 7.1.2 (line 3642, p. 87). The stalk formula is C19's proof of Theorem 6.1 (line 505, p. 13). SGA 4 VII 5.7 is not verifiable (below). |
| 0.4 | CS24 proof of Proposition 4.1.13 (lines 1665–1670, p. 40) and of Theorem 6.1.2 (lines 3467–3472, p. 83). Both use projective dimension `≤ 1` and decreasing induction along a regular sequence vanishing on `Z`, as the README's two-term form says. |
| 3.1 | Čes15 Lemma B.14 (line 1330, p. 33) gives the kernel `N = F`, with `F = j_*Hom(j^*e^*Ω, C)`. CS24's proof of Lemma 4.1.11 (lines 1615–1619, p. 39) cites it for the exact sequence. `C = J` when `J² = 0`, so the README's `Hom_B(e^*Ω^1_{G/B}, J)` is the same module. |
| 3.6 | CS24 Theorem 5.5.2 (line 2893, p. 69) and Corollary 5.5.3 (line 2939, p. 70), with hypotheses as stated. |
| 5.1 | (6.1.1.1) is at line 3432 (p. 82), §4.2.1 at line 1680 (p. 41) and (4.2.7.1) at line 1759 (p. 43). The normalisations of Convention 6 match Example 4.2.2 (lines 1694–1697). |
| 5.8 | CS24 Theorem 5.5.1 (line 2849, p. 68; any order of `G`) and Theorem 1.2.3 (line 220, p. 6). The `A[1/a]` step that CS24 takes from its Corollary 2.1.6 is covered by PerfectoidQuotients §0.6 `perfectoid_completely_etale_henselization` (#1042 README line 984: completions of ind-étale algebras). |
| 6.3 | CS24 Theorem 6.2.4 (line 3540, p. 84; proof lines 3549–3554, p. 85) and Theorem 1.3.1 (line 288, p. 8). The route, ending at `ℤ/p` on a hypersurface, matches. |
| 7.12 | CS24 Theorem 7.2.5 (line 3765, p. 90) and its proof. The proof prints “`n ≥ 0`”, recorded in the Notes on the sources. Theorem 1.1.3(b) is at line 92, p. 3. |
| 7.13 | CS24 Remark 7.2.6 (lines 3780–3793, p. 90): `R = S^{sh}⟦x, y⟧/(xy)`, `#Br(U_R) = ∞`, `Br(R) = 0`, and the Segre variant. The README's “smooth plane cubic” is the precision that makes `S` a complete intersection (source issue below). The route's unowned input is R01. |
| 7.14 | CS24 proof of Theorem 7.2.8 (lines 3852–3853, p. 92), “realizing `T` as the kernel of a morphism between tori”. |
| 7.15 | CS24 Theorem 7.2.8 (lines 3828–3845, pp. 91–92), footnotes 26–27 (lines 3833, 3879) and the proof (lines 3849–3869). The README's hypotheses, torsion convention and route match. |
| 7.16 | CS24 Theorem 7.2.9 (lines 3871–3878, p. 92), footnote 28 (line 3882) and the proof on p. 93 (lines 3887–3893, citing Gro68a 1.4 = §7.9(a)). |
| 8.5 | C19 proof of Theorem 6.1 (lines 497–518, p. 13): `H^q_Z(X, T) = 0` for `q ≤ 3` via the local-to-global sequence, étale-local splitting, the coniveau sequence and Theorem 5.3. |
| 8.6 | C19 Theorem 6.1 (lines 493–496, p. 13): bijective for `q ≤ 2` and injective for `q = 3`. |
| 8.9 | C19 Theorem 6.2 with condition (6.2.1) (lines 520–522, p. 13) and the proof with Mayer–Vietoris (6.2.2) (lines 527–535, p. 14). |

- 7.13b: the cited EGA IV₄ 17.5.1 (EGA44 line 2493) is the fibrewise smoothness criterion it is cited for.

**Supplier citations resolved.**
- The citation resolver's lead “PerfectoidQuotientsPartII §§Q5.2: no roadmap” is a false positive. PerfectoidQuotientsPartII is the board package listed at `ORDER.txt` line 219. Its design README has §§Q5.2, Q5.4, Q6.3–Q6.7, Q7.1, Q7.3 and Q10.1 at lines 109, 141, 249–315, 357, 439 and 765.
- The seven Lean-name leads all resolve:
  - `DerivedDeRham.cohenFactorization`, `absoluteCompleteIntersection` and `ordinaryFlatnessFromCompleteFlatness`: DerivedDeRhamCohomology (#868) README lines 366, 423 and 548;
  - `Prismatic.FlatCohomology.perfectDieudonneComparison` and `pContinuity`: PrismaticCohomologyPartIII (#1070) lines 107 and 124;
  - `SchemeBrauerGroup.toCohomologicalBrauer`: SchemeAndStackFoundations on main, line 4479;
  - `VanishingCycles.finiteEtaleGaloisCategory`: EtaleCohomologyFoundations on main, line 203.
- ModularCurves 0B, 0E and 4D are on main (lines 280, 386, 1165) and unchanged at the open revision #1808 (lines 370, 489, 1288). SchemeAndStackFoundations §§0.9, 1.1 and 2.9 are on main (lines 848, 2071, 3582).
- The overlap tool reports no dropped id, and none was found.

**Declared gaps.** `design/plan.json` declares `prismatic-dieudonne-perfectoid` (PrismaticCohomologyPartII Layer 4), `ci-defect-additivity` (DerivedDeRhamCohomology §0.21) and `regular-tower-tilt` (PerfectoidQuotientsPartII §Q10.1). The README states the same slugs at lines 464, 371 and 445. Each is minimal:
- DerivedDeRhamCohomology §0.21 at #868 (line 411) states Avramov's criterion but not the additivity of the defect;
- PrismaticCohomologyPartII at its head has no finite-locally-free Dieudonné equivalence over perfectoids;
- PerfectoidQuotientsPartII §Q10.1 builds the towers but does not compute their tilt.

**Ownership against open roadmaps.**
- `roadmaps grep 'IsMultiplicativeType|diagonalizableGroup|def IsTorus|smooth_diagonalizable'` hits only #1522 (22 lines) and this pull request (R02).
- EtaleDualityAndPerverseSheavesPartII (#1743, `ORDER.txt` line 380, later than this roadmap) says at its README lines 23 and 1570 that it owns the local Lefschetz theorem (its §7.3) and local duality (§6.12), and that this roadmap's §1.6 consumes them. Its Part I (#1040, line 102) has neither. This roadmap's position is the correct one by merge order: its Scope (lines 164–165) owns §§1.4–1.5 and names that roadmap as the importer. So nothing changes in this folder; #1743 must cite §§1.4–1.5 here.
- SchemeAndStackFoundationsPartII (board design, line 257) is in the same position for Layer 3 and §7.10, as the package rounds settled (REV-PKG~2).

**The new §§7.13a–7.13e mathematics.** The mathematics itself is correct on every instance I computed (table). The defect is ownership, not truth.

**Adversarial table** (the sampled targets, the headlines, the new declarations and the targets of findings).

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.3 continuity and stalk formula | `X_λ = Spec k′ → Spec k^s`, `G = μ_n`, `n` invertible; `k = ℚ`, `n = 2` | `colim k′^×/k′^{×n} = 0 = H^1(k^s, μ_n)`; the stalk of `ℋ^1_X(−, μ_2)` is `0` while `H^1(ℚ, μ_2) = ℚ^×/ℚ^{×2} ≠ 0` | holds; the strict henselization is needed | none |
| §0.4 regular-sequence vanishing | `A = k[x_1, x_2]`, `Z` the origin; `Z = Spec A` | `H^0_Z = H^1_Z = 0`, `H^2_Z(A) = k[x_1^{−1}, x_2^{−1}]x_1^{−1}x_2^{−1} ≠ 0`; on `Z = Spec A` no regular element vanishes, and `H^0_Z = A` | sharp; the vanishing hypothesis is needed | none |
| §3.1 square-zero sequence | `𝔾_m` over `k[ε]/ε²`; `𝔽_2[ε]/ε³`, `J = (ε)` | kernel `1 + kε ≅ (kε, +)`; `(1 + ε)² = 1 + ε² ≠ 1` but `2ε = 0`, so the map `1 + x ↦ x` is not an isomorphism | `J² = 0` needed | none |
| §3.6 descent modulo `p` | `ℤ_(p) → ℤ_p` | reduction mod `p`: `𝔽_p = 𝔽_p`, so the Čech nerve is an fpqc hypercover mod `p`; `H²_{(p)}(ℤ_(p), μ_p) = ℤ/p = H²_{(p)}(ℤ_p, μ_p)` | consistent with §3.5 | none |
| §5.1 Dieudonné side | perfect `A`, `ξ = p`; `G = ℤ/p`, `μ_p`; `A = 𝔽_p`, `𝔽̄_p` | `ℤ/p`: `V = φ^{−1}`, `H^0 = A^{φ=1}` is `𝔽_p` for both; `H^1 = A/(φ − 1)A` is `𝔽_p`, resp. `0`. `μ_p`: `V = pφ^{−1} = 0`, `V − 1 = −1`, complex `0`; `μ_p(A) = 1` (reduced) | matches Convention 6 and CS24 Example 4.2.2 | none |
| §5.8 arc descent | `G` étale of order prime to `p`; `A′ = ℤ_p⟨t⟩` | arc descent of étale cohomology; `(A′/p)_red = 𝔽_p[t]` is not perfect, so §2.1 does not apply | perfectoid terms needed | none |
| §6.3 étale purity below `vdim` | `R = 𝔽_p⟦x,y,z,t⟧/(x², y², xz − yt)`; `R = k⟦x,y⟧/(x,y)²` | `vdim = 4 − 3 = 1`, `U_R ≠ ∅` (dim 2), `H^0_𝔪(ℤ/p) = ker(ℤ/p → ℤ/p) = 0`; `vdim = 2 − 3 = −1`, `U_R = ∅`, `H^0_𝔪 = ℤ/p`, nothing claimed | holds | none |
| §7.12 Brauer purity | `W(k)⟦x,y,z⟧` (regular, dim 4); `S^{sh}⟦x,y⟧/(xy)` (CI, dim 3) | `Br(U_R) = Br(R) = Br(k)`; the dim-3 CI has `Br(R) = 0`, `Br(U_R)` infinite, excluded by `≥ 4` | thresholds right | none |
| §7.13 sharpness | cone over the plane cubic `E` (`dim S = 2`); Segre cone (`dim S = 3`) | `dim R = 2 + 2 − 1 = 3`, resp. `4`; `Pic(U_S)_tors ⊇ (Pic E/ℤ[𝒪(1)])_tors ⊇ E[n]` for all `n`, infinite; cone over an elliptic normal curve of degree `d`: `d(d − 3)/2` quadrics against codimension `d − 2`, a CI only for `d = 3, 4` | statement right; route input unowned | R01 |
| §7.14 kernel of tori | `T = μ_n`; `𝔾_m × μ_n`, `m = n`; `m = 1` | `L ≅ ℤ^n`, `K` of index `n`; `[n] = (s ↦ (s, 1)) ∘ ((t, ζ) ↦ t^n)` since `ζ^n = 1`; `m = 1` gives `S = T`, not a torus | holds | ids only (R02) |
| §7.15 degrees `≤ 2` | regular dim 2 with `𝔾_m`; the `A_1` surface | `Br(R) ≅ Br(U_R)`; `Pic(U_R) = ℤ/2 ≠ 0 = Pic(R)`, excluded by geometric parafactoriality | hypothesis needed | ids only (R02) |
| §7.16 higher degrees | the node `xy − zw`, `T = 𝔾_m`, `d = 3` | `H^1(R) = 0 ≠ ℤ = H^1(U_R)`; the node's strict henselization has class group `ℤ`, so it is not factorial and is excluded | hypothesis needed | ids only (R02) |
| §8.5 vanishing `q ≤ 3` | `Z = V(x) ⊂ 𝔸²`; strictly henselian regular dim 2 | `H^1_Z = coker(k^× → k^× x^ℤ) = ℤ ≠ 0`, so codimension one is excluded; `H^0_𝔪 = H^1_𝔪 = 0` (Hartogs), `H^2_𝔪 = Pic(U)/Pic(R) = 0`, `H^3_𝔪 = H²(U, 𝔾_m) = 0` (§8.1) | holds | none |
| §8.6 purity for tori | `𝔸²_ℂ ∖ {0}`; `ℝ⟦x,y⟧` with the norm-one torus | `Br′ = Br′(𝔸²_ℂ) = 0`; `H^1(U, T) = H^1(ℝ, T) = ℝ^×/N(ℂ^×) = ℤ/2` | consistent with §8.3 Check 3 | none |
| §8.9 codimension-one description | Dedekind `X`; `X = Spec K`; `ℙ¹_ℝ` with the norm-one torus | unramified classes; empty intersection `= H²(K, T)`; a nonzero class with zero generic restriction (C19 (6.3.3)) | (6.2.1) needed | none |
| `zariskiNagata_full_faithful_connected` | `k⟦x,y⟧`; `k⟦x,y⟧/(xy)`; a field | `vdim = 2`, `U` irreducible, so connected; `vdim = 1`, `U` = two punctured lines, excluded; `vdim = 0`, `U = ∅`, not `ConnectedSpace`, excluded | hypothesis needed | none |
| `zariskiNagata_isEquivalence` | `A_1`; the node | `vdim = 2`, `π_1^ét(U) = ℤ/2 ≠ 1`, excluded; `vdim = 3`, covers extend (SGA 2 X 3.4) | threshold sharp | none |
| `localPicard_torsion_eq_one` | node; `A_1`; Veronese cone `n = 3` | `Pic(U) = ℤ`, torsion-free; dim 2, excluded; `vdim = 6 − 6 = 0`, not a CI, `Pic(U) ⊇ ℤ/2`, excluded | hypotheses needed | none |
| `localPicard_subsingleton` | field; DVR; `k⟦x,y⟧` | `U = ∅`, one class; `U = Spec K`, `Pic = 0`; factorial, `Pic(U) = Cl = 0` | holds in every dimension | none |
| `frobeniusSemilinear_exists_fixed_basis` | `M = K`, `F = cφ`; `M = 0`; `K = 𝔽_3(t)^{perf}`, `F = tφ` | `x^{p−1} = c^{−1}` solvable; empty basis; `x² = 1/t` has no solution (value group `ℤ[1/3]`) | algebraic closure needed | none |
| `free_of_endomorphisms_iso_pi` | `Rⁿ`, `r = n`; `0`; syzygy `Ω` of `(x,y,z)` over `k⟦x,y,z⟧` | hypothesis holds; holds; `End Ω ⊇ R·id` as a summand, so `End Ω ≅ Ω²` would force a free summand of `Ω`, and `Ω ≅ R²` | consistent | none |
| `isRegularLocalRing_uniqueFactorizationMonoid` | `k⟦x,y⟧`; `ℤ_p⟦x⟧`; `A_1` | UFD; UFD; `xz = y²`, not a UFD and not regular | holds | none |
| `diagonalizableGroup` / Check 3 | `M = ℤ`; `ℤ/4 ↠ ℤ/2` | `Spec 𝒪_S[t^{±1}] = 𝔾_m`; `A[ℤ/4] → A[ℤ/2]`, `t ↦ s`, is `μ_2 ↪ μ_4` | contravariant, as stated | R02 |
| `smooth_diagonalizableGroup_iff` | `ℤ/2` over `𝔽_2`; `S = ∅`; `ℤ` over `ℤ` | `2 = 0`, `μ_2` non-reduced, both sides false; `Γ = 0`, both true; order `1`, both true | holds | R02 |
| `etale_diagonalizableGroup_iff` | `ℤ/6` over `ℤ[1/6]`; `ℤ`; `S = ∅`, `M = ℤ` | both true; relative dimension `1`, both false; LHS true and RHS false, excluded by `[Nonempty S]` | hypothesis needed | R02 |
| `flat_…_of_injective` | `2ℤ ⊂ ℤ`; `ℤ ↠ ℤ/2`; `0 → M` | squaring, flat; `μ_2 ↪ 𝔾_m`, closed, not open, so not flat; `D(M) → S` flat | injectivity needed | R02 |
| `diagonalizableGroupMap_bijective` | `Spec k`; `Spec(k × k)`; `∅` | `End 𝔾_m = ℤ`; `ℤ²`, excluded; one map against many `φ`, excluded by nonemptiness in `ConnectedSpace` | holds | R02 |
| `IsMultiplicativeType` / `IsTorus` | `μ_n` over `ℤ`; `α_p`; norm-one torus over `ℝ`; `𝔾_m ⊔ μ_2` over `Spec(k × k)` | MT, not a torus for `n ≥ 2`; dual `α_p` not étale, not MT; torus split by `Spec ℂ`, invariants of `ℤ_sign` are `0`, not diagonalizable; MT, not diagonalizable (the fibres differ) | definitions discriminate | R02 |
| `isMultiplicativeType_iff_etale_cartierDual` | `μ_p`, `α_p`, `ℤ/p` over `𝔽_p`; `ℤ/2` over `ℤ[1/2]` | dual `ℤ/p` étale, MT; dual `α_p`, neither; dual `μ_p` not étale, `ℤ/p` not MT; `≅ μ_2`, dual étale | holds | R02 |
| §7.13e Check 3 | `V(2(t − 1)) ⊂ μ_2` over `ℤ` | `2(ts − 1) = 2s(t − 1) + 2(s − 1) = 0`; fibre `1` over `ℚ`, `μ_2` over `𝔽_2`, not flat | a non-MT subgroup, as claimed | R02 |
| `diagonalizableGroup_points_equiv` | `M = ℤ`, `T = 𝔾_m` | `Hom_S(𝔾_m, 𝔾_m)` and `Γ(𝔾_m)^×` are equinumerous, and so is any reshuffling of them | the Lean statement is weaker than the README's | R03 |

## Not verifiable

- [Bou78] IV Lemme 5.1 and V Corollaire 4.9 (settled uncertified), cited for §7.13. They were read only through CS24 Remark 7.2.6 (lines 3785–3790).
- SGA 3 VIII 1.1–3.4, IX 1.1, 2.7, 2.11 and X 4.3–5.7 (settled uncertified), cited for §§7.13a–7.13e and §7.14. The statements were checked by the computations in the table, not against the text.
- SGA 4 VII 5.7 (settled uncertified), the route of §0.3.
- [Gab04b] Conjectures 2–3 (settled uncertified), cited for §§7.6 and 7.12. They were read only through CS24 lines 91 and 3764.

## Source issues

- **Gap** in CS24 at Remark 7.2.6, p. 90: the source says the local ring at the vertex of the affine cone over an elliptic curve over ℂ is a complete intersection; it should specify an embedding as a plane cubic or as an intersection of two quadrics in ℙ³, since cones over elliptic normal curves of degree ≥ 5 are not complete intersections; affects nothing.
