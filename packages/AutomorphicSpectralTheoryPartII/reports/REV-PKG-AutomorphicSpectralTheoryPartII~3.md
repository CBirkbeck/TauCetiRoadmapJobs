<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1008#issuecomment-6397006344 -->
Review (claude) of 7a04b43

Verdict: needs changes

1. **F01** (P2) §1.9 indexes the support/level stage by double cosets that merely meet C

   **Location.** packages/AutomorphicSpectralTheoryPartII/README.md:575, §1.9: “identify its stage with finitely many copies of S(G∞), indexed by the J-double cosets meeting C”. The same error is in the Check at README.md:593: “A compact finite support meeting two J-double cosets gives two real Schwartz copies”.

   **Claim.** For every compact C⊂G(𝔸_f) and compact open J, the stage of bi-J-invariant Schwartz functions supported in G∞×C is a direct sum of copies of S(G∞), one for each J-double coset that meets C.

   **Witness.** Take C={1} and J=K_f, which is infinite because dim G>0. A bi-J-invariant f supported in G∞×{1} satisfies f(g,j)=f(g,1) for j∈J, so f=0. The stage is therefore 0, although one double coset (J) meets C.

   The stage is defined with unsaturated C in both places the README relies on: AutomorphicFormsOnReductiveGroups §0.3 (fixed compact finite support) and BPCZ §2.5.2 (bpcz line 1151, p.209, support in G∞×C with bi-J-invariance).

   **Repair.** In README.md:575 replace “meeting C” by “contained in C”. Optionally add that compact sets which are finite unions of J-double cosets are cofinal, and that the stage of C equals the stage of its largest bi-J-invariant subset. Replace the Check at :593 with: “A compact support that is the union of two J-double cosets gives two copies of S(G∞); for C={1} and J≠{1} the stage is 0, although the double coset J meets C.”

   Tested on the refuting instance and one control:
   - C={1}: no double coset is contained in C, so the corrected statement gives 0, which matches the actual stage.
   - C=JxJ⊔JyJ: the stage is S(G∞)⊕S(G∞), with f determined by the pair (f(·,x), f(·,y)).

   While editing: the §1.9 line locator bplzz line 1056 points at the ω paragraph. Definition 3.1 begins at bplzz line 1063 (p.21).

2. **F02** (P3) a §1.9 Check credits SR.3 with a p-adic Harish-Chandra Schwartz algebra it does not plan

   **Location.** packages/AutomorphicSpectralTheoryPartII/README.md:589: “At a finite place this space is C_c∞, not the larger Harish-Chandra Schwartz algebra planned in SR.3.”

   **Claim.** SmoothRepresentationsOfLocalGroups SR.3 plans the Harish-Chandra Schwartz algebra of a p-adic group.

   **Witness.** At the open head 1383569, SR.3 runs from TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2478 to :2850:
   - Its subsections cover cuspidal support, the Bernstein centre, tempered representations and the Iwahori block.
   - Its only Harish-Chandra item is tempered support (:2819). The only “Schwartz” object in that README is the Bernstein–Zelevinsky Schwartz submodule (:3710).
   - A roadmap-wide search finds Harish-Chandra Schwartz spaces only at real places: EndoscopicTransferAndUnitaryTraceComparison README:948.

   **Repair.** Delete the attribution: “At a finite place this space is C_c∞(G(F_v)), not a Harish-Chandra Schwartz algebra of G(F_v); a function with noncompact support is outside it.” The mathematical content of the Check is unchanged, and it now cites no supplier.

