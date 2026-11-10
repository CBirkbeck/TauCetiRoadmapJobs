# GATE-MorseNovikov~2: answers to the review of 2026-11-10 on the head 441ef0a

One comment (CBirkbeck, 2026-11-10T01:47:06Z), split into thirteen points. Repairs are in commit
`3a07f9f` ("MorseNovikov: review repairs (Hatcher/Dold and rt1 attributions corrected, §4.2
monomial pinned, locators tightened)"), on top of 441ef0a. It is not pushed.

## H01 (CBirkbeck) — answered

Confirmed. 441ef0a has parents e06d4d0 (the branch) and f8836c4 (main). The README's heading list
is identical to main's line for line, so every section number and the labels N1–N7 are main's.
All 73 lines the diff removes from main's README are lines re-wrapped to carry an added locator,
Check, supplier name or the new Lean names; no paragraph of main is dropped.

## H02 (CBirkbeck) — applied

The kept locators were checked against the texts (rt3 published pagination, rt2, rt1, Hatcher,
Dold's table of contents), and three of them are now tighter. README §4.4: "the rank-k free
extension is rt3 §3, p. 227" → "rt3 §3.4, p. 227" (rt3 line 1054–1089). §6.4: "rt1 Example 1.9,
p. 863, proved there through its Lemma 2.6" → "which credits it to Milnor and points to its
Lemma 2.6 for a proof" (rt1 line 80–82 has "Milnor observed (cf. [37] or Lemma 2.6)"). Conventions:
"(rt3 §1.1, p. 210)" → "pp. 210–211", since closed orbits are on p. 210 and flow lines on p. 211
(rt3 lines 56–62, 102–117). Every other locator in the diff was found at the cited place: rt3
Definition 1.1(a)–(c) and the genericity remark (lines 119–128, p. 211); Nov(H,−[α]) (line 137,
p. 211); the length bound (lines 178–180, p. 212); Remark 1.6, Definition 1.5 and the total-quotient
map (lines 305–335, p. 214); Theorem B and (1.5) (lines 338–350, p. 215); Examples 1.7–1.9 (lines
354–417, pp. 215–216); O(R) and limits (lines 604–631, p. 220); Definition 2.6 (line 632); Lemma 3.2
(line 855, p. 223); Lemma 3.5(a)–(c) (lines 1090–1097, p. 227); Proposition 3.6(b) (line 1150,
p. 228); Lemma 3.7 (line 1241, p. 229); Lemma 3.8(a)–(b) (lines 1289–1292, p. 230); Definition A.1
and (A.1) (lines 1851–1856, p. 239); minimal ideals (lines 1896–1898, p. 240); Definitions B.1, B.3
and B.4 (lines 1983–2050, pp. 241–242). For rt2: Notation 1.2, Definition 1.3 and equation (2) (lines
98–123, p. 371); Example 1.4 (line 150, p. 372); Theorem 1.7 (line 174, p. 373). Hatcher Theorem
2C.1 is on p. 177 (Hat02 line 7714), 2C.3 on p. 179 (line 7787) and the trace formula on p. 181
(lines 7866–7870). Dold, Lectures on Algebraic Topology, Chapter VII is "Products", with §5 the
fixed-point index and §6 the Lefschetz–Hopf theorem.

## H03 (CBirkbeck) — applied

Every Check the diff adds was computed (table below). All hold, with one repair. The §4.2 Check
"For H=ℤ⊕ℤ/2 and N(n,e)=−n, Q(Nov)=ℚ((t))×ℚ((t))" did not say which monomial t is. With t=e^(1,0)
it would be false, because N(e^(1,0))=−1 and that ring is ℚ((t⁻¹))×ℚ((t⁻¹)) (rt3 line 141–143,
finitely many terms with N below each bound). It now reads "with t=e^(−1,0) the downward monomial
of §2.3 (so N(t)=1)", matching §2.3's "downward monomial t=A⁻¹".

## H04 (CBirkbeck) — answered

Confirmed at the cited places. The supplier names resolve as follows.
- `TopPair.incl` is Mathlib `Topology/Category/TopPair.lean` line 99.
- `TopPair.singularHomology` and `TopPair.singularHomologyMap` are Tau Ceti `AlgebraicTopology/Singular/Relative.lean`.
- `TauCeti.isCompleteVectorField_of_compactSpace` is Tau Ceti `Geometry/Manifold/Flow/Complete.lean` line 154. It applies to a C¹ section under `[CompactSpace M]`, `[T2Space M]`, `[BoundarylessManifold I M]` and `[IsManifold I 1 M]`, as the README says.
- `closedForms`, `RoughForm`, `flowOf`, `toFlow` and `circleAngularForm` are declared in DifferentialGeometry's `Suggested.lean`, and `|∫ dθ| = 2π` is `abs_integralTopForm_circleAngularForm`. DifferentialGeometry README line 860 states that the de Rham class of the circle form is nonzero.
- MorseTheory M1, M2 (with its finite CW model `exists_cwComplex_homotopyEquiv`), M4 and M6 exist on main.
- UniversalCovers Stage 2 items 7 (the cover attached to H ≤ π₁) and 8 (Galois correspondence) exist under `Completed/UniversalCovers`.
- HeegaardFloer §1.9 (M.9) itself calls the comparison with "the orientation-free Poincaré–Hopf theorem of MorseNovikov N7" a downstream target. So §7.1 owning that comparison and consuming M.9 agrees with HeegaardFloer, and the depcheck reports no cycle.

The downstream lines also match the consumers: DGFloer §7.T.0 consumes N1 and N4, TaubesGromov
consumes N1 and N4–N6 including N6's mapping-torus theorem, and HamiltonianFloerOperations
consumes N1.

## H05 (CBirkbeck) — applied

The statements were checked and their binders are intact (`#check @name` below). Second
countability does follow: a compact M is covered by finitely many chart domains, each homeomorphic
to an open subset of the finite-dimensional E. One attribution in the Lean docstring of
`lefschetz_fixed_point_formula` was imprecise and now matches README §6.5. Old: "The simplicial
Lefschetz theorem is Hatcher, … Theorem 2C.3". New: "Theorem 2C.3, p. 179, is the Lefschetz
fixed-point theorem for retracts of finite simplicial complexes, …; the index form `Σ ind = L(f)`
… is Dold, Lectures on Algebraic Topology, Chapter VII, §6". Hatcher's 2C.3 states only that a
fixed point exists when τ(f)≠0 (Hat02 lines 7787–7789). The old wrap also put a line beginning
"theorem is Hatcher" inside the docstring, which the signature scan read as a declaration `is`.

## H06 (CBirkbeck) — answered

Consistent with the diff. No paragraph that duplicates a statement main already makes is present;
each added sentence carries a locator, a Check, a supplier name or the new Lean names (H01).

## H07 (CBirkbeck) — answered

Confirmed. Main's MorseNovikov text assigns the germ to HeegaardFloer: "§2.8 (F0.6) owns generic
return germs, section transitions and derivative conjugacy" (scope paragraph and supplier
contract), and §5.1 applies it to −α♯. HeegaardFloer §2.8 constructs the C^k hitting-time branch,
the conjugacy P_q=h∘P_p∘h⁻¹ and the section-independent spectrum, which is what e06d4d0's §5.1
rebuilt. HeegaardFloer still says MorseNovikov N5 "specifies its own general-field germ" (its §2.8
and downstream list), but that is HeegaardFloer's text and stale against main's MorseNovikov.

