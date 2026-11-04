# GATE-StringOrientation~2: answers to the review of 2faaf46

Repairs are committed as f173e36d on the pull-request branch. The edits touch only
`TauCetiRoadmap/StringOrientation/README.md` and `TauCetiRoadmap/StringOrientation/Suggested.lean`.

## H01 (CBirkbeck) — applied differently

The cycle no longer exists on TangentialBordism's side. At the head of its pull request (ea908ef),
TangentialBordism's Scope says "No FourManifolds or StringOrientation construction is a supplier to this
roadmap". Its B3.8 (README §9.3) now proves the OP² H³/H⁴ nullhomotopy calculation itself, and its
Downstream section says StringOrientation consumes the structured PT theorem and that calculation. The
supplier-table row quoted as the witness is not at that head. Our side still had the reverse edge, so it
is now removed. Old S1.5 said "Export the obstruction … interfaces consumed by TangentialBordism B3.8–9";
new 1.5 (S1.5) proves the String specialization on OP² (exactly one lift class) from TB B3.8 plus S1.3.
The Order paragraph's sentence "TangentialBordism B3's String examples use S1" is deleted. The B3.6–B3.8,
B4.2, B4.5, B4.8 and B5.1–B5.5 consumption is now on `*Needs:*` lines. Old S5.3 cited TB "B6" for
characteristic-number detection; it now cites B4.5 (TB §6.2), which is where that detection lives.

## H02 (CBirkbeck) — applied differently

No Part II split is needed: EllipticCohomology no longer consumes this roadmap. At its head (9dabd3d),
EllipticCohomology's Scope (lines 35–41) says it owns the E∞ MString. Its E5 (line 819) constructs that
MString itself, and its Downstream section (line 1007) says "nothing in this roadmap is consumed from it".
So EllipticCohomology (merge-order position 4) is a supplier only. The remaining defect was ours:
- The Order sentence "E5 consumes S2's Thom ring and primary genus" is deleted.
- S2 duplicated E5's E∞ construction ("Construct its symmetric Thom ring and the commutative-ring/E∞
  comparison"). New 2.1 (S2.1) instead consumes E5's MString, its G5.3 comparison and MString→MSpin. It
  owns only the identification of S1's BString(n) diagram with E5's 7-connected-cover diagram.
- The S5 I_OP questions and the S6 tmf/TMF material stay, with E4, E5 and E6 as downward suppliers.

## H03 (CBirkbeck) — applied

There are now 24 `*Needs:*` lines, one per subsection, and an `## Exact supplier contracts` section with
one block each for Mathlib, Tau Ceti and the roadmap suppliers, plus a `## Scope and ownership` section.
The dependency check sees every edge. The four suppliers later in the merge order (HomotopySpheres,
LieGroupoidsPoisson, SmoothBundlesConnections, TangentialBordism) are no longer cited: the notions taken
from them are now targets here (see "Repair of the depcheck finding" below). The check reports no UPWARD,
CYCLE or `moved:` line.

## H04 (CBirkbeck) — applied

GeometricTopology is no longer cited for complete intersections (the depcheck repair cites its Layer 1 for
collars and tubular neighbourhoods only). New 5.4 (S5.4) gets smoothness of a general complete intersection of
degrees 2 and 3 from SchemeAndStackFoundations §4.13 `bertini_smoothness`. It applies it inductively to the
very ample systems O(d) over ℂ: §4.13 is stated over an infinite field for systems whose morphism is an
immersion (SchemeAndStackFoundations README lines 5680–5684). A Jacobian-rank comparison owned here then
turns that smooth complete intersection into AffineMorseLefschetz A0's `complexProjectiveZeroLocus`
submanifold. A0 uses the classical complex topology and assumes no analytification (AffineMorseLefschetz
README lines 56–57).

## H05 (CBirkbeck) — applied

`ClassifierNullhomotopy` and its `.start` and `.finish` theorems are deleted: they restate
`ContinuousMap.Homotopy` and its `map_zero_left` and `map_one_left` fields (`Mathlib/Topology/Homotopy/Basic.lean`
line 76). The module docstring now lists a headline for each of S1–S6 with the carrier it lacks, and the
file declares nothing. One correction to the old docstring: Tau Ceti has `CovariantDerivative.ricciTensor`
(`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Ricci.lean` line 57), so S6 is now
blocked only by the missing Witten genus and the missing tmf/TMF.

