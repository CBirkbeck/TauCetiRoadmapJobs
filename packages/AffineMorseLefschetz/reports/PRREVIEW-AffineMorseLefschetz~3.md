# Review of AffineMorseLefschetz (pull request #1764 at b26efdb)

**Verdict:** accepted

Full re-review of the repaired head (286 changed lines since f332df5). The previous review's seven findings were checked one by one first; the whole folder was then reviewed again. No P1 or P2 finding; three P3 notes. No file of the pull request was changed; the diff outside `TauCetiRoadmap/AffineMorseLefschetz` is empty.

## Status of the previous review's findings

| Previous | Passage at this head | Status |
| --- | --- | --- |
| R01 (P1) corner rounding unowned | README.md:854–876 "Own the rounding of this edge here (Douady, Arrondissement des arêtes, Définitions 1–2 … Théorème 1 …)": θ, the polar map, the rounded cut K' on the same underlying space, the two faces and their collars, uniqueness up to a diffeomorphism fixing E and any closed set disjoint from it, the nested-cut comparison as continuous maps; :134–139 corrects the GeometricTopology contract to "gluing along boundary pieces (which produces corners)" and "Layer 4 … owns the rounding"; :886–887 "the rounded models constructed above"; :928–932 Needs cites the edge rounding with Douady. Three new Checks :906–919 compute the half-plane instance the previous review asked for. | Repaired. The statement matches Douady at its locators (see Verified sound); only the page numbers are off (R01 below). |
| R02 (P3) Hatcher 3.35 page | :1491 "Theorem 3.35, p. 245". | Repaired. |
| R03 (P3) Milnor 6.3 | :455–456 "Corollary 6.2, Lemma 6.3, Assertion 6.4, Lemma 6.5 and Theorem 6.6, pp. 33–36". | Repaired. |
| R04 (P3) O(d) is K7.2 | :125–129, :300–301, :1458–1459, :1471. | Repaired. |
| R05 (P3) Layer 5 build order | §5.3 root extension, §5.4 rational extension, §5.5 completed lists, §5.6 band transfer and pulling, §5.7 projection, §5.8 projective pairs; §5.5 Needs §§5.3–5.4 (:1164–1166), §5.6 Needs §5.5 (:1199), §5.7 Needs §§5.3–5.6 (:1266), §5.8 Needs §§5.1–5.7 (:1307–1309), §5.1 "uses §§5.2–5.7 below" (:981); §4.1 :692 and §§6.1–6.2 repointed to 5.8. | Repaired, with one residue (R03 below: the lifting theorem exported in §5.3 names §5.4/§5.5 objects). |
| R06 (P3) notation | :781 "d^k=(−1)^(k+1)δ, with δ the coboundary"; :88 "Dividing the paired sum by 2 instead of 4"; "FourManifolds'" :283, :627, :894; AlgebraicTopology/GeometricTopology/CharacteristicClasses written in full throughout (grep for bare AT/GT/CC/DG: only the Hatcher URL). | Repaired. |
| R07 (P3) stale consumers | Nothing to change in this folder; RealAnalyticGeometry on main (:28, :185–194) still carries the reverse claims and the old anchor. | Not actionable here, as the previous review said. |

## R01 (P3) — Douady page numbers are PDF pages, not the exposé's

**Location:** `README.md:855` "Définitions 1–2, p. 2, and Théorème 1, p. 3", `:869` "(Théorème 1, parts a and b)", `:908–909` "Proposition 1, p. 5", `:929–930`, `:1496–1498`.

**Witness:** douady line 20: the page carrying Définitions 1–2 (extraction page 2) is printed "3-01"; Numdam's record (line 8) lists the exposé as pp. 1–25. Théorème 1 is at line 61 (extraction page 3, printed 3-02) and Proposition 1 at line 108 (extraction page 5, printed 3-04). The README's numbers are the PDF page numbers, each one more than the exposé's own.