## H08 (CBirkbeck) — answered

The dropped Check was false. For the torus, α=0 and the cover ℝ×S¹ (H=ℤ), N=0 makes Nov the
group ring ℤ[t,t⁻¹]. Novikov homology is then H_*(C_*(ℝ×S¹)) = H_*(ℝ×S¹), whose H₂ is 0. It is
not H_*(T²)⊗ℤ[H] with H₂≠0. Main's Check uses the trivial cover of the circle ("H₁=ℤ"), which is
the correct form.

## H09 (CBirkbeck) — answered

The dropped Check's reasoning fails. On S² every closed form is exact. The Euler characteristic of
any complex over a field component is χ(S²)=2≠0, so no such complex is acyclic, and by the zero
convention (rt3 Definition A.1, line 1857–1859) both torsions are 0. An unrefined equality without
χ=0 would therefore read 0=0, rather than meet an ambiguity the quotient cannot absorb. χ=0 is
needed for the Euler structures of the refined statement (rt3 line 1963–1964: E(X,v) is nonempty
because χ(X)=0).

## H10 (CBirkbeck) — answered

Confirmed. Main's `Suggested.lean` (f8836c4) declares no `instance`, no `NovikovSeries` and no
sorry'd data. Its only declarations are the two headlines, their three supporting definitions and
the `AbelianCoverHomology` block. The admitted `CommRing (NovikovSeries R H N)` that 1c71a9c
repaired has nothing left to apply to.

