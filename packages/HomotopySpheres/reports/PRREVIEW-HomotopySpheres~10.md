# Review of HomotopySpheres (pull request #1287 at 0705b9a)

**Verdict:** needs changes

Incremental re-review of the 37 lines of `TauCetiRoadmap/HomotopySpheres/README.md` changed since `a4f5c1e` (the head of review r9), plus the two commits' round trip on `Suggested.lean`:3 (`OrientedAtlas` import at `55547a5`, reverted at `0705b9a`, net unchanged). Three findings remain, all carried from r9: the pin mismatch (P1), the double ownership against three later open roadmaps (P2) and the two supplier items that only open revisions define (P3). Four r9 findings are repaired, and the repairs introduced no new problem.

## R01 (P1) — `Suggested.lean` imports a module that main's Tau Ceti no longer has, while the README cites main's pin

**Location.** `TauCetiRoadmap/HomotopySpheres/Suggested.lean`:3: `import TauCeti.Geometry.Manifold.Orientation`. README:331–340 (`OrientedAtlas.lean` lines 283 and 129, `Basic.lean` line 32, `Preserving.lean` line 63), README:92–95 and :111–112 (`TauCeti.OrientedConnectedSum`, `TauCeti.dense_isRegularValue`), README:3095–3096 (`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`).