**Repair:** write the exposé's pagination: "Définitions 1–2, p. 3-01 (p. 1), Théorème 1, p. 3-02 (p. 2), Proposition 1, p. 3-04 (p. 4)", in the four places and in the References entry.

## R02 (P3) — Codimension of the edge in ∂K', and "map of triads"

**Location:** `README.md:864–865` "meeting exactly in E, which is a smooth codimension-two submanifold of ∂K'"; `:871–872` "the inclusion K_c⊂K_(c') is a continuous map of triads".

**Claim:** E = ∂₀K ∩ ∂₁K has dimension m−2, ∂K' has dimension m−1, so E has codimension one in ∂K' (it is the common boundary of the two faces) and codimension two in K'. In the README's own Check (:906–912, M a half-plane, m = 2) E = S⁰ is two points in the circle ∂K': codimension one. Douady's Définition 1 (line 28–30) and AlgebraicTopology 6.4 (AlgebraicTopology README.md:1536) both say "codimension 2" relative to the manifold, not its boundary. Separately, the inclusion K_c ⊂ K_(c') sends ∂₀K_c into ∂₀K_(c') but ∂₁K_c = {ρ̃ = c} into the interior of K_(c') ∪ ∂₀K_(c'), not into ∂₁K_(c') = {ρ̃ = c'}; it is a map of pairs (K_c, ∂₀K_c) → (K_(c'), ∂₀K_(c')), and the cut faces are compared through the excision zigzag of §4.1 (:637–642), as the next sentence (:872–874) in fact says.

**Repair:** "E, a smooth codimension-two submanifold of K' and the common boundary of the two faces in ∂K'"; and "the inclusion K_c⊂K_(c') is a continuous map of pairs (K_c,∂₀K_c)→(K_(c'),∂₀K_(c')), a smooth embedding off E_c, whose cut faces are compared by the excision zigzag of §4.1". Tested on the half-plane Check: E = {(0,±1)} ⊂ ∂K' ≃ S¹, codimension one; K_1 ⊂ K_2 with ∂₁K_1 = {t² + ψ(s) = 1} in the interior of K_2 away from s = 0.

## R03 (P3) — The lifting theorem exported in §5.3 names objects of §§5.4–5.5

**Location:** `README.md:1029–1048` "Expose a parametrized finite compact lifting theorem. … Export as definitions the first subdivision's vertex orders, the per-simplex completed lists L(σ), their face restriction maps ρ, the E_l extension maps of §5.4, and the second subdivision's distinguished vertices of §5.5"; `:1064–1066` "*Needs:* §5.2 frontier preparation; RealAlgebraicGeometry Layer 4 root continuity; compactness …".

**Claim:** The statement of this theorem mentions the completed lists, restriction maps, E_l maps and distinguished vertices that §§5.4–5.5 define, and its proof is §§5.4–5.7, but §5.3's Needs line lists neither. This is the pattern the previous review's R05 asked to remove (a target whose statement needs a later subsection), left in place by the reorder; §5.1 handles the same situation correctly with "The triangulation uses §§5.2–5.7 below".

**Repair:** either move the paragraph :1029–1048 to the end of §5.7, where the lift's projection property is exported and every object it names exists, keeping in §5.3 only the root extension and the inductive-lift construction; or add to :1064 "the completed lists and restriction maps of §5.5, the extension maps of §5.4 and the pulling triangulation and projection of §§5.6–5.7 for the exported theorem", as §5.1 does. Tested on the interval instance of §5.5's Checks: the exported list L([0,1]) for the constant gap [0,1] is {0, aux, 1} with aux the §5.5 auxiliary section (values 1 at the opposite vertex, 0 at the top vertex), an object that §5.3 alone cannot name.

## Verified sound