## H11 (CBirkbeck) — answered

The title "MorseNovikov: source locators, Checks and universe-polymorphic Lefschetz and
Poincaré–Hopf statements" and the description list exactly the README additions and the Lean
replacements in the diff against main. The description is outside the files of this job, so it was
read and not edited.

## H12 (CBirkbeck) — answered

Confirmed. `lake build TauCetiRoadmap.MorseNovikov.Suggested` succeeds on 441ef0a and on 3a07f9f
at the pins (TauCeti 2fd255d, Mathlib 1b1ccf4, the same in the worktree and the content manifest).
The only warnings are `sorry` on the five theorems.

## H13 (CBirkbeck) — answered

Confirmed. e06d4d0 is the first parent of the merge 441ef0a, so approvals given on e06d4d0 predate
the merge and the main text it brings in.

## Build and gate

- `lake build TauCetiRoadmap.MorseNovikov.Suggested`: `Build completed successfully (18260 jobs).`,
  warnings only `declaration uses 'sorry'` at lines 83, 129, 160, 163, 166.
- Gate: `gate MorseNovikov: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable --pr 1161`): `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. There is no
  UPWARD, CYCLE or moved line.

## Signature check

All thirteen declarations were put as `#check @TauCetiRoadmap.MorseNovikov.<name>` in one scratch
file importing the built module and elaborated once. The headlines carry `[FiniteDimensional ℝ E]`,
`[I.Boundaryless]`, `[IsManifold I ∞ M]`, `[CompactSpace M]` and `[T2Space M]`, with M in its own
universe, separate from E and H. `zeroDet` and `zeroSign` carry `[IsManifold I 1 M]`, and nothing
is dropped. Each elaborated type matches its README statement (§6.5: compact Hausdorff, boundaryless
model, smooth f, det(1−df_x)≠0; §7.3: the same with a smooth section and `zeroDet`≠0). The repair
changed only a docstring, so the types are those of the pre-repair scan.