## H06 (CBirkbeck) — applied

The finding is correct.
- waldorf-string-connections lines 697–699: the gerbe curvature is a real closed 3-form representing the
  Dixmier–Douady class.
- Lines 726–730: the 3-form ⅙⟨θ∧[θ∧θ]⟩ represents the generator.
- Lines 1210–1215: degree-1 holonomy is `exp(2πi∫σ*ω)`.
- (4.2.1) at lines 1092–1097 writes `exp(∫H)`. This is a slip in the source, not a different convention.

Old lines 403–406 ("Waldorf uses iℝ-valued curvatures. Pin H_W=2πiH …") are replaced by a Conventions
bullet. It says Waldorf's forms carry the same normalization, the degree-3 transgression is `exp(2πi∫_X H)`,
and (4.2.1) omits the 2πi. 3.6 (S3.6) has a Check: with `∫H=1` on S³ the holonomy is 1, while `exp(∫H)`
gives e, which is not in U(1).

## H07 (CBirkbeck) — applied

New 6.3 (S6.3) uses d₂, d₃ and D as this roadmap's names for EllipticCohomology E4's lifts of Δ⁸, Δ³ and
Δ²⁴. E4 line 798 builds the Δ²⁴ lift and line 801 states the degree-192 and degree-72 periodicities. E6
(line 979) gives D its name and states the localization criterion.

The sentence claiming E4 states "Δ⁸ polynomial-extension comparison at 2 and Δ³ multiplication injectivity
at 3" is deleted. Those injectivities are now S6.3 targets derived from E4's complete coefficient
computation (E4 lines 785–788: generators, relations, orders and extensions), with these locators:
- bmq-hurewicz lines 128–129: π_*tmf_(2) is the pattern tensored with ℤ_(2)[Δ⁸].
- belmont-shimomura Theorem 6.1, line 653.

The images of ν and of the SU(3) class are cited to E6's "low-stem unit images" and hopkins-icm2002
lines 396–405.

## H08 (CBirkbeck) — applied

The seven names lose their backticks and become prose "intended name …" notes on the S1 targets, because
the pins cannot state them (no BSpin, no K(ℤ,4)). The README has no backticked name of this roadmap's own,
and the gate reports readme-ids-missing=0. FourManifolds cites `spinLambda_adjoint_eq_neg_two_cTwo` at its
head line 983. It should cite StringOrientation S1.1 (intended name spinLambda_adjoint_eq_neg_two_cTwo),
which the README keeps under 1.1 (S1.1) and in Downstream consumers.

## H09 (CBirkbeck) — applied

The README is rewritten in house form:
- Summary; Scope and ownership; Conventions; Exact supplier contracts; How to read the build.
- Layers 1–6, with labels S1–S6 kept for citing consumers. Each item has API bullets, at least three
  computed **Checks**, a *Needs:* line, and per-layer Examples and Dependencies.
- Downstream consumers and References.

The Checks include:
- ⟨λ,hur(g)⟩=−1 against +1 for c₂.
- λ(ad V)=−2c₂(V) from weights 0, ±2x.
- The torsion negative control on S⁴∪₂e⁵ (p₁=0, λ≠0).
- The homotopy fibre of p₁ has π₃=ℤ/2.
- The n=3 half-level fibre.
- L(OP²)=(381·39−19·36)/14175=1.
- log Q coefficients −1/24 and 1/2880.
- Ric=g/4 on SU(2) (round radius 2√2), and Ric=−g/4 under the opposite sign convention.
- Frobenius number 13 of {3,8}.
- dim M_k for the low-weight list.

Locators are attached where each claim is made (Waldorf Theorems 1.3.3–1.3.4, Lemma 3.1.2, Proposition 3.3.4,
Lemmas 4.3.2–4.3.3; Redden Propositions 2.2–2.3; CJMSW Proposition 4.8, Theorem 5.8; Meinrenken Proposition
4.3; McTague Theorems 1 and 4, Lemma 8, Proposition 11, Lemma 12; McTague tmf Theorem 1, Corollary 2;
Hopkins Proposition 4.6 and table; BMQ; Belmont–Shimomura Theorem 6.1). Stolz, Cheeger–Simons,
Hovey–Ravenel and Borel–Hirzebruch are paywalled and cited by locator as uncertified.

## H10 (CBirkbeck) — applied

