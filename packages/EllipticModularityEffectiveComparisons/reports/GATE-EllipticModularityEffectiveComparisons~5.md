# GATE-EllipticModularityEffectiveComparisons~5: answers to the human review of `3e1809c`

The review (CBirkbeck, 2026-11-08T01:07:45Z) has one finding, F01, and a "Source issues" note. Together they make four distinct points:
- the re-plan of EllipticCurveModularityPartII (H01);
- `README.md` line 1696 is stale against the consumer's contract EC.0–EC.6 (H02);
- the double ownership now reaches the Lean carrier `GeometricTorsion` (H03);
- the bilu-parent-rebolledo line 768 source note (H04).

The "Previous findings" list restates F01 as R01 and records R02 as repaired, so it adds no further point. The review contains no instruction addressed to the worker beyond its findings.

One commit: `aa5fb55` "EllipticModularityEffectiveComparisons: review repairs (downstream consumers restated against ErdosProgressionPowers EC.0–EC.6 and three other consumers)". It touches `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md` only, with 2 insertions and 2 deletions. `Suggested.lean` is byte-identical to `3e1809c`.

## H01 (CBirkbeck) — answered

The duplication holds at the current heads. Inside this folder, the planning rules allow no repair that leaves a roadmap, so the decision between the review's two options stays with a human.

**Every section has a counterpart in the sibling.** Checked section by section at EllipticCurveModularityPartII head `95f7c2f`:
- Layer 0 corresponds to §§1.1–1.4.
- Layer 1 corresponds to §§2.1–2.2.
- Layer 2 corresponds to §§1.5–1.7, with the same definitions of F, G and H (sibling lines 235, 253, 271).
- Layer 3: §§3.1–3.6 correspond to §§3.1–3.3, §3.7 to §4.1, §§3.7a–3.10 to §4.2, §§3.11–3.16 to §§4.3–4.6, §3.17 to §4.7 and §3.18 to §4.8.
- Layer 4: §4.0 corresponds to §5.1, §§4.1–4.7 to §5.0a, §§4.8–4.17 to §5.0b, §§4.18–4.20 to §§5.2–5.3, and §§4.21–4.22 to §§5.5 and 5.4.
- Layer 5:
  - §5.0 corresponds to §6.1, §5.1 to §5.0a, and §§5.2–5.3 to §6.0g.
  - §§5.3a–5.7 correspond to §6.0f. That is Bilu–Parent–Rebolledo Theorem 1.1 with the Gaudron–Rémond bound and the Gross-vector criterion.
  - §5.8 corresponds to §6.10, §5.9 to §6.2, §5.10 to §6.4, §§5.11–5.13 to §§6.5–6.6, §§5.14–5.17 to §§6.7–6.9, and §5.18 to §6.11.
  - §§5.19–5.20 correspond to §§6.0a and 6.12, §§5.21–5.23 to §§6.13–6.15, §5.24 to §6.16, §§5.25–5.27 to §§6.0b and 6.17, and §5.28 to §6.18.

**What is not shared is only route detail.** The generalized Jacobian J₀(p)♯ of §5.4a is a route step inside the Gross-vector criterion, which the sibling's §6.0f owns ("Prove the Gross-vector nonvanishing criterion and its rational-point exclusion for 11≤p<10¹⁴"). No headline of this folder is absent from the sibling.

**Importing would leave nothing here.** The binding rule (imported, never planned again) applied in-folder would therefore leave this roadmap with no target of its own. Closing either pull request and re-pointing consumers are actions outside this folder.

**Under the merge order as it stands, the sibling is the owner.**
- The merge order lists EllipticCurveModularityPartII at line 194, ErdosProgressionPowers at 195 and this folder at 284.
- Four roadmaps cite the sibling:
  - ErdosProgressionPowers (head `4b475b9`), lines 80 and 646–657;
  - AdelicImagesAndModularCurves (head `9037f3d`), lines 343 and 404–405;
  - EllipticCurvePeriodsAndModularParametrizations (head `7a356fe`), lines 92, 299 and 1838;
  - FaltingsFinitenessAndIsogenyTheoremsPartII (head `f49680f`), lines 13, 132 and 364.