3. **F03** (P3) the scope cites CongruenceSpectralGap by design labels its roadmap does not carry

   **Location.** packages/AutomorphicSpectralTheoryPartII/README.md:17: “CongruenceSpectralGap CSG.0–CSG.5 owns the congruence Laplacian gap, including its continuous threshold and curvature normalization.”

   **Claim.** CongruenceSpectralGap has sections CSG.0–CSG.5.

   **Witness.** At the open head 2fdf27d, TauCetiRoadmap/CongruenceSpectralGap/README.md and its Suggested.lean contain no “CSG” label (0 occurrences each). Its sections are Layer 0 (:136, congruence quotient and positive spectrum) through Layer 5 (:688, the parameter bound and congruence gap). The CSG labels survive only in the board design file packages/CongruenceSpectralGap/design/README.md:37.

   **Repair.** Write “CongruenceSpectralGap Layers 0–5 (from the congruence quotient and positive spectrum to the parameter bound and congruence gap) owns …”. Both cited layers then resolve at the head (:136, :688). This is a scope deferral, not a *Needs:* edge, so supply direction is unaffected.

Three findings: one P2 (blocking) and two P3. All four round-2 findings are genuinely repaired, and none of the repairs introduced a new defect. The blocking finding is a degenerate-case error in the §1.9 stage identification, in a seeded target that earlier rounds had not tested.

## Verified sound

### Round-2 findings, checked first