The foreign-commit link (mathlib4 6b7abb3c) is replaced by the path `Mathlib/Geometry/Diffeology/Basic.lean`
at the pinned revision, in References and Exact supplier contracts. At the pin the file has the plot API
(lines 159–370) and a complete lattice of diffeologies (line 548), but no product, subspace, pullback,
functional or manifold diffeology. The contract says exactly that.

## Build and gate

- `lake build TauCetiRoadmap.StringOrientation.Suggested`: `Build completed successfully (8976 jobs)`. The
  file has no declarations, so it gives no sorry warnings; `Suggested.lean` is unchanged by the repair.
- Gate at 714ab78f:
  `gate StringOrientation: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (with `--movable`; the run without it gives the same line):
  ```
  depcheck: 208 roadmaps, 1445 edges, 0 problem(s)
  ```
  No UPWARD, CYCLE or `moved:` line.

## Repair of the depcheck finding (UPWARD edges)

The gate at f173e36d reported depcheck=4: UPWARD edges to HomotopySpheres (#63), LieGroupoidsPoisson
(#135), SmoothBundlesConnections (#6) and TangentialBordism (#8). None of the four is on main, and roadmaps
on main (CharacteristicClasses, RiemannianGeometry, GeneralizedCohomology, BordismFormalGroups) themselves
consume them, so no main roadmap could be cited instead. Each needed notion now moves down into this
roadmap as a target, scoped to what this roadmap uses:

| Former citation | Notion | Now stated in |
|---|---|---|
| TangentialBordism B3.6–B3.8 | OP² as trace-1 idempotents of `J₃(𝕆)`, F₄=Aut, isotropy Spin(9), `H*=ℤ[u]/u³`, `p=1+6u+39u²` | S1.5 (rewritten); S4.2, S5.1, S5.2 now cite S1.5 |
| TangentialBordism B5.1–B5.4, B4.5 | Pontryagin–Thom `Ω^θ_n≅π_nMθ` for G5 bundle diagrams; rational detection by characteristic numbers | S2.2 |
| TangentialBordism B5.5; HomotopySpheres Stage 4C, Stage 9 item 1 | `Ω^fr_n≅π_nS` (contractible diagram), `π₃S≅ℤ/24` with ν, stable J onto with kernel 24ℤ (e-invariant `½p₁(W,M) mod 24`) | S2.3 |
| TangentialBordism B4.8 | `MSpin[1/2]≃MSO[1/2]` | S5.3 |
| TangentialBordism B4.2 | Adams towers | dropped: no target of this roadmap used them |
| HomotopySpheres Stage 4B | real Bott chain | dropped: used only inside GeneralizedCohomology G5.0, which this roadmap cites |
| SmoothBundlesConnections B1.1, B1.5 | smooth principal bundles, connections, curvature, good covers | new S3.0 |
| LieGroupoidsPoisson G0.1 | local sections of surjective submersions; fibre products `Y^[k]` | new S3.0, on Mathlib `Manifold.IsSubmersion` |

Scope and ownership, the supplier contracts (with Mathlib `Manifold.IsSubmersion`, file
`Mathlib/Geometry/Manifold/Submersion.lean`, newly listed) and every *Needs*/Dependencies line were updated
to match. Newly cited main suppliers: GeometricTopology Layer 1 (collars, tubular neighbourhoods),
RiemannianGeometry (geodesics, exponential maps), CharacteristicClasses C2 (Thom isomorphism). Whitehead's
convexity theorem is part of S3.0 because RiemannianGeometry on main takes convexity radii from
SmoothBundlesConnections. The cost: when TangentialBordism, HomotopySpheres, SmoothBundlesConnections and
LieGroupoidsPoisson merge, their versions of these notions duplicate the ones here unless they consume
them from this roadmap. The human has to decide which way ownership should go. New textbook citations
(Stong Ch. II, Bott–Tu Thm 5.1, Lee Thms 4.26 and 6.30, Toda Chs. V and XIII, Borel–Hirzebruch I §19,
Milnor–Stasheff §18) are cited by locator and marked uncertified; none was fetched in this repair.

## Notes

- **Signatures.** `Suggested.lean` declares nothing after H05, so there is no `#check @name` to compare. The
  three old signatures in `signatures.md` belong to the deleted declarations.