- `roadmaps grep --fixed EllipticModularityEffectiveComparisons` finds this folder's name elsewhere only in prose lists: ModularSymbolsPadicLFunctions line 2695, FaltingsFinitenessAndIsogenyTheorems line 2928 and EllipticCurveModularityPartII line 1058.

**What keeping this folder would require.** Besides re-pointing the four consumers:
- this folder would have to take over the sibling's §1.8 majorants and the minimal period subvariety of its §6.0f, which FaltingsFinitenessAndIsogenyTheoremsPartII consumes. Neither occurs in this README: "majorant" occurs only in a remark at line 464, and "period subvariety" and "A_ω" occur nowhere before this commit.
- it would also move to just after its last supplier. That supplier is AnabelianGeometryAndNonabelianChabauty at merge-order line 172, as the review says. The other supplier positions are 166 (EllipticCurveModularity), 163, 162 and 160.

## H02 (CBirkbeck) — applied

`README.md` line 1696 (Downstream consumers) is rewritten against the consumers' text at their current heads, and the same stale claim is repaired at line 11.

**Line 1696.**
- Old: "The contract “Required effective modular comparisons” EC.0–EC.5 of ErdosProgressionPowers, used in its Layers 1–6, … these are the theorems of Layers 0–5 here, with the same hypotheses. ErdosProgressionPowers cites EllipticCurveModularityPartII … as the supplier of EC.0–EC.5. …"
- New: "ErdosProgressionPowers consumes these comparisons through its supplier contract “From TauCetiRoadmap.EllipticCurveModularityPartII”, seven items labelled EC.0–EC.6, and cites EllipticCurveModularityPartII, which plans the same results under its own layer numbering, as their supplier." It then gives each item's counterpart here:
  - EC.0 is §0.16, EC.1 §1.6, EC.2 §§2.1–2.3, EC.3 §3.17, EC.4 §§4.21–4.22 and EC.5 §5.28;
  - EC.6 is §4.0 (`GeometricTorsion`, `torsionModule`, `torsionRepresentation`).
- Two differences are now stated:
  - EC.2's numerical majorants (sibling §1.8) are not stated here;
  - EC.6's `FullRationalTwo` is stated here in place, as the condition that the rational points killed by two number four.
- The other consumers are added:
  - AdelicImagesAndModularCurves cites sibling §§5.0a–5.0b, 6.0b and 6.0f;
  - EllipticCurvePeriodsAndModularParametrizations cites §§5.0a–5.0b;
  - their counterparts here are §§4.7, 5.1, 4.17, 5.25 and 5.3a;
  - FaltingsFinitenessAndIsogenyTheoremsPartII cites §6.0f for the isogeny bound (§5.3a here) and for the minimal period subvariety, which has no counterpart here.

The old quoted title no longer occurs in ErdosProgressionPowers (0 matches at `4b475b9`). Its contract heading is line 644, and its table (lines 651–657) has the seven rows EC.0–EC.6.

**Line 11, same pattern.**
- Old: "Layers 0–5 supply the effective residual comparisons used by continuations of EllipticCurveModularity."
- New: "Layers 0–5 develop effective residual comparisons beyond the end of EllipticCurveModularity; the roadmaps that consume such comparisons, and the supplier they cite, are listed under Downstream consumers."

No roadmap consumes them from this folder (the grep under H01), so the old sentence was stale in the same way.

## H03 (CBirkbeck) — answered