**Gate and build.** The worker's gate at this head reports every check 0 (build=0) and OK. `lake env lean TauCetiRoadmap/AffineMorseLefschetz/Suggested.lean` from the worktree elaborates with exactly six `declaration uses 'sorry'` warnings at lines 55, 63, 69, 81, 110, 129 and nothing else. Manifest pins mathlib f6090c70 and TauCeti 358314d4 match the checked-out packages. The folder contains README.md, Suggested.lean, metadata.toml, PROGRESS.md and STATUS.md (gate stray-files=0). No `set_option`, no sorried data, no `lemma`, no `#eval`, no process words, no LaTeX delimiters.

**Dependency check** (`gate --depcheck … --movable` against ORDER.txt and main 929496d4) printed exactly

```text
depcheck: 205 roadmaps, 1661 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap and every supplier it names (ComplexKahlerGeometry, MorseTheory, GeometricTopology, RiemannianGeometry, AlgebraicTopology, DifferentialGeometry, CharacteristicClasses, RealAlgebraicGeometry) are on main; the only open-pull-request roadmaps it mentions (FourManifolds, RealAnalyticGeometry's revision) are consumers.

**Signatures.** `#check @name` for all nine declarations on a scratch copy reproduces the worker's signature list exactly; no section binder is lost (the two definitions carry no finite-dimension instance, as README.md:319 says; the three index bounds carry `[FiniteDimensional ℂ V]`; both manifold theorems carry `T2Space`, `SecondCountableTopology`, `IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ M`). README generality equals Lean generality for §1.1 (lines 55–74), §2.3 (81–90), §3.1 (97–122) and §5.1 (129–143).

**Padding probe.** Each sorried theorem was replaced on the scratch copy by `first | rfl | simp | infer_instance | exact ⟨⟩ | (intros; simp_all) | sorry`: the five bounds and CW theorems end with unsolved goals (`simp` only rewrites `n − q ≤ dim P` to `n ≤ dim P + q`), and the triangulation theorem reaches `sorry`. Nothing closes in one tactic; by reading, none restates a definition, mirrors a Check or computes a value. `qPositiveLeviInCharts` and the two Layer-1 definitions have real bodies on native carriers and occur in headline types.

**Headline inventory** (unchanged from the previous head: Lean file untouched).

| README headline | Suggested.lean |
| --- | --- |
| A1 negative-subspace, strict and q-positive index bounds | Stated, lines 55–74. |
| A2 closed holomorphic embedding CW bound | Stated, line 81. |
| A3 q-positive proper exhaustion CW bound | Stated, line 110. |
| A4.0 four noncompact dualities, compact-pair comparison | Not statable (no locally finite chains or Borel–Moore homology at either pin); docstring 19–21. |
| A4.1 finite marked-family triangulation | Stated, line 129; refined lift and complement duality not statable, docstring 22–26. |
| A5, A6, A0 | Not statable: `grep -rl 'instance.*TopologicalSpace (Projectivization' Mathlib/` at the pin finds nothing, so the projective pair has no topology; docstring 17–18, 27–31. |

**Pinned declarations opened** (file:line at the pins): `TauCeti/Analysis/Calculus/Morse/Index.lean:76` `hessianQuadraticForm`, `:81` its application lemma, `:148` `morseIndex f x = sigNeg (hessianQuadraticForm f x)` with the docstring "value zero in infinite dimensions"; `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean:98` `sigNeg Q = sigPos (−Q)`; `TauCeti/Analysis/Calculus/Sard/EqualDimension.lean:65` `addHaar_image_eq_zero_of_not_surjective_fderivWithin`; `TauCeti/Geometry/RealAlgebraic/Semialgebraic/Basic.lean:68` `IsSemialgebraic`; `Mathlib/Analysis/Convex/SimplicialComplex/Basic.lean:59` `SimplicialComplex`; `Mathlib/Analysis/Convex/Intrinsic.lean:61` `intrinsicInterior`; `Mathlib/Algebra/Homology/Embedding/Basic.lean:257–258` `embeddingUpIntLE` with degree map `n ↦ p − n`; `Mathlib/Geometry/Manifold/Immersion.lean:190/801` `IsImmersionAt`, `IsImmersion`; `Mathlib/Topology/CWComplex/Classical/Basic.lean:167/183` `cell`.