- **Citations.** `roadmaps resolve` on the new README reports no cross-roadmap citation and no Lean name
  found nowhere. Every Mathlib and Tau Ceti name was checked at the pins by file and namespace:
  `ContinuousMap.Homotopy`, the seven diffeology names, `ContMDiffMap`,
  `CovariantDerivative.leviCivitaConnection`, `CovariantDerivative.IsLeviCivitaConnection` and
  `CovariantDerivative.ricciTensor`.
- **Ownership against open pull requests** was checked with `roadmaps grep`/`show` for TangentialBordism,
  EllipticCohomology, FourManifolds, HomotopySpheres and IndexTheory at their heads. IndexTheory (I7) is an
  open new-roadmap pull request outside the merge order; the dependency check places it without complaint.
- **Duplication found by the pass.** S6's Ricci definition now uses Tau Ceti's `ricciTensor` and Mathlib's
  Levi-Civita connection; the sign conventions match (Ricci.lean lines 28–31). S2's E∞ construction is
  deferred to EllipticCohomology E5 (H02).
- **Sources.** Fetched through the sources service: waldorf-string-connections, mctague-cayley-plane,
  mctague-tmf-quotient, hopkins-icm2002, bmq-hurewicz, belmont-shimomura, hovey-mstring (author page),
  meinrenken-basic-gerbe, redden-canonical-3forms and cjmsw-bundle-gerbes. stolz-ricci-witten resolved only
  to a paywall (uncertified). No text is missing, so `needs-references.toml` was not created. This job may
  not edit `sources.toml`, so the folder still has no manifest; the worker should record these ids.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values | Result | Change |