The overlap in `Suggested.lean` is real, but it is a consequence of H01 and is resolved with it.
- **Identical code.** `GeometricTorsion`, `torsionModule` and `torsionRepresentation` (lines 149–179) are code-identical to the sibling's `Suggested.lean` lines 174–198. Diffing the two blocks without docstrings leaves only our interposed `CyclicIsogenyDegree`.
- **Fully qualified names differ.** Ours is `TauCetiRoadmap.EllipticModularityEffectiveComparisons.GeometricTorsion` and the sibling's is `TauCetiRoadmap.EllipticCurveModularityPartII.GeometricTorsion`.
- **No import is possible.** A roadmap's Lean file imports only the pinned libraries, and the pinned Tau Ceti has no Galois `Representation` on torsion. Its only torsion `Representation` is `TauCeti.Isogeny.Hom.torsionRepresentation` of End(E) (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Torsion.lean` line 132). The Galois action is `WeierstrassCurve.torsionGaloisAction` into `AddAut`.
- **Every roadmap stating on geometric torsion declares it locally.** ErdosProgressionPowers line 657 itself "restates the predicate locally as `HasFullRationalTwoTorsion`".
- **Removing ours removes the headlines.** Deleting our declarations would remove the headlines stated on them:
  - `rational_two_uniform_irreducibility` and `full_two_uniform_irreducibility`;
  - `split_normalizer_exclusion`, through `SplitNormalizerImage`, and `proper_image_nonsplit`, through `NonsplitNormalizerImage`.

  That is the H01 decision, not a separate repair. Line 1696 now names the correspondence EC.6 ↔ §4.0.

## H04 (CBirkbeck) — answered

No edit is needed: `README.md` §5.4a already avoids the source's O_K-level claim. bilu-parent-rebolledo line 768 asserts finite order for every section of the identity component over O_K.
- **Line 1304.** It descends z to ℚ and adds: "The group of sections of the identity component over O_K itself is infinite when K is real quadratic, since the toric part contributes O_K^×; the descent to ℚ replaces that general assertion."
- **Line 1320.** Its Check pins this: the argument uses only z̄=−w_p z and 𝔾_m(ℤ)={±1}.
- **Instance.** p=17, K=ℚ(√2): 1+√2∈O_K^× has infinite order, while 𝔾_m(ℤ) has 2 elements. Both README lines are unchanged since `3e1809c`; the source passage was re-read at bilu-parent-rebolledo lines 764–771.

## Build, gate and dependency check

- `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested`: "Build completed successfully (9205 jobs)". The only warnings are the 14 "declaration uses `sorry`", at lines 79, 84, 93, 104, 118, 135, 182, 188, 194, 201, 238, 246, 256 and 265.
- Gate at `aa5fb55` (exit 0): `gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- `--depcheck --movable` (exit 0): `depcheck: 243 roadmaps, 2456 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The new consumer mentions add no supplier edge.
- `roadmaps resolve` on `README.md`: no cross-roadmap citation and no Lean name found nowhere.

## Lean signatures

`Suggested.lean` is unchanged (`git diff 3e1809c HEAD` on it is empty). The worker's `signatures.md` lists the elaborated types of these exact bytes: 24 declarations, 0 with a dropped section binder. The file has no `variable`, `include` or `set_option` line. No new `#check @name` file was elaborated, because no Lean statement changed. The README's backticked names added at line 1696 (`GeometricTorsion`, `torsionModule`, `torsionRepresentation`) are declared at lines 149, 160 and 165 (gate `readme-ids-missing=0`).

## Ownership, citations and sources

- No construction was added; the change corrects claims about consumers.
- Every cited consumer and supplier section was read at the head given in this brief: the four consumers listed under H01, and EllipticCurveModularityPartII at `95f7c2f`, §§1.8, 5.0a–5.0b, 5.1, 6.0b and 6.0f.
- Ownership against open work was checked with the sibling checkouts and `roadmaps grep` over main and the 476 open heads.
- No notion moved down, and no later roadmap is cited as a supplier.
- No source was added, and `needs-references.toml` was not written.