| Finding | Repaired passage now in README.md | Computed or resolved check | Status |
| --- | --- | --- | --- |
| F01 (P1) complex derivative inside the conjugation | :1173 “R_y(Y)(overline(E(y,v,λ)))”, plus two new Checks at :1185 and :1187 | Mass-one circle, D=(2π)⁻¹d/dx, so De₁=ie₁ and De₋₁=−ie₋₁. Take Y=iD−1: Ye₋₁=0 and Ye₁=−2e₁. For f=e₋₁ the kernel is e₁(x)conj(e₁(y)); differentiating conj(e₁(y)) gives Ye₋₁=0=R(Y)f, so 0≤p(0)=0. The old form gives 2≤0. The sign also follows from the source's kernel-derivative identity (2.10.2.6), bpcz line 2524. For real Y=D both forms give coefficient −i. | Repaired |
| F02 (P2) duplicate Fréchet open-mapping gap | :9, :191–193, :715, :725, :995. plan.json has 26 gaps and no frechet-open-mapping. | SpectralManifolds SM3 (#1158 head c87f958, README:79) owns open mapping between complete metrizable locally convex real/complex spaces and closed-subspace quotients. At the pin, Mathlib has only the Banach version (Mathlib/Analysis/Normed/Operator/Banach.lean:228) and the σ-compact group version (Mathlib/Topology/Algebra/Group/OpenMapping.lean:114). LocallyAnalyticDistributions §0.2 is ultrametric only. Test maps: z↦2z sends the unit disc onto radius 2; the zero map ℂ→ℂ gives ℂ/ℂ=0=image. | Repaired |
| F03 (P2) Schwartz action planned twice | :489–493 now imports the action of AutomorphicFormsOnReductiveGroups §2.7 and compares conventions | AutomorphicFormsOnReductiveGroups #1037 head c00e220: README:467 (the integrated Schwartz algebra acts continuously and nondegenerately) and §0.3 at :130–134 (density, convolution). Checks: for π_t(x)=e^{itx}, π_t(L(X)f)=it·π_t(f), giving factors i (t=1) and 2i (t=2); ∫e^{−πx²}dx=1 on both sides; on a one-point group both actions are f(1)v. | Repaired |
| F04 (P3) isobaric locator | :11 and :189, “preparatory GLₙ isobaric sums (anchor isobaric-construction)” | AutomorphicLFunctionsAndLocalFactors #924 head 5d22a23: anchor at README:269, target at :271; strong multiplicity one at :2288, inside Layer AL.3 (:1950). New Check: (1−2T)(1−3T)=1−5T+6T² and (1−2T)²=1−4T+4T². | Repaired |
| F09 (round 2) transfer ownership and order | :17 and Downstream consumers | Settled as not actionable in this package; the reason still holds, and it is not re-raised. For the maintainer: packages/GanGrossPrasadUnitaryGroups/README.md:133 (and #1404:133) still asks for transfer preservation from “Part II §§SM.0–SM.5”. No SM.n labels exist here. | Settled |

**Pattern search after the repairs.**
- Conjugate-versus-derivative order: checked in §3.1 (conjugate tensor factor), §3.2 (I_P(λ,g)*=I_P(−conj λ,g*)), §3.8 (kernel Σ_γ f(x⁻¹γy), so R_x(X)↔L(X)f and R_y(Y)↔R(Y)f) and §3.9. All are consistent.
- Generic gaps already owned elsewhere: each of the 26 slugs was compared again with SM3, LocallyAnalyticDistributions, OperatorIdeals on main and Mathlib.
  - frechet-bilinear-continuity: LocallyAnalyticDistributions README:292 is ultrametric only, and Mathlib has nothing at the pin.
  - hilbert-schmidt-nuclear-composition: OperatorIdeals OI-B29–OI-B55, OI-B84 and OI-B88 contain no Hilbert–Schmidt∘Hilbert–Schmidt trace-class bound. V4.Core (#1041:177) gives pairings and cyclicity, not the locally convex nuclear convention.
  - arthur-factorization-comparison is needed: AutomorphicSpectralTheory §6.3 at c5cfb92 (README:2982) is Arthur's spectral multipliers, not the factorization.
- Supplier-owned constructions: the §2.5 smooth-vector identity is consistent with AutomorphicFormsOnReductiveGroups §2.7 Dixmier–Malliavin, and §2.13 matches that roadmap's §0.4 at P=G.
- Cited labels: every cited section label was resolved, which found R02 and R03.

### Seeded source sample

All 15 seeded targets were reopened in the cached extractions (bplzz = arXiv v3; bpcz = published pages). The manifest flags no unverified locators.

| Target | Locator read | Hypotheses and statement | Outcome |
| --- | --- | --- | --- |
| 0.4 | bplzz lines 448–457 (p.10), 506 (p.11), 621–638 (Lemma 2.19, p.13) | Real-form set = W-translates of the inducing involution among automorphisms of order ≤2; Y = projection of ρ+X*; split/compact torus gives an element of θ. The README's finite coset replaces the source's false finite-Aut claim at line 451. | Sound |
| 0.7 | Definition 2.8(3) line 478 (p.10); Remark 2.9(2)–(3) lines 489–493 (p.11); Remark 2.17 line 585 (p.13) | Support of restrictions; closure under products and W; M-module | Sound |
| 1.5 | Lemma 2.25 line 971 (p.20) | Minimal parabolic, irreducible finite-dimensional inducing data, generic unramified twist; exceptional loci excluded | Sound |
| 1.7 | Theorem 2.13 line 548 (p.12); Remark 2.26 line 1039 (p.21); Remark 2.16 lines 571–578 (pp.12–13) | Uniqueness for μ∈M_{θ∪{1}}^W; continuity and bi-K-finite preservation; the kernel is stated only on actual characters | Sound |
| 1.9 | Definition 3.1 line 1063 (p.21); §4.2 lines 1605–1628 (p.33); bpcz §2.5.2 line 1151 (p.209) | C_c∞ at finite places, finite products, hyperspecial units; stage = bi-J-invariant with support in G∞×C | R01; line pointer off by 7 lines |
| 2.2 | bpcz lines 963–994 (pp.205–206) | Franke weights, (2.4.3.10)–(2.4.3.11), (2.4.3.13), Lemma 2.4.3.2, Corollary 2.4.3.3 | Sound |
| 2.6 | bpcz lines 1252–1280 (pp.211–212) | Measure w·dx, smooth vectors, L²_{N,w}, L²_{σ,d,w}, regularization into L²_{w⁻¹} | Sound |
| 2.8 | Proposition 2.5.5.1, bpcz line 1284 (p.212) | ∃d₀ ∀J ∀w nuclear smooth inclusion; summable becomes absolutely summable; route via HS∘HS at line 1282 | Sound |
| 2.12 | bpcz lines 1327–1344 (pp.213–214); Lemma 2.5.11.1 line 1395 (p.215) | Reciprocal-weight total variation, non-strict LF union, dual of S₀⁰. The README correctly drops the source's strong-continuity claim. | Sound |
| 2.17 | Proposition 2.5.14.1, bpcz lines 1460–1471 (p.216) | Seminorm on T_N([G]_Q); x in P(F)N_Q(𝔸)\G(𝔸); in the integral bound N is chosen before r | Sound |
| 3.3 | bpcz lines 2063–2134 (pp.229–231) | X(G); (2.9.2.1)–(2.9.2.2); F_X as orthogonal of S_{Xᶜ}; Lemma 2.9.3.1 | Sound |
| 5.1 | Definition 3.16, bplzz line 1352 (p.28) | One complex s for ∞ and every v∉T; depends only on the class | Sound |
| 5.3 | Theorem 3.19, bplzz line 1428 (p.29); proof line 1440 | Range in the occurring components; μ(χ)=1; finite surviving list from Lemma 3.13 | Sound |
| 5.4 | Theorems 3.6–3.7, bplzz lines 1120–1130 (p.23); proof lines 1449–1458 (p.30); Remark 3.8 | Non-CAP gives the whole-L² range; the general case is on L²_cusp; χ need not be automorphic | Sound |
| 5.7 | Remark 3.20, bplzz lines 1459–1492 (pp.30–31) | Langlands components; Müller's bound in place of Donnelly's; PGL₂ one-way separation | Sound |

### Adversarial pass

Rows cover the sampled targets, the three Lean headlines, every passage the repairs changed and the targets the findings touch. Circle measure has mass 1 and eₙ(x)=exp(2πinx). Rows for untouched, unsampled sections rely on the round-2 table, whose rows all carry computed values.

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| Conventions: L(X), translation, induction | additive π_t; t₁z; GL₂ diag(a,1) with abs(a)=4 | ∫−f′e^{itx}=it∫fe^{itx}; t₁z=z−1; δ=4, induction factor 2, disintegration 1/2 (bpcz line 2429) | Sound |
| 0.4 real-form set | split SL₂; compact SU(2); U(1); split G_m; rank-2 rootless | θ={±1} for both SL₂ forms, θ_G={−1} for SU(2) (Example 2.15); U(1): plus space 0, Y=ℤ; G_m: Y={0}; [[1,m],[0,−1]]²=I for every m | Sound; finite coset is needed |
| 0.4 choice of base | SL₂, ρ=1 | ρ−wρ=2∈X*, so Y is unchanged | Sound |
| 0.7 sharpness | U(1): 1 and e^{z²}sin(πz)/(πz) | 1 is nonzero at every n∈ℤ; the damped sinc is 1 at 0 and 0 at n≠0; on z=iy its size is e^{−y²}sinh(πabs(y))/(πabs(y))→0; z·sinc vanishes on all of ℤ | Sound |
| 1.5 generic semisimplicity | parameter 2, weights ±1; SL₂ at ρ | characters 3 and 1 are distinct; at ρ the module is a non-split extension (discrete series submodule, trivial quotient) | Sound |
| 1.7 centroid and kernel | S₃ with δ_a,δ_b; symbol μ=2; SU(2) with μ=(e^{z²}sin(πz)/(πz))² | T₂(δ_a*δ_b)=2δ_ab=T₂δ_a*δ_b=δ_a*T₂δ_b; μ(0)=1 but μ(±(n+1))=0, so T_μ=0 | Sound |
| 1.9 stage | C=JxJ⊔JyJ; C={1}, J=K_f | 2 copies, matching; predicted 1 copy versus actual stage 0 | R01 |
| 1.9 Check citing SR.3 | SR #785 head 1383569 | Harish-Chandra Schwartz algebra mentioned 0 times | R02 |
| 2.2 Franke weights | G_m, P=G, λ=1, t=2 | d_λ=abs(x), d_{2λ}=abs(x)²=d_λ², d₀=1, d_{−λ}=abs(x)⁻¹; on t≥1, 1≤t≤t² | Sound |
| 2.6 weighted L² | φ=(1+abs(x))⁻¹; Franke weight p=2 | ∫φ²=2 but ∫φ²(1+abs(x))²=∞; with w=p² the norm is 2‖·‖₂, with w=p it is √2‖·‖₂ | Sound |
| 2.8 nuclearity | circle H^{s+2}→H^s; identity on H^s | singular values (1+n²)⁻¹, sum π·coth π≈3.153; identity has sum ∞ | Sound |
| 2.12 measures | 3δ_x with w(x)=2; δ_x−δ_y at w=1 | norm 3/2; total-variation distance 2, so translation is not strongly continuous | Sound |
| 2.17 constant term | Borel in GL₂, cusp form; tail e^{−y}, r=1 | CT=0 gives decay in every depth power; y·e^{−y}≤e⁻¹ | Sound |
| 3.3 support spaces | F_∅, F_{X(G)}; vector (2,3) in ℂ² | F_∅ = annihilator of S = {0}; F_{X(G)} = F; projection onto the first block gives (2,0) | Sound |
| 5.1 occurrence | ∞ forces s=0; Hecke value 2^s, target 2 | s=0 gives 1≠2; s=1 gives 2 but fails at ∞; no occurrence | Sound |
| 5.3 normalization | factors 2 and 3; one killed block | 6, normalized to 1; killed block 0/6=0 | Sound |
| 5.4 non-CAP | the source's intersection identity | L²_cusp ∩ ⊕_{occurring} = L²_cusp[χ] (bplzz line 1450) | Sound |
| 5.7 refinement | PGL₂, q(λ)=λ²−1/4 | q(0)=−1/4, q(it)=−t²−1/4, q(1/2)=0 | Sound |
| `finite_rank_weierstrass_product` | Λ=∅; Λ={0,1}, p=0; Λ=ℤ, p=1 | Ψ≡1. Ψ=z(1−z) with zeros {0,1}, Ψ′=1 and −1, abs(Ψ)≤(1+abs(z))²≤e^{2(1+abs(z))}. For ℤ: Σn⁻²=π²/3, Ψ=sin(πz)/π, Ψ′(n)=±1, abs(Ψ)≤e^{π(1+abs(z))²} | Sound |
| `polynomial_zero_fiber_interpolation` | n=1, q=z², ψ(w)=w−1; n=0; ψ=0 | ν=e^{z⁶}(z²−1) has zeros exactly ±1, and on abs(Re z)≤M, Re z⁶=−y⁶+O(My⁵); n=0: ν is the constant ψ(q); ψ=0: ν=0 | Sound |
| `affine_lattice_interpolation` | L=ℤ, A={0,1/2}; k=0; b=(1,1) | e^{z²}sin(πz)/(πz) takes 1 at 0, 2e^{1/4}/π≈0.817 at 1/2, and 0 at n≠0; L={a}; the dependent family fails hb | Sound |
| §1.2 repaired | π_t at t=0,1,2; one-point group | 1 for the Gaussian; i and 2i; f(1)v | Sound |
| §2.5/§2.18 repaired | z↦2z; zero map; identity parabolic | radius 2; ℂ/ℂ=0=image; graph map is the identity, norm preserved | Sound |
| §3.10 repaired | Y=iD−1; Y=D; Y=iD | 0 versus 0; −i versus −i; +1 versus +1 (the old form gives −1) | Sound |
| §5.6 repaired | Satake values {2,3}, {2,2} | 1−5T+6T² and 1−4T+4T² | Sound |
| §5.5 Check (near equivalence) | π=π̃_f⊗π′_∞ with π̃ cuspidal, π′_∞ a different infinitesimal character | π is nearly equivalent to π̃, but L²_cusp[χπ] excludes π̃ | Sound; a candidate finding was withdrawn |

### Headlines, elaboration, binders and padding

- **Headlines and coverage.** The README's headlines are §0.2, §0.3 (two), §0.8, §§1.3/1.6–1.8, §§2.7–2.8, §§2.15/2.18, §§3.1–3.2, 3.4, 3.6, 3.7, §§3.8–3.10, §§4.6–4.9 and §§5.2–5.7. The three analytic headlines are stated on native carriers. The module docstring names each other headline together with its missing carrier (reductive Schwartz algebra, quotient Schwartz/tensor spaces, cuspidal-support spaces, automorphic Hilbert decompositions). I treat §0.8 as correctly named rather than forced through an abstract stand-in.
- **Elaboration.** `lake env lean` on packages/AutomorphicSpectralTheoryPartII/Suggested.lean, run from the content checkout at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf), exited 0. The only warnings are the three `declaration uses sorry` at 85:8, 98:8 and 108:8. There is no Tau Ceti import, a single `import Mathlib`, no `set_option` and no sorry'd data.
- **Binder check.** A scratch copy with `#check @name` for all 10 declarations elaborated with exit 0. Every type matches the README:
  - `HasRapidVerticalDecay`: ∀M>0 ∀r ∃C≥0 ∀z.
  - `affineSpectralLattice`: arbitrary b; independence sits in the theorem.
  - The three theorems keep their hypotheses: the rank bound; differentiability plus finite order; complex linear independence.
  - No section binder was lost, and nothing needed to change.
- **Padding probe.** Fifteen one-tactic probes (`simp`, `rfl`, `infer_instance`, `exact?`, `aesop`, each wrapped in fail_if_success/solve and run as examples so no sorried copy could be found) all failed to close. No declaration restates a definition or mirrors a Check.

### Duplication and ownership

**Pinned libraries.** No Weierstrass elementary factor, canonical product, finite-order predicate or vertical-decay interpolation exists at the pins. Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean is the ℘ function only. Tau Ceti hits for these names are unrelated (Weierstrass equations, finite group order).

**Roadmaps.** Object searches over main and the 362 open heads covered quasi-cuspidal, T-multiplier, Schwartz multiplier, Delorme, BPLZZ, Lapid, moderate/sharp symbols and Harish-Chandra Schwartz:
- SmoothRepresentationsOfLocalGroups' quasi-cuspidal is a local notion.
- EndoscopicTransferAndUnitaryTraceComparison's Delorme items are invariant Paley–Wiener, not rapid-symbol multipliers.
- AutomorphicSpectralTheory §3.7 builds compactly supported wave packets, whereas §3.7 here is Lapid's expansion on C([G]).
- AutomorphicSpectralTheory §5.1 uses Franke's p_λ on [G] without owning the intermediate d_{P,λ} of §2.2.

**Board packages.** All 20 board packages in the index were read at their indexed heads by read-only API calls: 5 package READMEs and 15 design READMEs (round 2 could not read the latter). None overlaps (only ArithmeticLocallySymmetricSpacesPartII WM.4's SL₂ cuspidal dimension counts mention cuspidal support). The local board packages were also searched.

No Suggested.lean name collides with another roadmap's fully qualified name.

### Supplier order, citations and gap contracts

```text
depcheck: 51 roadmaps, 587 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The resolver reports none found nowhere (main 5f173a7).

**Cross-roadmap citations checked at main or at the indexed head:**
- AutomorphicSpectralTheory (c5cfb92): §§0.11–0.15, 1.5–1.10, 2.1–2.5, 3.1–3.4, Layer 4 (4.1–4.14), 5.1–5.9, 6.1–6.4.
- AutomorphicFormsOnReductiveGroups (c00e220): §§0.1–0.5, 2.1–2.4, 2.7, 3.4–3.5, 4.1–4.2.
- AdelicAlgebraicGroups (70c4324): §§2.1–2.3, 3.1, 3.4–3.6, 4.6–4.7.
- SmoothRepresentationsOfLocalGroups (1383569): SR.1.1–1.3, 2.2, 4.1–4.2.
- AutomorphicLFunctionsAndLocalFactors (5d22a23), SpectralManifolds SM3, VonNeumannAlgebras V4.Core.
- GlobalHolomorphicFunctions (ffb25b5) :224; ZerosOfLFunctions (cce2e04): finite-order convention :279 and Layer 5 items 1–6; ModularCurvesPartII (35be0c8) §1.4a; GanGrossPrasadUnitaryGroups (db8ad41) §§6.3–6.4.
- On main: ReductiveGroups Layer 7, LieGroups Layers 6–7, NoncommutativeGeometry N1 (completed projective tensors at :84), OperatorTheory SelfAdjointSpectralTheory Parts A–E, OperatorIdeals OI-B29–B41, OI-B84 and Part C, PDE Lane A (:223).
- Only the CongruenceSpectralGap labels fail to resolve (R03).

All 26 declared gaps match exactly between the README contracts and plan.json (slug, supplier and needs). Every gap names a supplier, so none is unowned. The three gaps rechecked against new owners remain minimal (see the pattern search above).

**Notes for the maintainer, not findings:**
- The frozen non-gap nodes of design/plan.json still carry the pre-repair kernel formula and the integrated-action construction. The README is correct.
- CongruenceSpectralGap's README:7 says this Part II consumes the congruence gap; this package does not.

### Library declarations opened at the pins

| Declaration | File:line | Content and boundary |
| --- | --- | --- |
| HasProd, Multipliable (to_additive Summable) | Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:106, :114 | Finset-filter limits with default unconditional summation filter; no countability or origin exclusion |
| SchwartzMap | Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean:75 | Euclidean real normed spaces only |
| Differentiable | Mathlib/Analysis/Calculus/FDeriv/Defs.lean:170 | Everywhere differentiable |
| Complex.exp | Mathlib/Analysis/Complex/Exponential.lean:62 | Irreducible series definition |
| MvPolynomial.eval / Polynomial.eval | Mathlib/Algebra/MvPolynomial/Eval.lean:256; Mathlib/Algebra/Polynomial/Eval/Defs.lean:249 | Ring-homomorphism evaluation |
| MeasureTheory.Lp | Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89 | Almost-everywhere classes; no pointwise evaluation |
| CentroidHom | Mathlib/Algebra/Ring/CentroidHom.lean:56 | Additive with both multiplication laws; no topology |
| ContinuousLinearMap.isOpenMap; MonoidHom.isOpenMap_of_sigmaCompact | Mathlib/Analysis/Normed/Operator/Banach.lean:228; Mathlib/Topology/Algebra/Group/OpenMapping.lean:114 | Banach and σ-compact group only; no Fréchet theorem |

## Not verifiable

- Bernstein, On the support of Plancherel measure, §§3.4–3.5: the work is uncertified (paywalled) and is cited by locator only. It was not requested again.
- The printed bar placement on BPCZ p.240 cannot be seen in the text extraction. The repaired formula was instead verified from the source's identity (2.10.2.6) at bpcz line 2524 and by the circle computation; the image was not reopened.
- The original papers of Kostant, Delorme, Donnelly and Müller were not opened. They are consumed through the declared contracts and through their uses at the quoted BPLZZ and BPCZ lines.

## Source issues

- **Error** in bplzz at §2.2, printed p.10 (bplzz line 451): the source says the order-at-most-two automorphisms of a root datum form a finite set; it should be restricted to a single W-coset of a real-form involution, since the rootless rank-two lattice has infinitely many; affects a stated result.
- **Error** in bplzz at Remark 2.16, printed p.12 (bplzz lines 574–577): the source says the realized infinitesimal characters equal the full union of shifted strips; it should say they are contained in it, since compact SU(2) never realizes 0; affects a stated result.
- **Misprint** in bplzz at Theorem 3.19(1), printed p.29 (bplzz line 1434): the source names decomposition (3.9) for the cuspidal components; it should name the fixed-level coarse decomposition (3.2); affects nothing.
- **Error** in bpcz at §2.5.4, printed p.210 (bpcz lines 1217–1218): the source says equivariant SLF morphisms with closed image are topological embeddings; it should say the quotient by the kernel maps isomorphically onto the image, as the zero map shows; affects a stated result.
- **Error** in bpcz at §2.5.9, printed p.213 (bpcz line 1333): the source calls the weighted Radon-measure space a continuous Banach representation; translation is not strongly continuous, since distinct Dirac masses lie at distance 2; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7a04b43", "job": "REV-PKG-AutomorphicSpectralTheoryPartII~3", "model": "opus", "worker": "fable-rev111"} -->