**Claim.** Unchanged since r9. The branch's `lake-manifest.json` still pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`, the merge base with main is `3e1dbca`, and the pull request does not touch the manifest, so the merge takes main's manifest, which at `3b3f7ef` pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`. At `2fd255d` the file `TauCeti/Geometry/Manifold/Orientation.lean` does not exist: `Geometry/Manifold/` has only the directory `Orientation/`. So the merged `Suggested.lean` fails at its third line. Conversely every Tau Ceti locator of the README is written at `2fd255d` and none of the connected-sum, Sard, degree or `Manifold.Orientation` declarations exists at `a91d3aa`, where the file is built now.

The repair of `55547a5` (import `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`) was the right one for main's pin; `0705b9a` reverted it because that module does not exist at the branch's own pin, where the gate builds. No module name provides `IsOrientedAtlas` and `orientationPreservingGroupoid` at both pins, so the import cannot be made pin-robust: the branch has to move to main's manifest.

**Witness.** `ls .lake/packages/TauCeti/TauCeti/Geometry/Manifold/` in the worktree (at `a91d3aa`) lists `Orientation.lean` and no `Orientation/`; the content checkout at `2fd255d` lists `Orientation/` (`OrientedAtlas.lean`, `Preserving.lean`, `Basic.lean`, …) and no `Orientation.lean`. The worker's signature run against main's pin failed on the missing `Orientation.olean`.

**Repair.** Rebase the branch onto main so that its manifest pins `2fd255d` / `1b1ccf4`, and restore `import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` at `Suggested.lean`:3. Checked by reading at `2fd255d`: `OrientedAtlas.lean`:283 `structure IsOrientedAtlas [NeZero n] (A : Set (OpenPartialHomeomorph M H)) : Prop` with the same three fields as `a91d3aa` `Orientation.lean`:332, and `orientationPreservingGroupoid` at :129 with `variable (I) in`; `Boundary/Charts.lean` exists at both pins with `boundaryChartedSpace`, `isManifold_boundary`, `isSmoothEmbedding_subtypeVal_boundary` at lines 195, 321 and 374. Not elaborated at main's pin: the brief allows Lean only in this worktree.

## R02 (P2) — Three later open roadmaps still own, at their heads, objects this roadmap owns

**Location.** README Layers 3B (James reduced product, word filtration, James map, connected James equivalence, stable James splitting), 4A.1–4B.8 (convenient category, stable `O`/`SO`, real Bott periodicity) and 7B–7C (Wall forms and formations, `L_n(ℤ)`).

**Claim.** r9's R02, partly repaired. The false consumer sentences and the three table entries are gone (README:3137–3149 and the table at :3162–3170 now name only FourManifolds, PositiveScalarCurvature and the consumers on main). But the three heads still own the same objects and none cites this roadmap, and the description still does not name them:

- GeneralAlgebraicKTheoryPartII (#1742, head `3f10248`, changed since r9): README:13 "The James reduced product with its word filtration …, the James map and the connected James equivalence, and the stable James splitting are owned here (§§4.30b–4.30c)"; heading `### 4.30b The James reduced product` at :1208.
- DGFloerPartII (#1799, head `4e506b6`, changed since r9): README:21–23 builds "the convenient category of compactly generated spaces … and the stable orthogonal groups with real Bott periodicity" itself; :70–72 owns 4.2a–4.2c; :90 consumes James from GeneralAlgebraicKTheoryPartII §4.30b; :110–111 "Bott periodicity is proved here in its real form".
- GeometryOfNumbersAndQuadraticArithmetic (#851, head `102e668`): README:104 "The Wall form and formation groups of §6.8 with their calculations are specified with the integral L-theory they feed".

**Witness.** `roadmaps grep HomotopySpheres` returns no line for #1742, #1799 or #851. ORDER.txt: HomotopySpheres line 72, DGFloerPartII 73, GeometryOfNumbersAndQuadraticArithmetic 74, GeneralAlgebraicKTheoryPartII 333.

**Repair.** The folder itself now needs no edit for this finding. Complete r9's repair outside it: the description names #1742, #1799 and #851 as consumers that must replace §§4.30b–c, Layer 1 with 4.2a–4.2c, and §6.8 by citations of 3B, 4A.1–4B.8 and 7B–7C. If instead the `dropped-names.txt` entry for `HomotopySpheres` ("names our roadmaps never cite as suppliers") is the intended policy, the consistent settlement is the reverse, HomotopySpheres after those three in the merge order and citing them, which is a human's decision; say which in the description.

## R03 (P3) — Two supplier items are defined only in open revisions the description does not name

**Location.** README:145–156, :434–445, :859–865 and the *Needs* lines citing "AlgebraicTopology Stage 4 item 8"; README:95–96 and :727–729 citing "GeometricTopology §1.4".

**Claim.** r9's R04, not repaired. The description's merge-order paragraph is unchanged (#860 → #861 → #1142 → #866 → #1077 → #948 → #942 → this pull request) and names neither AlgebraicTopology revision nor #1797. On main, AlgebraicTopology's Stage 4 has no item 8, and main's AlgebraicTopology README:115–118 still says HomotopySpheres §3A/§3A.1 owns the compactly generated adjunction and coreflection; item 8 exists only at #1663 (`8029fe9`) and #1652 (`4e825d6`). Main's GeometricTopology has no §1.4; the worker's overlap file lists it as defined only by #903 (`69d384f`) and #1797 (`11a9ca1`), and README:727–729 describes #1797's version (associativity of the native `TauCeti.ConnectedSum`), not #903's gluing-model sum.

**Witness.** `scratch/overlaps.md`: "GeometricTopology §1.4 (lines 96, 728): #903 … #1797 … that pull request must merge first". Main AlgebraicTopology README:116: "owns the pointed compactly generated suspension–loop adjunction" attributed to HomotopySpheres §3A.

**Repair.** Name #1663 (or #1652) and #1797 in the merge-order paragraph of the description as merging before this pull request. The README wording at :727–729 already identifies the native-sum version and needs no edit.

## Previous findings

- R01 — not repaired: `Suggested.lean`:3 still `import TauCeti.Geometry.Manifold.Orientation`; manifest still `a91d3aa`/`6b7abb3`; README locators at `2fd255d`. The `55547a5` repair was reverted by `0705b9a`. R01 above.
- R02 — partly repaired: README:3137–3149 no longer names GeneralAlgebraicKTheoryPartII, DGFloerPartII or GeometryOfNumbersAndQuadraticArithmetic, nor does the table; the three heads still own the objects and the description names none. R02 above.
- R03 — repaired: the gate now reports `dropped=0` at this head with the namespace lines unchanged (`HomotopySpheres` is still the first entry of `dropped-names.txt`, so the check now exempts a roadmap's own name).
- R04 — not repaired: the description's merge-order paragraph is unchanged. R03 above.
- R05 — repaired: README:617 "(Lemmas 6.10–6.12, pp.79–80)", README:630 "(Milnor, Theorem 6.6, p.71, and its proof, pp.73–84)". Both verified below.
- R06 — repaired: README:678 "both inclusion hypotheses fail: M₀=Sⁿ→D^(n+1) induces ℤ→0 on H_n, and ∅ misses the one path component"; README:679 adds the duality remark and "the hypothesis on M₁ holds exactly when π₁(M₁)=0". Verified below.
- R07 — repaired: README:251 "is an example"; README:3094–3096 "the manifold derivative of `e` carries the chosen `TauCeti.Manifold.Orientation` of `M` to the standard orientation of `S⁶` (`TauCeti.Manifold.Orientation.IsOrientationPreservingAt`)". `e.deriv` is gone.

## Verified sound

**Gate, dependency check and build.** My run of the push gate at `0705b9a`:

```text
gate HomotopySpheres: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 244 roadmaps, 2466 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The worker's gate records `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration at the branch's pin (`a91d3aa`/`6b7abb3`).** One `lake env lean` of a scratch copy of `Suggested.lean` with every `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide | exact Subsingleton.intro (fun _ _ => rfl)` and `#check @name` for all 19 declarations appended: all 16 admitted theorems still fail (12 type mismatches, 4 unsolved goals), so none is padding, and all 19 signatures printed. Compared with the README: `exists_diffeomorph_prod_Icc_of_hCobordism` keeps `5 ≤ n`, `T2Space`, `CompactSpace`, `IsManifold (𝓡∂ (n+1)) ∞`, `SimplyConnectedSpace`, the closed open `M₀` and both inclusion hypotheses; `sphere_parallelizable_iff` keeps `0 < n`; the eight Bott and four stem statements keep their range bounds; both recognition theorems keep T2, second countability, compactness and `IsManifold (𝓡 6) ∞`. No binder is lost; none of the three definitions depends on a section variable. The file is unchanged since r9 apart from the reverted import.

**Sources at the changed locators** (`milnor_hcobordism`, printed page = PDF page − 5).

| Target | Locator and finding |
| --- | --- |
| 1.2 basis change (README:583–584, "Theorem 7.6 … pp.92–97", changed from 92–96) | Theorem 7.6 at line 2418 (PDF 97 = p.92), hypotheses 2 ≤ λ ≤ n−2 and W connected as the README states; Lemma 7.7 at line 2483; "completes the proof of 7.6" at line 2564 (PDF 102 = p.97), followed by Theorem 7.8 at line 2565 on the same page, consistent with README:596 "pp.92, 97 and 100". Correct. |
| 1.5 (README:617, "Lemmas 6.10–6.12, pp.79–80") | Lemma 6.10 at line 2049 (PDF 84 = p.79), Lemmas 6.11–6.12 at lines 2054–2058, proof of 6.10 ends at line 2077 (PDF 85 = p.80). Correct. |
| 1.6 (README:630, "proof, pp.73–84") | Proof of Lemma 6.7 ends at line 2185 (PDF 89 = p.84); §7 starts at line 2187 (PDF 90). Correct. |
| 1.7 Check (README:679, "remark after Theorem 9.1, p.107") | Theorem 9.1 at line 2784 (PDF 112 = p.107); remark at lines 2791–2794: H_*(W,V)=0 ⇒ H^*(W,V′)=0 by duality ⇒ H_*(W,V′)=0. Correct. |
| 10.3 (README:3091–3098) | Route unchanged: Milnor 9.1 in dimension 7 (r9 table). The pointwise notion is `IsOrientationPreservingAt` at `2fd255d` `Preserving.lean`:63: an equivalence equal to `mfderiv I I' f x` carrying `o.orientationAt x` to `o'.orientationAt (f x)`, as the sentence says. |

The other seeded targets (1.1, 2.3, 5.0, 5.0b, 5.1, 8.2, 8.3, 9.1, 9.2, 9.7, 10.2) are untouched by the diff; r9's table covers 1.1, 2.3, 8.2, 9.2 and 10.2 at the source, and 5.0/5.1 and 9.2's Gray/Fomenko–Fuchs locators remain under Not verifiable.

**Adversarial table.** Rows for untouched statements cite r9; rows for changed passages carry computed values.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 1.7 Check, D^(n+1) with M₀ = ∂W (README:678) | n = 5 | h₀: H₅(S⁵) = ℤ → H₅(D⁶) = 0; h₁: π₀(∅) = ∅ vs π₀(D⁶) = {*} | Both fail, as now stated; R06 repaired |
| 1.7 Check, h₁ ⇔ π₁(M₁) = 0 given h₀ (README:679) | ⇐: H_*(W,M₁) = 0 by the duality remark; H₀ forces M₁ ≠ ∅ connected; Whitehead on CW-type spaces | homology iso + π₁ = 0 both sides ⇒ homotopy equivalence; ⇒: π₁(M₁) ≅ π₁(W) = 0 | Equivalence holds |
| same, negative control | W = contractible W′ (dim ≥ 6, ∂W′ = Σ a homology sphere with π₁ ≠ 0) minus an open ball, M₀ = Sⁿ | W ≃ Sⁿ so h₀ holds; π₁(W) = π₁(W′) = 0 by codimension; π₁(M₁) = π₁(Σ) ≠ 0 | h₁ fails exactly through π₁, as the Check says |
| 1.2 locator pp.92–97 | Theorem 7.6 start, end of proof | PDF 97 and 102, printed 92 and 97 | Correct |
| 1.5 locator pp.79–80 | Lemma 6.10 statement, end of proof | PDF 84 and 85, printed 79 and 80 | Correct |
| 1.6 locator pp.73–84 | end of proof of 6.7 | PDF 89, printed 84 (was 89) | Correct |
| 10.3 orientation sign | e orientation-reversing at one point of connected M | sign locally constant on M ≃ S⁶ connected ⇒ reversing everywhere; composite with the reflection x₀ ↦ −x₀ of S⁶ (degree −1) has sign (−1)(−1) = +1 | Pass |
| Downstream consumers (README:3137–3149) | FourManifolds (#936, ORDER 131); PositiveScalarCurvature (main) | FourManifolds cites HS 3C, 4B, 6B, 6C, 7A–7C, Layer 9 (its README:66–1965); both later than ORDER 72 or on main | Pass |
| Removed consumers | #1742, #1799, #851 at their heads | 0 citations of HomotopySpheres; own the objects at README:13, :21–23/:70–72, :104 | R02 |
| `Suggested.lean`:3 import | `a91d3aa` vs `2fd255d` | `Orientation.lean` present vs absent; `Orientation/OrientedAtlas.lean` absent vs present | R01 |
| `exists_diffeomorph_prod_Icc_of_hCobordism` (S⁵×I; D⁶; M₀ = ∅; S⁵×I minus a ball; n = 4) | r9 table rows 1–5 | r9 | Pass (unchanged) |
| 1.1 predicate, 1.3 trading, 1.4 Whitney, 1.6 level five | r9 | r9 | Pass (unchanged) |
| 2.2 descent and n = 1, 2 routes, 2.3 V_Σ/W_Σ and one-handle reading, 2.4 | r9 | r9 | Pass (unchanged) |
| 2.1 codes, 5.0 signed count, 5.1 Thom space, 6B E₈ matrix, 8.2 exactness, 9A.4 valuations | r9 | r9 | Pass (unchanged) |
| `sphere_parallelizable_iff`, 3C.5 divisibility | r9 (n = 1, 2, 3, 7, 8; r = 1, 2, 3, 4, 8) | r9 | Pass (unchanged) |
| Bott periodicity and the seven base entries | r9 (sharp instances at n−1) | r9 | Pass (unchanged) |
| fourth to seventh stems | r9 (sharp instances) | r9 | Pass (unchanged) |
| `smoothPoincareSix_oriented`, `nonempty_diffeomorph_sphere_six`, 10.2 | r9 | r9 | Pass (unchanged) |

**Library declarations opened** (file:line at the pin named).
- `2fd255d`: `Orientation/OrientedAtlas.lean`:129 `orientationPreservingGroupoid`, :283 `IsOrientedAtlas`; `Orientation/Basic.lean`:32 `def Orientation`; `Orientation/Preserving.lean`:63 `IsOrientationPreservingAt`; `Boundary/Charts.lean`:195/321/374. These are the README:331–345 locators and all are correct there.
- `a91d3aa`: `Orientation.lean`:178 `orientationPreservingGroupoid`, :332 `IsOrientedAtlas` (r9); no `Orientation/` directory; no `IsOrientationPreservingAt` anywhere in the tree.

**Cross-roadmap citations resolved this round.** FourManifolds at #936 (`46ee76a`, 19 citations of HomotopySpheres); PositiveScalarCurvature, GeneralizedCohomology, BordismFormalGroups, DGFloer, CharacteristicClasses, MorseTheory, GeometricCurrents on main (r9); GeneralAlgebraicKTheoryPartII #1742 (`3f10248`), DGFloerPartII #1799 (`4e506b6`), GeometryOfNumbersAndQuadraticArithmetic #851 (`102e668`) for R02; AlgebraicTopology #1663/#1652 and GeometricTopology #1797/#903 for R03. The conflict with #284 is a stated order (the description says this pull request carries #284's baseline).

**Remarks on untouched text (no change requested).** README:3096 "the standard orientation of `S⁶`" is the orientation 10.1 transports from the reference generator; no Tau Ceti `Manifold.Orientation` of a sphere exists at either pin (`Orientation/Inversion.lean` only proves that inversion in a sphere reverses orientation), so it is this roadmap's object, consistent with 10.1.

## Not verifiable

- R01's repair at main's pin: not elaborated, since the brief allows Lean only in this worktree, which pins `a91d3aa`.
- 5.0 and 5.1 (Milnor, *Topology from the Differentiable Viewpoint*, §7) and the Gray and Fomenko–Fuchs locators of 9.2: unchanged since r9; no legal text (r9).
- Ownership against open pull requests: checked through `roadmaps grep` and the heads named above; pull requests without supplied files were not searched beyond that.

## Source issues

- none