**Cross-roadmap citations.** Main is at the same commit (929496d4) the previous review resolved every citation against, so every main-side resolution recorded there stands; I re-opened the ones the repair touched: AlgebraicTopology README.md:1534–1557 `compactTriadPoincareLefschetz` ("common codimension-two edge (rounded from the GT corner model)", "nested rounded cuts", "AffineA4.0 consumes this single compact triad theorem"); GeometricTopology README.md:99–105, :201–212, :277–279 (corners, gluing along a boundary piece produces corners; no rounding statement anywhere in the file, grep for round/straighten/corner); ComplexKahlerGeometry README.md:1444–1452 K7.2 (tautological O(−1), dual powers O(k), H⁰(O(k)) as degree-k polynomials); RealAnalyticGeometry README.md:28, :185–194 (consumer, stale reverse claims). `roadmaps resolve`: no unresolved citation or Lean name. No roadmap on main or at an open head cites this roadmap's Layer 5 by subsection number, so the renumbering breaks no consumer (`roadmaps grep` for `AffineMorseLefschetz … 5.[0-9]`: nothing).

**Ownership of the rounding.** On main nobody states the rounding of an index-two edge (grep of `TauCetiRoadmap/` and `Completed/` for Douady, straightening, arrondissement: nothing). Among open pull requests, TangentialBordism (rev/942 README.md:288–294) rounds the corner of a product M×N and of a gluing, HomotopySpheres (rev/1287 :1863, :1901) and the GeometricTopology revision (rev/903 :1888) use corner rounding; this roadmap is on main and may cite none of them (an open pull request is an upward supplier for a roadmap on main, and a revision is never a dependency), so owning the exhaustion-cut case here, with the compact-edge uniqueness from Douady, is the right placement, as the previous review's repair prescribed. Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep`.

**Douady at its locators** (douady = 1299f660, extraction page = exposé page + 1). Définition 1 (lines 28–30): an "arête" is a codimension-two, index-two submanifold without relative boundary. The function θ (lines 31–35): an increasing diffeomorphism of (0,π/2) onto (0,π) with θ(π/2−α) = π−θ(α), and the polar map (ρ,α) ↦ (ρ,θ(α)) from the quarter disc onto the half disc, a diffeomorphism off the origin: README.md:855–858 states exactly this. Définition 2 (lines 41–47): the rounded manifold is V∖X glued to the associated (2,1)-tube along the polar map; Remarque (1) (lines 50–51): same underlying space, identity a diffeomorphism off X: README.md:858–862. Théorème 1 (lines 61–66): X a compact edge; (a) any two roundings are diffeomorphic; (b) for a closed G disjoint from X the diffeomorphism can be the identity on G ∪ X: README.md:867–869. Proposition 1 (lines 108–112): the half-ball rounded along S^(n−2) is diffeomorphic to the ball: README.md:908–909. The face and collar clauses (:863–867) are this roadmap's own targets, not Douady's statements, and the README does not attribute them to him.

**Milnor and Hatcher at their locators.** milnor 65731a25 (two printed pages per extraction page): Corollary 6.2 line 5571 (p. 33), Lemma 6.3 line 5875 (p. 34), Assertion 6.4 line 6051 (p. 35), Lemma 6.5 line 6170 and Theorem 6.6 line 6203 (p. 36), Theorems 7.1–7.2 lines 6628, 6651 (p. 39), Corollary 7.3 line 7098 (p. 41), Theorem 7.4 line 7199 (pp. 41–42): all as cited at README.md:364, :447, :455–456, :478, :502, :1335, :1362, :1484–1487. hatcher bebb3032 (extraction page = printed + 9, line 10362 running head "Section 3.3 239"): Theorem 3.35 line 10637 under page 254, printed 245 (:1491); Theorem 3.43 lines 10976–10978 under page 263, printed 254, compact R-orientable with ∂M = A ∪ B, ∂A = ∂B = A∩B (:831, :1492).