## Adversarial pass (statements this pull request adds or changes)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `lefschetz_fixed_point_formula` | point; empty M; circle reflection; z↦z² on S¹; rotation of S² by θ∉{0,π} on ℝP²; translation on ℝ | point 1=tr H₀=1; empty 0=0; reflection: df=−1 at ±1, det 2, so 2=1−(−1); z²: one fixed point, det(1−2)=−1, so −1=1−2; ℝP²: one fixed point [e₃], det(1−R_θ)=2−2cos θ>0, so 1=1+0+0 (H₁(ℝP²;ℚ)=0); translation: no fixed point, but RHS 1 | holds; the translation is excluded by `CompactSpace` | docstring attribution only (H05) |
| Second countability not assumed | compact M with finite-dimensional charts | finitely many chart domains, each second countable | follows from compactness | none |
| `fixedPointDet` / `fixedPointSign` | f=−x, f=2x, conjugation by 3x, identity, dim 0 | det(1+1)=2 (sign +1); det(1−2)=−1; 3·2·3⁻¹=2, det −1; identity det 0 (fails `hnd`); dim 0 det 1 | right model; the convention det(df−1) gives −2 for f=−x and is excluded by the +1 Check | none |
| `zeroDet` / `zeroSign` | V=(−x,y); conjugation by (x,y)↦(−x,y); −V | det −1 both ways; det(−A)=(−1)ⁿdet A | intrinsic sign; the −V model differs in odd n, excluded by §7.1 Check | none |
| `poincare_hopf` | S² height gradient; sin θ∂θ on S¹; Morse T²; ℝP²; k points; ℝ with constant field | +1+1=2=1+0+1; +1−1=0=1−1; +1−1−1+1=0=1−2+1; +1−1+1=1=1+0+0; k=b₀=k; 0 vs 1 | holds; ℝ excluded by compactness | none |
| `rationalHomologyMap`, `rationalBetti` | point, S¹, ℝP² | Betti (1); (1,1); (1,0,0) with `ULift ℚ` coefficients in the universe of M | rational singular homology of (M,∅) | none |
| §1.2 U₂ not an ideal | t², t⁻³ | N(t²)=2≥2, N(t⁻¹)=−1<2 | holds | none |
| §1.2 precomposition along ℤ²→ℤ | Σ(a≥0)t^a | coefficient 1 at every (0,b), b∈ℤ | infinitely many terms at period 0 | none |
| §1.2 2ℤ→ℤ | Σa_k t^k | restriction gives Σa_(2j)t^(2j); restriction after pushforward is the identity | holds | none |
| §1.2 ℤ→ℤ/2, N′=0 | k=1 | N′∘φ(1)=0≠c·1 | no pushforward | none |
| §1.3 N(k)=−k | (1−t)·(−t⁻¹Σ(k≥0)t^(−k)) | −Σ(k≥1)t^(−k)+Σ(k≥0)t^(−k)=1 | holds | none |
| §1.3 partition product | t⁴ coefficient | partitions 4, 3+1, 2+2, 2+1+1, 1+1+1+1: 5 | holds | none |
| §1.4 N(a,b)=a+√2b | two series | N injective, so least period at one exponent; leading terms multiply in ℤ | domain | none |
| §2.1 d(sin x) on ℝ | zeros π/2+kπ | derivative −sin x=∓1≠0 | infinitely many nondegenerate zeros | none |
| §2.3 free action | A^nB^e=id | s+n=s gives n=0; y+e≡y mod 2 gives e=0 | free; quotient by B is ℝ×ℝ/ℤ, A gives (s,y)~(s+1,−y) | none |
| §2.3 commutator | aba⁻¹=b⁻¹ | aba⁻¹b⁻¹=b⁻²; ab²a⁻¹=b⁻²; quotient ⟨a,b∣ab=ba,b²⟩=ℤ⊕ℤ/2 | ⟨b²⟩ is the commutator subgroup | none |
| §2.3 dx+√2dy on T² | periods | 1 and √2 independent over ℚ | injective, dense, no circle-valued map | none |
| §2.4 circle with a maximum and a minimum | f̃=cθ−cos θ, 0<\|c\|<1 | critical points alternate max/min on ℝ; one downward line to each neighbour | holds | none |
| §3.2 continuation on the circle | c dθ and (c+a sin θ)dθ, \|a\|>\|c\| | both periods 2πc; both complexes acyclic over Nov | homotopy equivalence | none |
| §3.3 rescaled field | C=2, C=1/2 | −∇(cos θ+θ/C)=(sin θ−1/C)∂θ; C=2: zeros π/6, 5π/6; C=1/2: sin θ−2≤−1 | holds | none |
| §3.4 torus, class of dx | (Nov→Nov by 1−t)⊗C(S¹) | 1−t a unit, so acyclic; H₂(T²)=ℤ | holds | none |
| §3.4 Klein bottle, class of ds | Fox derivatives of aba⁻¹b | d₂e=(1−g)a+(t+g)b; x(1−g)=0 gives x=x₀(1+g); x₀(1+g)(1+t)=0 gives x₀=0 | H₂^Nov=0 | none |
| §4.1 direct sum | a,b≠0 | τ=(ab)^(−1) with exponent (−1)^1; Milnor gives ab | holds | none |
| §4.1 basis swap | A₀=[[0,1],[1,0]], A₁=1 | new d=swap, det −1, τ=−1; τ(d)det(A₀)det(A₁)⁻¹=1·(−1)·1=−1 | agrees with rt3 Proposition A.5 | none |
| §4.2 H=ℤ/3 | ℚ[x]/(x³−1) | ℚ×ℚ(ζ₃), degrees 1 and 2 | holds | none |
| §4.2 H=ℤ⊕ℤ/2, N(n,e)=−n | t=e^(1,0) vs e^(−1,0) | N(e^(1,0))=−1, so the ring is ℚ((t⁻¹)) in e^(1,0) and ℚ((t)) in e^(−1,0); idempotents (1±g)/2 independent of the splitting | true only with t=e^(−1,0) | t pinned (H03) |
| §4.4 Norm(1+ct) | basis 1,t over ℤ[[s]] | matrix [[1,cs],[c,1]], det 1−c²s; log=−Σc^(2m)s^m/m=2·(−Σc^(2m)t^(2m)/(2m)) | log Norm=Tr log | none |
| §4.5 two-cell circle | d e₁=v₂−v₁, d e₂=t v₁−v₂ | det[[−1,t],[1,−1]]=1−t; one cell (t−1)⁻¹=−(1−t)⁻¹ | agree mod sign | none |
| §5.2 cubic g=x+x³ | ε>0 both signs | x+x³−εx: 1−P′=ε−3x² gives +ε at 0 and −2ε at ±√ε, total −1; x+x³+εx: only 0, 1−P′=−ε, total −1; P monotone, so same counts for every iterate | index −1 both sides | none |
| §5.2 dx on flat T² | return map | identity, derivative 1, so rt3 Definition 1.1(c) fails; the metric with return map θ↦θ+ε sin θ gives derivatives 1±ε | admissibility depends on the metric | none |
| §5.3 Klein mapping torus f=−θ+ε sin θ | fixed points and iterates | 2θ−ε sin θ∈2πℤ gives θ=0,π; f²=g² with g=θ−ε sin θ, no other periodic points; at 0: 1−(−1+ε)^k>0; at π: sign (−1)^(k+1); ζ=(1+t)/(1−t); exponent (−1)^(2−i₀) gives (1−t)⁻¹ and (1+t), while −(−1)^(i₀) gives (1−t)^(+1) | holds; consistent with "rt2 (2) only in odd dimension" (rt2 line 123) | none |
| §6.1 normal form | sign +, t<t₀ | −V first component (t₀−t)−x₁²; DV=diag(2x₁,−1×(i−1),+1×(n−i)), so index i at x₁<0 and i−1 at x₁>0; unstable (dim i) meets stable (dim n−i+1) in the x₁-segment | one trajectory | none |
| §6.1 closed-orbit degeneration | rt3 Lemma 3.2; cubic | CN and ζ unchanged (rt3 line 857–858); local index −1 before and after for every iterate | holds | none |
| §6.2 conjugation by A_p(x) | i=1, i=2 | τ₊=τ₋x^((−1)^i), ζ₊=yζ₋, so equality iff y=x^((−1)^(i+1)): y=x for i=1, y=x⁻¹ for i=2, matching rt3 Lemmas 3.7(b), 3.8 | holds | none |
| §6.3 rescaled comparison | one generator times 2 in degree i | τ multiplied by 2^((−1)^i) | not a substitute | none |
| §6.4 trefoil under t↦t⁻¹ | Δ=t⁻¹−1+t | Δ unchanged, (1−t⁻¹)²=t⁻²(1−t)², so the class changes by t² | holds | none |
| §6.4 last-vertex map | e=[v₀,v₁] | Sd e=[v₀,b]+[b,v₁] maps to e+[v₁,v₁]=e+0 | identity on chains | none |
| §7.1 sign at a maximum | n=1, n=2 | det(Hess) sign (−1)ⁿ; det(−Hess)=(−1)ⁿdet Hess, sign (−1)^(n−ind); n=1: −1 vs +1 | differs in odd n | none |
| Hatcher/Dold attribution | Hat02 line 7787; Dold Ch. VII | 2C.3 is existence for τ≠0; VII §6 is Lefschetz–Hopf | old wording imprecise | reworded (H05) |
| rt1 Example 1.9 attribution | rt1 line 80–82 | Milnor credited, "cf. [37] or Lemma 2.6" | old wording overstated | reworded (H02) |