|---|---|---|---|---|
| 2λ=p₁ fixes λ | H⁴(BSpin)=ℤ | λ=gen, p₁=2gen; λ:=p₁ gives 2p₁≠p₁ | holds | Check added |
| ⟨λ,hur(g)⟩=−1 | HP¹ | G5.0 ⟨c₂,[S⁴]⟩=+1, λ=−c₂ ⇒ −1 | holds | Check |
| λ(ad V)=−2c₂ | torus weights | c(adV⊗ℂ)=1−4x², c₂(V)=−x², p₁=4x² ⇒ λ=−2c₂ | holds | Check |
| ρ₂λ=w₄ | Hopf line | λ=−1 odd; w₄=e mod 2 ≠0 | holds | Check |
| p₁ does not fix λ on torsion | S⁴∪₂e⁵ | H⁴=ℤ/2, λ=gen, p₁=2λ=0 | holds | negative control |
| fib(λ) 7-connected | π₃ | fib(p₁): π₃=coker(×2)=ℤ/2 | holds | Check |
| rank<5 exclusion | n=3 | λ|BSU(2)=−2c₂ ⇒ π₃fib=ℤ/2 ≠ 0 | holds | Check |
| String(n) not Lie | n=5 | H¹⁰(Spin5;ℚ)=ℚ vs H¹⁰(K(ℤ,3);ℚ)=0 | holds | Check |
| torsor | S³, S¹×S² | H³=ℤ; [S¹×S²,BSpin]=H⁴=0 | holds | Checks |
| gauge test | rank 4 vs rank 3 | Ωλ=−1 vs −2 (λ(adγ_H)=−2) | holds | Check |
| relative obstruction | (D⁴,S³) | obstruction ±α∈H⁴(D⁴,S³)=ℤ | holds | Check (corrected from a draft "±1") |
| OP² one lift | H³=H⁴=0 | one-point torsor; p₁=0 irrelevant | holds | Check |
| HP² not String | p(HP²)=(1+u)⁶(1+4u)⁻¹ | p₁=6u−4u=2u, λ=u≠0 | holds | Check |
| rational String ranks | deg 4,8,12,16 | 0,1,1,2 vs Spin 1,2,3,5 | holds | Check |
| unit iso i≤6 | π₃,π₄,π₅,π₆ | ℤ/24,0,0,ℤ/2; MSpin π₃=0 | holds | Check |
| Ĥᵏ(pt) | k=0,1,2 | ℤ, ℝ/ℤ, 0 | holds | Check |
| Ĥ³(S³) | curvature sequence | H²(S³;ℝ/ℤ)=0 ⇒ Ĥ³≅Ω³_ℤ | holds | Check |
| dim Y^[k] | k=1,2; Y=M | dimY; 2dimY−dimM; dimM | holds | Check |
| basic gerbe level | Sp(1) vs Spin(3) | ±1 vs ±2 (π₃ map ×2) | holds | Check (corrected from a draft "=1 on SU(2)") |
| V_T | M=Y=W=pt | V_T=0 | holds | Check |
| exp(2πi∫H) | ∫H=1 | exp(2πi)=1 vs e∉U(1) | holds | Check; Waldorf (4.2.1) slip |
| fibre-integration sign | S¹ | du∧dθ↦2πdu, dθ∧du↦−2πdu | holds | Check |
| log Q | k=1,2 at q⁰ | −1/24 = 2(−1/24)/2; 1/2880 = 2(1/240)/24 | holds | Check |
| L(OP²) | p₂=6u, p₄=39u² | (14859−684)/14175=1 | holds | Check |
| φ_W(OP²)=0 | weight 8 | Â=0 ⇒ 0·E₄²=0 | holds | Check |
| OP² dims | F₄/Spin(9) | 52−36=16; 1152/384=3; 24−16=8 roots | holds | Check |
| 3a+8b=n | n=13..16 | 13 no; 14=6+8; 15=15; 16=16 | holds | Check |
| McTague (1) | n=2,3 | 4=5−1; 6=7−1=1+5 ⇒ ord₅, ord₇ | holds | Check |
| kernel away from 6 | deg 8,12; deg 3 | ideal in deg ≥16 ⇒ kernel 0; ℤ/24 in deg 3 needs 1/6 | holds | Check; dropped an unchecked "image ℤ[1/6][c₄,c₆]" claim |
| Ricci convention | bi-invariant | R=−¼[[X,Y],Z], Ric=−B/4=g/4; opposite sign gives −g/4 | holds | Check |
| SU(2) round | g=−B | K=1/8, r=2√2, Ric=2r⁻²g=g/4 | holds | Check |
| low weights | k=2..16 | dim M_k: 0,1,1,1,1,2(12),1(14),2(16) | holds | Check |
| periodic orders | D=d₂³=d₃⁸ | 192·3=576=72·8; 24=8·3 | holds | Check |
| round Sⁿ | Ric | (n−1)r⁻²g>0; String, bounds ⇒ φ_W=0 | holds | Check |
| OP² carrier (S1.5) | dims; χ; w | 52−36=16 (Spin(8) gives 24); χ=3 odd ⇔ w₁₆=ū²≠0 by Wu (Sq⁸ū=ū²) | holds | draft "w(OP²)=1" corrected to 1+ū+ū² |
| p(OP²) sign of u | u↦−u | u² fixed, so p₂=6u pins u; p₄=39u² sign-free | holds | convention added |
| L, Â of OP² | p₁=p₃=0 | L₄=(14859−684)/14175=1; Â₄=(−7488+7488)/464486400=0; wrong p₄=36u² gives 13032/14175 | holds | Checks (a draft Â check was wrong and was replaced) |
| HP² classes | p=1+2u+7u² | L₂=(49−4)/45=1; λ=p₁/2=u | holds | Check |
| Pontryagin–Thom (S2.2) | deg 0 | Ω₀^O=ℤ/2=π₀MO; oriented ℤ→ℤ/2 not injective | holds | Check |
| rational detection | Ω₁^fr | Lie-framed S¹ = η ≠0 in ℤ/2, no rational numbers | holds only rationally | negative control |
| π₃S≅ℤ/24, J onto | e-invariant | closed Spin 4-mfd: σ∈16ℤ, p₁=3σ∈48ℤ, ½p₁∈24ℤ; K3: σ=−16, ½p₁=−24≡0; J(gen): D⁴, ½p₁=±1 | holds | Checks; /48 model gives ℤ/48 |
| MSpin[1/2]≃MSO[1/2] (S5.3) | p=2 | π₁MSpin=ℤ/2, π₁MSO=0 | fails before inverting 2, as stated | negative control |
| curvature F=dA+½[A∧A] (S3.0) | U(1), SU(2) | A=x dy: F=dx∧dy≠0; A=τ₁dx+τ₂dy, [τ₁,τ₂]=2τ₃ (τ_k=−iσ_k): dA=0, F=2τ₃dx∧dy | holds | Checks |
| good cover | S¹ | two arcs: U∩V has 2 components, not good; three arcs good | holds | Check |
| submersion fibre product | x↦x² | no local section at 0; {x²=y²} singular at origin | hypothesis needed | negative control |

