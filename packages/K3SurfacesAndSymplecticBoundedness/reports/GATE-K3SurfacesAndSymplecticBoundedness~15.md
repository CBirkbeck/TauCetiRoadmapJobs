# GATE-K3SurfacesAndSymplecticBoundedness~15: answers to the review of head 14c5246

One review (CBirkbeck, 2026-10-26T08:31:48Z) with four numbered findings. Findings 1 and 2 each make several distinct points, so the review splits into seven points, H01–H07. Repair commit: `28714c31` ("review repairs (split Chern contract; exponential comparison shared with K3Surfaces K1)"). It changes only `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md` (+14/−3). `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — applied differently

The README now separates out the part of gap:integral-topology that ComplexKahlerGeometry K4.P covers, but it cannot consume K4.P by name. K4.P exists only in the open revision of ComplexKahlerGeometry at head 1c03b0e. On main (cc774fe), ComplexKahlerGeometry K4 runs from line 445 to 568 with no exponential sequence, and K5 starts at line 569. A revision of a roadmap already on main is cited as that roadmap on main, so the requirement stays a ComplexKahlerGeometry Part II contract, which K4.P fulfils once merged.

Old README line 196 was a single paragraph. It is now lines 196–208: an "Exponential comparison" bullet (line 198) and an "Intersection adapter" bullet (line 199). The first bullet covers exactly K4.P's content: exp(2πif), Pic_hol ≅ H¹(Oˣ), the connecting map as integral c₁, pullback naturality, e_j=e_i g_ij and O(1) of degree +1. It says this is the comparison K3Surfaces K1 consumes, constructed once. The second bullet is the extra c₁(O(D))=PD[D] and cup-evaluation=intersection step that K4.P does not provide. Line 13 (Scope) now records this ownership.

## H02 (CBirkbeck) — answered

The README now states the transitive order by section, without pull-request numbers (line 74): ComplexKahlerGeometry's exponential comparison → K3Surfaces K1 → §§1.3, 3.1 and 4.4. The PR description is outside this job's files. Since #1234 revises an existing roadmap, it is not a declared supplier here. It reaches this roadmap only through K3Surfaces (#1285): K1 uses the comparison at line 52 of #1285's head 43784f8, and line 21 lists K4.P in that roadmap's own supplier table. The worker may add "#1234 K4.P → #1285 K1 → here" to the description's merge order as an integration note.

## H03 (CBirkbeck) — applied

The README previously had no statement applying K4.P's conditional Pic ≅ H² (which needs H¹(O)=H²(O)=0) to a K3; a grep for Pic≅H² found none. A guard is added at line 198: a K3 has H¹(O)=0 and h²(O)=1, so c₁ is injective with image ker(H²(X,ℤ)→H²(X,O)), and the conditional identification does not apply. The Check at line 206 is the witness: b₂=22, while ρ ≤ h¹¹ = 20.

## H04 (CBirkbeck) — answered

The README already states the GroebnerGeometry chain at line 233 (line 222 at the reviewed head): ReflectionInvariantTheory §1 and GroebnerGeometry G1 → McKaySkewGroup §§7.0–7.1 → §7.2 → gap:tame-quotient-singularities → §§6.1–6.1a. G2–G6 are stated as supplying no premise. Verified at McKaySkewGroup head a9ef22a (GG1 named at line 1110, used in §7.1 at line 1145) and GroebnerGeometry head 163d43c (G1 at lines 63–103). The dependency and merge lists are in the PR description, outside this job's files: the worker adds #899 G1 → #223 §§7.0–7.1 → #223 §7.2 → here.

## H05 (CBirkbeck) — answered

The README already states IndexTheory I7.3 → K3Surfaces K1 → K3Surfaces K2 → the complex/Betti applications, and names IndexTheory as a transitive supplier (line 74). Adding #1077 to the description's "must merge first" list is a PR-description edit, left to the worker.

## H06 (CBirkbeck) — answered

No change here, and the review says this is not blocking. "Downstream consumers" (line 1443) already defines the generic prefix of §6.0b (line 776 up to "Rank-five K3 pencils", line 889) as the interface for NeronModelsAndSemistableAbelianVarietiesPartII §§2.1, 2.3, 2.5, 4.1–4.2, 4.7–4.8 and 4.16–4.17. All these section headings exist at #870 head e974688. No supplier contract of this roadmap names the companion, and the dependency check reports 0 problems, so there is no reciprocal edge. Adopting the prefix is an edit to #870.

## H07 (CBirkbeck) — answered

No change is needed. This is an observation that earlier replies contained requests to edit descriptions; the reviewer treated them as data. The README contains no process text, and the gate's round-label and residue counts are 0.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Exponential comparison: exact segment H¹(O)→Pic→H²(ℤ)→H²(O) | ℙ¹; elliptic curve E; a point; K3 | ℙ¹: H¹(O)=H²(O)=0, Pic≅H²(ℤ)≅ℤ. E: H¹(O)=ℂ, so c₁=deg has kernel Pic⁰≅E (not injective) and H²(O)=0 (onto ℤ). Point: Pic=0=H². K3: H¹(O)=0 (injective), h²(O)=1 (not onto) | Using only the exact segment is necessary; E rules out general injectivity | Stated "only the exact segment is used in general" |
| Sign of the connecting map with e_j=e_i g_ij | O(1) on ℙ¹ with frames x₀, x₁; z=x₁/x₀ | g₀₁=z, so local sections satisfy s_i=g_ij s_j; the logarithm of z gains +1 around the positive loop; ⟨c₁(O(1)),[ℙ¹]⟩=+1. Inverse cocycle gives −1 | Pinned | Check at line 205 |
| Čech cocycle (δu)_ijk=u_jk−u_ik+u_ij | e_k=e_j g_jk=e_i g_ij g_jk | g_ik=g_ij g_jk, so u_ij+u_jk−u_ik ∈ ℤ | Consistent with the frame convention | Kept |
| K3 image of c₁ | complex K3 | rank H²(X,ℤ)=22; h⁰²=1; h¹¹=20, so ρ≤20<22 | The unconditional Pic≅H² fails, since it would force ρ=22 | Guard sentence at line 198; Check at line 206 |
| Intersection adapter: cup-evaluation = intersection | two lines in ℙ²; a quartic hyperplane | ⟨c₁(O(1))²,[ℙ²]⟩=1=H·H; (−c₁)² also gives 1; quartic H²=4 | Squares do not detect the sign; the degree on a curve does | Check at line 207 |
| Transitive order exponential comparison → K3Surfaces K1 → §§1.3, 3.1, 4.4 | K3Surfaces head 43784f8 | Supplier table line 21 lists K4.P; K1 line 52 uses the exponential/Chern comparison; §1.3 composes with K1; §3.1 needs K1–K2; §4.4 uses the K1 (1, 1) image | True | Line 74 |
| "Base K3–K4 have no exponential sequence" | ComplexKahlerGeometry on main cc774fe | "exponential" occurs only at lines 1564–1566, for Lie-group exponentials; K4 spans lines 445–568 | True at main | Line 196 |

## Ownership and citations

- I searched every roadmap on main and the 367 open roadmap PR heads for divisor Chern-class/Poincaré-dual ownership (`roadmaps grep`). Two related results exist, neither of which owns the analytic adapter:
  - EtaleDualityAndPerverseSheaves (same author) has an étale cl(D)=c₁(O(D)) target and a Thom-class Check.
  - MotivesAndAlgebraicCycles has a curve cycle-class statement.

  ComplexKahlerGeometry stays the owner of both bullets. K4.P belongs to that same owner, so there is no ownership conflict.
- `roadmaps resolve` on the README finds no unresolved cross-roadmap citations and no unresolved Lean names. The worker's six Lean-name leads were declarations of `Suggested.lean`; the pinned Lake packages were not visible to the resolver on this host.
- No notion moved down from a later roadmap.

## Lean signatures

`Suggested.lean` is unchanged. I compared the nine declarations in the worker's elaborated `signatures.md` against their README statements, at lines 269–271 (§1.1), 298 (§1.2), 439, 453, 563, 588, 610 and 639. Each matches in generality and hypotheses, and the file has no `variable` block, so no binder can drop. The "group" elaboration error in `signatures.md` is a false lead: the extractor read the words "class group" in the docstring of `geometricPicardRank` (line 138) as a `class` declaration.

## Build

`lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested` printed "Build completed successfully (9040 jobs)". The only warnings were six "declaration uses `sorry`", at lines 96, 108, 122, 146, 155 and 167.

## Gate

`gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`--movable`): `depcheck: 55 roadmaps, 638 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.

## Sources

No new source was cited and no text was fetched. `needs-references.toml` was not created.