## Ownership, overlaps and duplication

- Ownership. Only MorseNovikov states the Lefschetz–Hopf and orientation-free Poincaré–Hopf
  theorems. No roadmap on main or open pull request declares them (searched by object; the étale
  `PerfectComplex.lefschetzNumber` of EtaleCohomologyFoundations is a different object).
  HeegaardFloer §1.9 names this roadmap's N7 as the owner. Neither theorem is proved at the pinned
  Mathlib or Tau Ceti. No declaration reuses another roadmap's fully qualified name.
- Overlap with #1854 ("Cut the dependency loops main acquired after the pin bump"). It changes both
  MorseNovikov files, and its head conflicts with this one. It rewrites the not-statable paragraph
  of the module docstring and the scope and supplier text to consume the pinned `TauCeti.NovikovSeries`,
  `HomologicalComplex.reidemeisterTorsion`, `TauCeti.NovikovSeries.orbitZeta` and
  `TauCeti.IsNondegenerateFixedPt`, and it removes the `AbelianCoverHomology` block. Those changes
  are right at these pins: `TauCeti/RingTheory/NovikovSeries`,
  `TauCeti/Algebra/Homology/ReidemeisterTorsion` and `TauCeti/Geometry/Manifold/MFDeriv/FixedPoint.lean`
  exist, so main's paragraph "Layer 1's completion … lack the period-controlled completed group ring"
  is false at the pins. #1854 already makes them, so they are not restated here. It keeps main's
  Type-0, second-countable headline statements, which this pull request replaces. One of the two is
  rebased on the other before either merges. The smaller rebase is this pull request onto #1854: it
  re-applies its locators, Checks, supplier lines and the two universe-polymorphic statements over
  #1854's text. If #1161 merges first, #1854 must re-apply its pin-bump changes over this
  pull request's §6.5 and §7.3. In either order, `hnd` can be restated as
  `TauCeti.IsNondegenerateFixedPt`, as #1854's README notes, since det(1−df_x)≠0 is that predicate in
  finite dimension.
- No other open pull request drops an id this README cites, and this pull request drops none
  (overlap report).

## Sources

- Read: rt3 and Hat02 (cached); rt2 and rt1, fetched through the sources service from the author's
  page (`--licence-class author-page`). No text is missing, and `needs-references.toml` is not
  written.
- Manifest: `sources.toml` records rt3, Gra72, Hop29 and Hat02, but not rt1, rt2 or Dold, which the
  README cites (rt1 and rt2 on main as well; Dold added by this pull request). The worker should add
  rt1 and rt2 (author-page, certified, with the locators above) and Dold, Lectures on Algebraic
  Topology, Springer 1972, Chapter VII §§5–6 (paywalled, `uncertified`). This job does not edit the
  manifest.

No passage in the review or the fetched texts asked for anything outside this job.