**Adversarial pass.** One row per statement; values on both sides. Rows marked (new) were not in the previous review.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| Levi normalisation :52–55, :87–89 | Hessians diag(2,2), diag(2,−2), [[2,2],[2,2]], [[0,2],[2,0]] at v=(1,0),(1,1),(1,2) | (q(v)+q(Jv))/4 = 1,2,5 / 0,0,0 / 1,2,5 / 0,0,0 | Retain: off-diagonal real parts cancel in the J-pair, Levi depends on the Hermitian part only |
| §0.2 coefficient space (sampled) | N=2,d=2; N=3,d=2; N=0,d=0,1 | dims 3, 6, 1, 0 | Retain |
| §0.2 evaluation Check | p=2X₀²+3X₀X₁+5X₁² at (1,2) | a+2b+4c = 28; ∂₀ = 2a+2b = 10 | Retain |
| §0.4 Euler identity (sampled, new) | p=X₀³+X₀X₁² (d=3), v=(1,i) | J=(2,2i), Jv = 2+2i² = 0 = 3p(v) = 0 | Retain |
| §0.4 full rank bound | X₀,X₁ on ℂP² at [0:0:1]; X₀² on ℂP¹ | rank 2, dim 3−1−2 = 0; rank 0 so no submanifold conclusion (locus still {[0:1]}) | Retain: full rank is sufficient only (:73–75) |
| `finrank_negative_subspace_le_complex` (sampled headline) | w ∈ W∩JW, w = Jw' | B(w,w)<0 and B(w',w')<0 give B(w',w')+B(Jw',Jw')<0 against Levi>0; so W∩JW = 0 and 2·dim W ≤ 2n | True; symmetry unused |
| Same, sharpness | diag(6,−2), W = y-axis | B(i,i) = −2, Levi (6−2)/4 = 1, dim W = 1 = n | Bound attained |
| `morseIndex_le_complex_finrank` | V = 0; f=3x²−y² | index 0 ≤ 0; Levi 1, sigNeg 1 ≤ 1 | Retain; `sigNeg` is the maximal negative-definite finrank at the pin |
| `morseIndex_le_complex_finrank_add` | n=2,q=1, diag(6,−2,−2,−2); q=n, P=0 | Levi diag(1,−1), P first axis, index 3 ≤ 3; index 2n = n+q | Retain; `hq` not needed for truth (q>n gives n−q = 0, bound ≥ 2n), a note |
| §1.1 pullback (sampled, new) | f=|w|², w=z³ at z=1; |z|⁶ Hessian | Hess diag(30,6), Levi 9 = |3|² | Retain |
| §1.1 product cross terms | f=g=|z|² at 1 | L(|z|⁴) = 4 vs L(f)g+fL(g) = 2 | Cross terms needed, as the Check says |
| §1.1 criticality | f=Re z, z=w+w² at 0 | Hessians 0, diag(2,−2); Levi 0, 0 | Retain |
| §1.2 q-convention (sampled, new) | |z₁|²+|z₂|²−|z₃|² on ℂ³ | Levi diag(1,1,−1): 2 = n−q positive, q=1; bound n+q = 4, actual index 2 | Retain |
| §1.2 J pairing | A=diag(1,−1); A=0 | J(1,0)=(0,1) swaps ±1; zero eigenspace whole space | Retain |
| §2.1 complex-bilinear form (sampled, new) | i(z)=(z,z³) at z=1: D²i(v,w)=(0,6vw) | B(1,1)=6, B(i,i)=−6, B(1,i)=6i; B(Jv,Jw)=−B(v,w) | Retain |
| §2.1 shape operators (new) | ν=(0,1), ν'=(0,i) at z=1 | S_ν=diag(6,−6), S_{ν'}=[[0,6],[6,0]] = J·S_ν; S_νJ = −JS_ν | Signs as displayed |
| §2.1 focal pairing | S_ν=diag(6,−6); flat plane | det(I−tS)=1−36t², t=±1/6; flat: none | Retain |
| §2.2 distance Hessian (sampled) | graph (z,z²), a=(0,c), c=0,½,1,−½ | Hess₀ diag(2−4c,2+4c) = diag(2,2), (0,4), (−2,6), (4,0); paired sum 4, Levi 1 in all cases | Retain; c=½ degenerate, c=1 index 1 as the Checks say |
| §2.2 Levi everywhere (new) | c=1, second critical point x=√½ (grad 0 numerically) | Hess diag(4,8), Levi 3 = ‖di(v)‖² = 1+4·½ | Identity 4‖di v‖² holds off critical points too |
| §2.2 properness | closed graph; ℂ*⊂ℂ | ρ₀ ≤ 2 ⇒ |z| ≤ 1; 1/k no limit | Closedness essential |
| `closed_holomorphic_embedding_cw_bound` (headline) | ℂ, ℂ*(zw=1), (ℂ*)², n=0, M=∅; ℂ²∖0 | models point, S¹, T², 0-cells, ∅: max cell dims 0,1,2,0 ≤ n; H₃(ℂ²∖0)=ℤ excluded by closedness | Retain |
| `qPositiveLeviInCharts` | |z|², q=0; −|z|², q=0/1; z=2w | P=ℂ, Levi 1; none / P=0; Levi 4, dim 1 | Retain |
| `q_positive_exhaustion_cw_bound` (headline) | ℂ*, ρ=|z|²+|z|⁻², q=0 | Levi 1+|z|⁻⁴ > 0, proper, bounded below; S¹ model, cells ≤ 1 | Retain |
| §4.1 chain carrier (sampled) | discrete ℕ; ray in ℝ; ([0,1],{0,1}) | ∏ℤ ≠ ⊕ℤ; ∂(Σ[k,k+1]) = −[0], H₀^BM(ℝ)=0; H₁ pair = ℤ = H₁^BM((0,1)), H₁((0,1))=0 | Retain |
| §4.1 zigzag | V⊂U open, L_s ⊂ V compact | excision needs L_s ⊂ int V: holds; towers degreewise surjective | Route closes |
| §4.2 refinement | ℝ, K_r=[−r−1,r+1], mesh ½; edge [−3,3] | intervals meeting K_r ⊂ (−r−2,r+2); [−3,3] ⊄ (−2,2) | Retain |
| §4.3 cancellation, twist | edges [0,1],[1,2]; o ↦ −o | +[1]−[1] = 0; (−o)⊗(−o) ↦ 1 | Retain |
| §4.4 cap sign and ε (sampled) | k=0 on [v₀,v₁], values a,b; ε_k, k=0..5 | ∂(σ⌢φ) = a[v₁]−a[v₀] = (b[v₁]−a[v₀]) − (b−a)[v₁]; ε = (1,−1,−1,1,1,−1), ratios (−1)^(k+1) | Retain; cochain map needs d^k = (−1)^(k+1)δ |
| §4.4 integer degree | point, j=1; U=ℝ, j=2 | H⁻¹ = 0 ≠ H⁰ = ℤ; H₂^BM(ℝ) = 0 = H⁻¹ | Retain |
| §4.5 four dualities (sampled) | [0,∞), m=1 | H⁰=ℤ=H₁^BM(M,∂M); H⁰(M,∂M)=0=H₁^BM(M) (ray has ∂ = −[0]); H_c¹=0=H₀(M,∂M); H_c¹(M,∂M)=ℤ=H₀ | Retain |
| §4.5 cut geometry (new) | M={s≥0}, ρ̃=t²+ψ(s), ψ=0 on [0,1], proper increasing after; c=1 | ∇ρ̃=(ψ'(s),2t) ≠ 0 on {ρ̃=1}; ρ̃|∂M = t², regular at ±1; K bounded since ψ proper; corners exactly (0,±1); near them K = E × quadrant since ρ̃(s,t)=ρ̃(0,t) for s≤1 | Hypotheses of the rounding paragraph hold on the Check's instance |
| §4.5 rounding Check (new) | K' = disc, ∂₀K' diameter, ∂₁K' arc | H⁰(K')=ℤ=H₂(K',∂K'); (K',∂₀K') and (K',∂₁K') acyclic (both faces contractible, K' contractible) so H⁰(K',∂₀K')=0=H₂(K',∂₁K') | Matches the triad formulas H^k(K,∂₀K)≃H_(m−k)(K,∂₁K) |
| §4.5 edge codimension (new) | same instance, m=2 | E = {(0,±1)}: dim 0; ∂K' ≃ S¹: dim 1; K': dim 2 | codim 1 in ∂K', 2 in K' (R02) |
| §4.5 θ and the polar map (new) | θ(α)=2α (the simplest admissible θ); inverse half-disc → quadrant at 0 | θ(π/2−α) = π−2α = π−θ(α); the inverse (r,β) ↦ (r,β/2) is homogeneous of degree 1 and not linear, so not differentiable at 0 | Check :913–917 correct: the nested inclusion is continuous, not smooth along E_c |
| §4.5 nested cuts (new) | K_1 ⊂ K_2 on the same instance | ∂₀K_1 ⊂ ∂₀K_2; ∂₁K_1 = {ρ̃=1} lies in K_2 ∖ ∂₁K_2 | "map of triads" overstated (R02); the excision zigzag is what §4.1 uses |
| §4.5 m=1 and ∂M=∅ (new) | M=[0,∞); M=ℝ | restriction to the 0-manifold ∂M: every attained value is critical, so a regular c is unattained and E=∅; ∂M=∅ gives E=∅, K'=K | Retain |
| §4.5 uniqueness use | two choices θ₁,θ₂, two tubes | Théorème 1(a),(b): diffeomorphism identity on E and on any closed set disjoint from E, so the four groups and cap maps agree | Retain |
| `finite_semialgebraic_triangulation` (sampled headline) | X=[0,1] marked (0,1),{0}; X=∅; mark {½} | edge interior and vertex are open simplices; faces=∅ allowed (`empty_notMem` only forbids ∅ as a face); subdivision at ½ forced | Retain |
| §5.1 dimension (sampled) | point, (0,1), ∅, closure of (0,1) | 0, 1, −∞, 1 | Retain |
| §5.2 shear (sampled, new) | p=y³−t²y+t, d=3; a=0,1,−1,2,½ | t³-coefficient after (y,t)↦(y+at,t) is H_p(a,1) = a³−a = 0,0,0,6,−3/8 | Retain: the bad set {0,±1} is finite, the good set open dense |
| §5.2 density | finite family | ∏H_{p_i}(a,1) is a nonzero polynomial in a | Retain |
| §5.3 root extension | t²−x on (0,1); (x+y)t−x at (0,0) | √x → 0, t² ≠ 0; limits ½ (x=y), ⅔ (x=2y), specialisation 0 | Hypothesis excludes the failure |
| §5.3 exported theorem (new) | interval, constant gap [0,1] | exported list {0, aux, 1} with aux of §5.5 | Statement needs §5.5 (R03) |
| §5.4 E_l (new) | r(v₀)=0, r(v₁)=1, α=½; λ=(½,½),(⅓,⅔),(0.99,0.01),(0.01,0.99) | E = ½, 7/11, 299/20198 → 0 = r(v₀), 19899/20198 → 1 = r(v₁) | Retain; weight w₀=λ₁ is attached to the facet opposite v₀, so the limits are right |
| §5.4 collapsed gap | [2,2+x], E∈[0,1] | height ∈ [2,2+x] → 2 | Retain, no 0/0 |
| §5.5 completed lists (sampled) | constant gap [0,1] on an interval; a=b on F_d; heights 0,x,1 at x=0 | I={x: 0<x≤1} ∋ 1; aux values (1 at F_d, 0 at v_d) ≠ b=(1,1); I=∅; restriction 0,0,1 nondecreasing, onto, not injective | Retain |
| §5.5 facet rule coherence | F_i ∋ v_d, F_id | ρ(x) ≠ a|F_id ⇒ a<ρ(x)≤b on F_id so aux^{F_i}_{ρ(x)} defined; else value a | Recursion on dimension well founded |
| §5.6 band map, pulling | point base [0,2]→[1,5]; a=0,b=x,A=2,B=2+x²; unit square least vertex (0,0) | 0,1,2 ↦ 1,3,5; t=x/2 ↦ 2+x²/2 → 2; triangles (0,0),(1,0),(1,1) and (0,0),(0,1),(1,1) meet in the diagonal | Retain |
| §5.7 projection (sampled) | graph edge (0,a)–(1,b); vertical edge; centre vertex (½,½) | (1−t)(0,a)+t(1,b) ↦ t both ways; vertical ↦ vertex 0; centre ↦ ½ ∉ base vertices | Endpoint-only rule needed |
| §5.8 projector and complement duality (sampled) | [1:0], rescale by 2; (S²,pt), n=1 | diag(1,0) with denominators 1,4; H₂ pair=ℤ=H⁰(ℝ²), H₁=0=H¹, ordinary H₂(ℝ²)=0 wrong | Retain |
| §6.1 weak Lefschetz | plane cubic, transverse line; U=∅; n=0 | H₀(A)=ℤ³→ℤ onto, relative H_j=0 for j<2; all 0; range empty | Degrees as Milnor 7.3 |
| §6.2 reversed function (sampled, new) | ρ=|z|²; ρ=3x²−y² at 0 | Hess(1/(1+ρ)) = diag(−2,−2), index 2 = 2n−0; diag(−6,2), index 1 = 2n−1 | Retain |
| §6.2 cellular pushing | r<n, cells of dim ≥ n | cellular approximation applies | Route closes |
| §7.1 Veronese (new) | d=3 on ℂP¹ at [1:2] | [1:2:4:8]: y₀y₂−y₁² = 0, y₁y₃−y₂² = 0, y₀y₃−y₁y₂ = 0 | Retain |
| §7.1 degenerate degrees | d=1; d=0; ℂP⁰ | identity, O(1); constant, not an embedding; one point | Retain |

## Not verifiable

- **bcr**: Bochnak, Coste and Roy, Real Algebraic Geometry (1998), §9.1 Proposition 9.1.2, Theorem 9.1.4, §9.2 Theorem 9.2.1. The DOI resolves only to the paywalled Springer book (the sources service: "DOI prefix 10.1007 belongs to a paywalled publisher"); the README calls these locator-only (:1502–1504). The Lean statement of §5.1 was checked against the standard form of the triangulation theorem, not against the text.
- **hain**: Notes on the Morse theory of complex manifolds; the author-page URL answers HTTP 403 through the sources service (recorded in the scratch `needs-references.toml`). Layers 1 and 3 cite it for the q-convention only; the mathematics of those layers was checked directly.
- **mark**: Thomas Mark, Math240 lecture of 7 December 2001; no URL and no legal copy found (recorded in `needs-references.toml`). Cited for background only; every statement of Layers 2 and 6 was checked against Milnor §§6–7.
- The package manifest records only Douady; Milnor and Hatcher were read from the cached extractions of earlier rounds.
- The full generality of §4.5 (arbitrary module-valued local systems, noncompact, collared boundary) and the recursive construction of §§5.3–5.7 are checked on the instances above and on their stated proof routes; the review does not claim to have proved them.

## Source issues

- none