## Adversarial pass

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Line 1696: EC.0 ↔ §0.16 | N=11, 23, 35 | g=1, 2, 3 gives 12g=12, 24, 36 against N+1=12, 24, 36: equality at all three, as §0.16's equality set requires. EC.0 is the inequality alone; §0.16 adds the equality case under the same N>0 | counterpart, with §0.16 stronger | stated |
| Line 1696: EC.1 ↔ §1.6 | hypothesis lists; p=2, M₀=11 | Both lists: ℓ≥3 prime, E[ℓ] irreducible, p≠ℓ, p∥M, ℓ∣v_p(Δ_min). (√2+1)^((11+1)/6)=3+2√2≈5.83, so ℓ∈{3,5} on both sides | same hypotheses | stated |
| Line 1696: EC.2 ↔ §§2.1–2.3, no majorants here | N=11 | F♯=(√2+1)²≈5.83 and F_K=(12/6+1)²=9. I(44)=72, so G♯=(√12+1)²=13+4√3≈19.93 and G_K=(72/6+1)²=169. The majorant inequality is a separate, strict statement here | sibling §1.8 has no counterpart here | stated |
| Line 1696: EC.3 ↔ §3.17 | hypothesis lists | Both: full rational 2-torsion, ℓ≥5, irreducible of Serre weight 2, prime-to-ℓ conductor N, ℓ>H(N). Both conclude F/ℚ of conductor exactly N with full 2-torsion and F[ℓ]≅E[ℓ] | same hypotheses | stated |
| Line 1696: EC.4 ↔ §§4.21–4.22 | ℓ=7 and ℓ=11 with one rational 2-point | 2·7=14 is in §4.17's list (≤19), so ℓ=7 is not covered on either side. 2·11=22 is not in the list, so ℓ=11 is covered on both sides | thresholds 11 and 5 agree | stated |
| Line 1696: EC.5 ↔ §5.28 | hypotheses | p>37 prime, non-CM, cyclic isogeny of degree n>1 on both sides | same | stated |
| Line 1696: EC.6 ↔ §4.0 and full two-torsion in place | Lean bodies; y²=x³−x, y²=x³−2x, y²=x³+x+1 | Both `GeometricTorsion` bodies are `AddSubgroup.torsionBy (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point (n : ℤ)`. `FullRationalTwo` equals our hypothesis at `Suggested.lean` line 203. Rational 2-torsion cardinalities are 4, 2 and 1 | identical carrier; predicate stated in place | stated |
| Line 1696: AdelicImages/EllipticCurvePeriods counterparts | prime list; non-CM list; composite list; j-sets; bound at d=1 | The prime list has 12 values {2,…,163} (§4.7). Removing 19, 43, 67 and 163 (CM discriminants −19, −43, −67, −163, §5.1) leaves 8 values, the sibling's `noncm_prime_isogeny_degrees`. The composite list has 19+7=26 values (§4.17), the "twenty-six values" of AdelicImages line 2256. The j-sets at 11, 17 and 37 have sizes 3, 2 and 2 and are identical to sibling §6.0b (§5.25). At d=1, h≤985 the bound is 10⁷·985²=9,702,250,000,000 (§5.3a) | all counterparts exist | stated |
| Line 1696: no counterpart for the minimal period subvariety | README before the commit | 0 occurrences of "period subvariety", "minimal period" or "A_ω" | none here | stated |
| Line 1696: "None of these consumers supplies … to this roadmap" | supplier contract headings | none of ErdosProgressionPowers, AdelicImagesAndModularCurves, EllipticCurvePeriodsAndModularParametrizations or FaltingsFinitenessAndIsogenyTheoremsPartII appears among the contracts (lines 36–124). FaltingsFinitenessAndIsogenyTheorems, which is cited, is the base roadmap, not its Part II | holds | stated |
| Line 11: consumers listed below, none consuming from here | `roadmaps grep --fixed` over main and 476 heads | 3 prose mentions (lines 2695, 2928 and 1058 of three READMEs) and 0 supplier citations | old "used by continuations" stale | repaired |
| H03: pinned Galois torsion representation | Tau Ceti pin | only `TauCeti.Isogeny.Hom.torsionRepresentation` (End(E)) and `WeierstrassCurve.torsionGaloisAction` (into `AddAut`) | local carrier needed for a headline | none |
| H04: O_K sections not all torsion | p=17, K=ℚ(√2) | 17≡1 mod 8, so 17 splits. 1+√2 has infinite order against 𝔾_m(ℤ) of order 2 | README already descends to ℚ | none |

No passage in the review or in the files read was suspicious.
