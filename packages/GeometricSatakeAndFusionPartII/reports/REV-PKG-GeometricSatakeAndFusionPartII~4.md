<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1177#issuecomment-6404356611 -->
Review (claude) of e609a13

Verdict: needs_changes

1. **F01** (P1) Schubert unibranchness at every prime has no owner

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:1016 (“the needed generic Schubert unibranchness is an upstream Grassmannian input”), line 1046 (§7.4, “every stalk on a codimension ≤1 stratum … has H^(−d)(Z_μ)_x≅F_ℓ”), line 1036 (§7.3), line 105 (the only candidate contract).

   **Claim:** §7.5 asserts connected tubes for every reductive G, parahoric level, dominant μ and every p, and §7.6 deduces normal models at every p. Its route needs, at every p: (a) H^(−d)(IC_μ)=F_ℓ on the generic Schubert variety (GL Lemma 5.1, which uses “Schubert varieties being unibranch”, GL line 420); (b) the lowest costandard stalk H^(−ℓ(t^ν))(∇_ν)=F_ℓ on the special-fibre Schubert variety (GL Lemma 5.4, “because the Schubert perfect variety is normal”, GL line 459); (c) geometrically unibranch components of the canonical deperfection for the S₂ criterion (GL Proposition 3.4, GL line 281; the roadmap's gap:s2ification-connectedness at line 59 takes unibranch components as a hypothesis the roadmap must verify).

   **Witness:** The only contract supplying unibranchness is gap:algebraic-schubert-normality (line 105), which is stated “in the prime-to-p companion range”. GeometricSatakeAndFusion at head 0652974 states no unibranch or normality result for Schubert varieties (grep of its README for “unibranch”, “normal Schubert”: no hit; its standard/costandard target at line 1262 asserts no lowest-stalk constancy). The roadmap's own §3.1 Check (line 574) exhibits PU₃(F′/F) at p=3 with |π₁(G^der)|=3, whose quasi-minuscule Schubert variety is non-normal (HLR line 1860); for this datum the declared gap supplies nothing, yet §§7.5–7.6 assert connected tubes and a normal model. The needed theorem exists: HLR Theorem 1.1 (HLR line 69–72) proves the non-normal Schubert varieties geometrically unibranch, and HLR line 92 identifies the normalization as a finite birational universal homeomorphism; neither is cited or owned.

   **Exact repair:** Declare `gap:schubert-geometric-unibranchness`, supplier GeometricSatakeAndFusion, section “GS0, Equal-characteristic Schubert models and coefficient comparison; algebraic Schubert prefix”, needs: “For every connected reductive G over a p-adic field or over k((t)), every parahoric level and every residue characteristic, prove that every Schubert variety of the equal-characteristic and Witt partial affine flag varieties, and every closed Schubert bound Gr_≤μ of the B_dR-Grassmannian, is geometrically unibranch, its normalization being a finite birational universal homeomorphism (HLR Theorem 1.1, p. 2, HLR line 69 and HLR line 92; GL line 420 and GL line 459).” Add the same entry to design/plan.json `gaps`, state it under the GeometricSatakeAndFusion contracts, and cite it in the *Needs:* lines of §§7.1, 7.3 and 7.4 (and hence §7.5). Leave gap:algebraic-schubert-normality as it is: normality and Cohen–Macaulayness remain prime-to-p statements.

   **Test of repair:** For PU₃(F′/F) at p=3, μ=(1,0,0), the quasi-minuscule Schubert variety is non-normal (HLR line 1867) but unibranch (HLR line 72), so H^(−2)(∇)=F_ℓ holds, Lemma 5.4's bound 1 applies in codimension one, and §7.5's argument closes; for split GL₂ at any p the gap is consistent with the normality already supplied. Without the gap the Needs chain of §7.5 supplies no unibranch input for any p dividing |π₁(G^der)|.

2. **F02** (P3) The general local-model datum is used but never defined

   **Location:** packages/GeometricSatakeAndFusionPartII/README.md:365 (“*Needs:* §1.1; §0.1 with arbitrary dominant class”), line 185 (§0.1 defines only the minuscule datum), line 345 (“Use the group, level and reflex-field data of §0.1 without its minuscule restriction”).

   **Claim:** §§0.4, 1.2, 2.3, 3.5, 7.5, 8.1–8.4 quantify over a datum (F,G,{μ},𝒢) with arbitrary dominant μ, but §0.1 defines the datum with “{μ} is a geometric minuscule conjugacy class”, so the general datum has no defining sentence and §1.2's Needs line cites a variant that does not exist.

   **Witness:** README line 185 versus line 365; the GL₂ class (2,0) is excluded at line 200 and used at line 360.

   **Exact repair:** In §0.1 add one sentence: “A local model datum with general bound is the same quadruple with {μ} any geometric dominant conjugacy class; the minuscule datum is the special case used by the scheme representatives of Layers 0–3.” Change §1.2's Needs to “§0.1 (general bound)”. Also correct “Finkelberg–Mirkovic” to “Finkelberg–Mirković” in the Suggested.lean docstring (line 24).

   **Test of repair:** The (2,0) Check at line 200 and the §1.2 Check at line 360 then refer to the same defined object; nothing else changes.

Two findings: one P1 (an input of the all-prime tube theorem that no supplier owns) and one P3. The four findings of round 3 are repaired, and the repairs are mathematically sound; the P1 below is in text the repairs did not touch (Layer 7), reviewed in full this round because the earlier rounds' rows for §§7.1, 7.3 and 7.4 carried computed values only for the tube-stalk formula, not for the geometric input of GL's Lemmas 5.1 and 5.4.

## Verified sound

### Previous findings, checked one by one

| Round-3 finding | Repaired passage (README) | Status and check |
| --- | --- | --- |
| F01 (P2) hyperspecial realization | Line 421: “Assume p>2, G=Res_(K/F)H with H tamely split and classical without triality, μ minuscule, and x generic in its facet … require p∤index(D). ReductiveGroupsPartII RG2.3.5 … supplies a point x′ with the same full fixer 𝓗_(x′)=𝓗_x and a tame Galois splitting extension K̃/K over which x′ is hyperspecial”; propagated at lines 436 and 592. | Repaired. RG2.3.5 “Tame realization of stabilizers as fixed points of hyperspecial models” at #785 head 1383569 (its line 4708) states exactly (1) x′ with 𝒢_{x′}=𝒢_x and a tame Galois K̃ making x′ hyperspecial, under p>2, tame classical without triality, p∤ind D, x generic. KPZ line 418 (p>2), 464 (classical, no triality), 475–481 (index, x′). New Check (line 430) computed: s=√2−1 irrational so es∉ℤ for all e; x′=1/4 and s both in (0,1), same Iwahori; Q₃(ζ₄,3^(1/4))/Q₃ has f=2 (x²+1 irreducible mod 3), e=4 (x⁴−3 Eisenstein over Q₃(i)), tame since 3∤4, Galois since ζ₄ present; 4·(1/4)=1 is a vertex. |
| F02 (P2) restriction of scalars | Line 345: closure of Gr_≤ν for any dominant ν (LEV Definition 4.2.1, LEV line 960; Proposition 4.2.6, line 1007); line 446: “ν the dominant representative of ρ∘μ … The target is the Schubert-bound closure of §1.2, even when ν is not minuscule”. | Repaired. Computed: K/F unramified quadratic, V=K, μ=(2,0): source flag a point; ν=(2,0), ⟨ν,α⟩=2, dim Gr_≤ν=⟨2ρ,ν⟩=2, GL₂/P_ν=P¹ of dimension 1. μ=(1,0): target P¹, weight-one rank 1. Rank formula ed, e(n−d) for constant weights. A non-0/1 minuscule μ (e.g. (3,2) at one embedding) gives non-minuscule ν=(3,2,1,0): the generalization is necessary. KPZ line 1046–1097 confirms the map, special-fibre closed immersion and Nakayama step are bound-independent. |
| F03 (P2) partial-chain flatness | Line 488: X_I=Fl_full×_(Fl_I)M_(I,k), smooth surjection with refinement fibres, reducedness by compatible splitting, flatness by lifting component generic points; new gap at line 107. | Repaired. GORGL line 1326–1346 (M̃^loc_I is the inverse image of the special fibre under F→SL_n/P_I, a union of Schubert varieties, cut out by the lattice conditions λ_i⊇L_i⊇tλ_i for i∈I), line 1416–1420 (smooth over M^loc_I, reducedness descends), line 1406–1412 (flatness via lifting the generic points of components), Corollary 3.4.4 line 643 and GORSP Theorem 3.3 line 352 (compatible splittings of all Schubert subvarieties). Checks computed: full I gives X_I=M_(I,k); one-lattice GL₂, d=1: fibres GL₂/B=P¹; d=0: M=Spec k, X_I=P¹; forgetting F₁ on x₁y₀=πx₀y₁: fibre P¹ over [1:0] (equation 0=0), one point over [0:1] (x₁=0), generic isomorphism; chart x₀=y₁=1 gives xy=π. Gap text is precise and minimal: SchubertGeometry S5 on main covers finite flag varieties only; GS0 line 785 states no splitting (grep). |
| F04 (P3) detecting minimum | Lines 788–805: D_H^S, l_H^S, four API bullets, five Checks. | Repaired. KPZ line 1761 defines W(H) over all dominant weights and l_H; line 1804 restricts to S. Since D_H^S⊂W(H), l_H^S≥l_H≥min k_(−β) and KPZ's reverse inequality uses only pairs in D_H^S, so l_H^S=l_H=min{k_(−α):m_α≠0}. Computed: SL₂, λ=0, μ=α∨: derivatives ±1, candidates {1,1}, min 1=k_(−α) (max{j: jα∨≤α∨}=1); λ=μ=α∨: {0,2}, min 0=k_(−α) (only j=0); H=0: empty set; char 3, 2H_α: derivatives (2,1), same minima. Nonnegativity: ⟨μ−λ,ω⟩+⟨λ,ω−ω′⟩ with both terms ≥0. |

Round-2 findings marked not actionable (F02, F07 of that report: allocation of the parent's continuations and acceptance of supplier continuations) are settled; their reasons stand and are not re-raised.

### Sources: the 15 seeded targets, read at their locators

All 21 manifest records are certified with legal cached extractions; no author-flagged unverified locator exists; no fetch was needed. Line numbers are those of the cached extractions.

| Target | Read | Outcome |
| --- | --- | --- |
| 0.2 Hodge and abelian type | KPZ Definition 3.1.2–3.1.3, p. 16, line 700–711; §3.1.9, p. 17, line 761; KZ local Hodge embedding line 827–831, Definition 3.1.6, p. 19, line 856–867 (weights 0,−1 as diag(1^(n−d),(a⁻¹)^(d))); SW Definition 21.6.8, pp. 200–201, line 7685 | Matches: faithful, minuscule, scalars, μ↦diag(z1_d,1_(h−d)); abelian type via adjoint pair; KZ inverse convention recorded. |
| 0.6 Good integral Hodge embeddings | KPZ Definition 3.4.4 and chain variant, pp. 28–29, line 1234–1245; KZ Definition 3.1.6(2), line 862 | Matches: goodness is closedness of ρ_* on local models; chain variant with GL(𝓛). |
| 1.6 One-lattice GL representative | SW Proposition 21.6.9, proof of Corollary 21.6.10, pp. 201–203, line 7710–7769; KPZ line 768 | Matches: kernel chain, closed immersion of the naive diamond, generic fibre Gr_μ; Gr(d,Λ)^♦=M^v for GL. |
| 2.1 Closed polynomial embedding into a split form | KPZ §2.1.1 line 418, §2.2.1 line 464–470, Proposition 2.2.2 line 475–488, §§3.3.1–3.3.7 line 900–915 | Matches after repair (see F01). |
| 3.2 Normalization of images | KPZ §3.1.9 and (3.1.10), p. 17, line 761–778 | Matches: ρ_* identifies M^loc with the normalization of its schematic image; point diagram with Witt Grassmannians. |
| 3.3 Descent endomorphisms | KPZ Proposition 3.4.6, Remark 3.4.7, pp. 29–30, line 1272–1300 | Matches: good embedding for the Γ-stable Weyl lattice at the hyperspecial x′; cutout by centralizers of t_γ and t_a. |
| 3.5 General-bound kimberlites | AGLR Proposition 4.14, Remark 4.15, pp. 30–31, line 1701–1731; GLX §3.2 line 749, Theorem 3.8 line 886 | Matches: flat π-adic kimberlite, enough facets, O_C-formalizable sections, perfect Schubert special fibre, arbitrary μ. |
| 4.3 Big-cell tangent coordinates | KPZ §4.1.7, p. 32, line 1371–1395 | Matches: t^λL⁻⁻Gt^(−λ) open chart; tangent ⊕t^(⟨λ,α⟩−1)k[t⁻¹]X_α⊕t⁻¹k[t⁻¹]𝔱; rotation×T weights. |
| 6.3 Naive EL/PEL quotient model | SW Definition 21.6.8, pp. 200–201, line 7685–7707 | Matches: periodicity, polynomial-law determinant identity, PEL composite zero, c∘μ=id. |
| 7.1 Tube components from the lowest stalk | GL Lemma 5.1, Theorem 4.7(1), pp. 9–10, line 401–427 | Formula matches; its unibranch input is R01. |
| 7.2 Two maximal translations | GL Lemma 3.1, pp. 5–6, line 237–243 | Matches: codimension-1 element, parallel reflecting hyperplanes, line meets sphere at most twice; general μ. |
| 7.5 Connected tubes for every bound | GL Theorem 1.3 line 78, Lemma 5.2 line 430, final proof line 471–483; GLX Theorem 3.8 line 886 | Route matches (Iwahori reduction, clopen splitting on an étale neighbourhood, S₂ connectedness, perverse support); input ownership is R01. |
| 7.6 General normal minuscule models | GL Lemma 1.2, Theorem 1.3, Corollary 1.4, pp. 2–3, line 61–83; GLX line 749 | Matches: unibranch ⇒ normal, R₀+S₁ ⇒ reduced special fibre; CM/Frobenius split not claimed. |
| 8.2 Semisimple trace function | AGLR §1.1 line 121–140, (8.6) line 2940–2947; PZ §9.d.1–9.d.2 line 3064–3100, (9.9) line 3120; KP (4.7.7) line 3722, §4.7.8 line 3733 | Matches: sign (−1)^(⟨2ρ,μ⟩), lift-dependence, averaging gives the semisimple function; RΨ≅Q_ℓ[d](d/2) for minuscule hyperspecial. |
| 8.4 Satake characterization and Bernstein normalization | AGLR Theorem 1.3 line 141–151, Lemma 8.2 line 2948, Theorem 8.3 line 2963, proof line 2969–3019 ((8.9)–(8.15)), Lemma 8.4 line 3020–3043; PZ Proposition 9.15, Theorem 9.16 line 3115–3134; KP Theorem 4.7.11 line 3750 | Matches: constant-term injectivity, inner-form support (8.14), torus case, reflex-field induction; generality “any connected reductive G, parahoric, any μ” confirmed at AGLR line 60–63. |

Further locators opened this round, each at its claimed content: KPZ line 1036–1097, 1118–1142, 1334–1346, 1481–1500, 1610–1640, 1743–1812, 886–896; KZ line 870–960, 2179–2232, 2312–2325; SW line 7640–7672, 7810–7850, 7896–7918; GL line 36–54, 255–297, 385–409; GORGL line 636–652, 1318–1420; GORSP line 345–360; LEV line 945–968, 1003–1012; HLR line 68–95, 1805–1880; ALWY line 310–316, 1468–1500; KP line 1277–1292, 1338–1356; and one-line spot checks of HAI15 24, 742; HAI14 1888, 1896, 2087; PR 916; RZ17 1014, 1115; FHLR 1540; GLE22 2293; PRLSV 2194; GORSP 95, 149; LEV 791, 1024; KPZ 562, 1125, 1347, 1404, 1427, 1612, 1984, 2002; KZ 926, 948, 2120; AGLR 2180, 2214, 2239, 2776, 2863; SW 7488, 7491, 7622, 7847; KP 1235, 1474, 1523, 1755, 3693; PZ 3005; KRZ 525; HLR 1816. All agree with the cited theorem numbers and pages.

### Adversarial pass

Rows cover the sampled targets, the repaired passages, the headline families and the findings. “No change” means the computed instance agrees with the statement as written.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: coroot order, translation sign | PGL₂ endpoints (0,2),(0,1); diag(t,t⁻¹) | 2−0=2·1 in 2ℤ; 1−0∉2ℤ. Cocharacter (1,−1), displacement (−1,1) per GL line 226–227 | Integral order and BT sign retained | No change |
| Conventions: Tate normalization | q=9, d=0,1 | (φ,τ)=(1,1),(1,−1/3); κ^ss=(−1)^dτ=1/3; exponent +1/2 would give −3 | Agrees with PZ (9.9) and AGLR (8.6) | No change |
| 0.1 minuscule datum vs general datum | GL₂ (1,0),(2,0),0 | Root pairings 1,2,0; (2,0) excluded at line 200, used at line 360 and in §0.4 | General datum undefined | R02 |
| 0.2 Hodge weights | h=3,d=1; m=2,0 | Kernel rank 2; ranks (6,2); empty sum rank 0, kernel GL₂ | m≥1 needed | No change |
| 0.4 central comparison | SL₂→PGL₂ | diag(z,z⁻¹)↦2∈ℤ; 2n=1 unsolvable | Minuscule lift is a real hypothesis | No change |
| 0.5 representative | P¹_O and its blow-up at a special point | Special components 1 vs 2 (both reduced); exceptional P¹ collapses to a point so the diamond map is not mono | Monomorphism clause excludes the blow-up | No change |
| 0.6 goodness vs normalization | Spec k[t]→Spec k[t²,t³] | Finite, birational, bijective; t∉k[t²,t³] | Not a closed immersion | No change |
| 1.2 Schubert-bound closure | Hyperspecial GL₂, ν=(2,0),(1,0),0 | dim Gr_≤ν = ⟨(1,−1),ν⟩ = 2,1,0; finite flags 1,1,0 | General bound ≠ flag | No change |
| 1.6 GL representative | h=3,d=1 | Gr(1,3)=P², dimension 2; SW kernel rank 2 | Duality dictionary required | No change |
| 2.1 realization | GL₂/Q₃, s=√2−1, x′=1/4 | es irrational ∀e; e=4,f=2 for Q₃(ζ₄,3^(1/4)); 4x′=1 | x′ needed; hypotheses now stated | Repaired (F01) |
| 2.3 restriction target | Quadratic unramified torus, μ=(2,0),(1,0); μ=(3,2) at one embedding | ν=(2,0): dimension 2 vs P¹; (1,0): P¹, rank 1; (3,2)⊕(1,0)→(3,2,1,0) non-minuscule | Target must be a Schubert bound | Repaired (F02) |
| 2.3 ranks | e, n, d; d=0 | ed, e(n−d); en at d=0 | Both conventions consistent | No change |
| 2.6 X_I and smoothness | Full I; one-lattice GL₂ d=1,0; k[ε]/ε² | X_I=M; fibres P¹; Spec k vs P¹; [1:0]≠[1:ε] | Cartesian definition needed | Repaired (F03) |
| 2.6 forgetful map | x₁y₀=πx₀y₁, forget F₁ | Fibres P¹ over [1:0], point over [0:1]; generic isomorphism; chart xy=π | Not smooth; flatness independent | Repaired (F03) |
| 2.6 worked example consistency | a=x₀,b=y₀,c=x₁,d=y₁ | πad−bc=πx₀y₁−y₀x₁; components b=0, c=0 meet at ([1:0],[0:1]) | §2.6 and Worked examples agree | No change |
| 2.6 compatible splitting gap | Point ideal in P¹; k[ε]/ε² | Split point ideal: intersections reduced; ε²=0,ε≠0 not Frobenius split | Scheme-theoretic reducedness is the content | No change |
| 2.8 trace form | K=F, r=1; r=0; F_p(t^(1/p))/F_p(t) | Ψ(e₁,e₂)=1; zero space nondegenerate; inseparable trace 0, radical everything | Separability and r≥1 needed | No change |
| 3.1 PU₃ Check | p=3, ramified quadratic, (1,0,0) | |π₁(PU₃)|=3; quasi-minuscule Schubert variety dimension 2, non-normal (HLR line 1860–1868) | Canonical ≠ raw model; this instance also refutes R01's coverage | R01 |
| 3.2 image normalization | Cusp vs identity | Same fraction field, t missing; identity surjective | Normalization can be strict | No change |
| 3.3 descent cutout | Split GL₂, Γ=1 | Γ-equations empty; multiplication equations automatic; chain π^iΛ | x′ propagated | Repaired (F01) |
| 3.5 kimberlite | GL₂ ν=(2,0), 0 | Generic dimensions 2, 0; reduction perfect Schubert scheme; one point at 0 | Arbitrary bound admitted | No change |
| 4.1/4.2 curve span | A¹; k[ε]/ε²; xy=0; x²+xyz=0 | (tangent,span)=(1,1),(1,0),(2,2),(3,2); f(f+gh)=0 forces f∈(a²) | Span ≠ set of derivatives | No change |
| 4.3 coordinates | SL₂, λ=0, α∨ | Root exponents start at −1 and at 1; Cartan at −1 | Matches KPZ line 1387 | No change |
| 4.4 tests | B₃ μ=(2,0,0), ν=(1,1,0); μ=(1,0,0), ν=0 | Spin test ⟨(1,−1,0),(½,½,½)⟩=0; ω₁,ω₂ tests 1,0; coordinate sum 0 even; second case sum 1 odd | Coroot coset is substantive; S_B={ω_n} per KPZ line 1627 | No change |
| 4.5 root curves | SL₂, λ=0, μ=α∨, j=0,1,2 | k_α=1; derivative t⁻¹X_α; j=2 gives 2α∨>α∨ | Interval exact | No change |
| 4.6 FM bound direction | SL₂, μ=α∨, ν=ω, torus point | t·φ(E(ω))=t²e₁⊕e₂ ⊂ k[[t]]² ⊂ t⁻¹φ(E(ω))=e₁⊕t⁻²e₂ | Both inclusions of (4.2.7) hold at t^μ | No change |
| 4.8 Cartan sign | u=((1,0),(1,1)) | uEu⁻¹=((−1,1),(−1,1))=E−H−F; H-coefficient −1 ≠ 0 at p=2 | Span unchanged | No change |
| 4.9 detecting minimum | SL₂ (0,α∨),(α∨,α∨); H=0; 2H_α at p=3 | {1,1}→1; {0,2}→0; empty; (2,1) same minima; k_(−α)=1,0 | Equality l=k holds | Repaired (F04) |
| 4.9 Dᴴ coefficient | m=1 | −2m=1 in F₃, 0 in F₂ | p≠2 retained | No change |
| 5.2 unitary formula | c=a, d=−a²/2; a=1 in F₃; F₂ | a²−a²/2−a²/2=0; terms 1,1,1 sum 0; 1/2 undefined in F₂ | p≠2 retained | No change |
| 5.4 lift | diag(t,t⁻¹) | Pole present; conjugator in 𝒢(k[[t]]) | Translation Laurent, conjugator positive | No change |
| 6.1 module type | O_D/Π⊗_(F_p)R for F_(p²)-algebra R | R×R; ranks (1,1) vs (2,0) | Type condition substantive | No change |
| 6.4 kernel | h=3, quotient onto e₁ | ξe₁⊕e₂⊕e₃; determinant ξ | Divisor-ring kernel | No change |
| 6.6 base change | xy=ϖ² | Dimension 2, embedding dimension 3, special fibre xy=0 reduced | Normal, not regular | No change |
| 7.1 formula | Zero bound; smooth point; node xy=π | Components 1,1,1; H⁰ dimension 1 (point, disc, annulus) | Formula correct; input ownership | R01 |
| 7.2 translations | GL₂ Iwahori (1,0) | Adm = {t^(1,0),t^(0,1),τ}; τ below exactly 2 | Bound 2 attained | No change |
| 7.3 S₂ | k[x,y]/(xy); two planes at a point | (dim,depth)=(1,1) S₂; (2,1) not S₂, both connected | Codimension-one graph needed; unibranch hypothesis | R01 |
| 7.4 Wakimoto stalk | Extremal ν, boundary x | Standard term contributes 0; other factor multiplicity 1; lower bound 1 from density | Rank exactly 1; constancy of lowest costandard stalk needs unibranch | R01 |
| 7.5/7.6 all-prime claims | PU₃ at p=3 (|π₁|=3); split GL₂ at p=2 | For PU₃ no declared contract supplies unibranchness; for GL₂ gap:algebraic-schubert-normality applies | Unowned at p dividing |π₁(G^der)| | R01 |
| 7.8 lattice test | diag(π⁻¹,1,1), diag(π⁻²,1,1) | πgΛ/πΛ=k·e₁; π⁻¹e₁∉Λ | Bounds make reduction defined | No change |
| 8.1 monodromy | Two-dimensional unipotent block | N²=0, N≠0 | Unipotent ≠ trivial | No change |
| 8.2 trace | Block eigenvalues (1/9,1), N(e₂)=e₁ | Semisimple 10/9; raw invariants 1/9 | Admissible graded trace | No change |
| 8.3/8.4 normalization | GL₂, q=9, d=1; μ=0 | τ=−1/3, κ^ss=1/3, φ=1; Bernstein image 1/3, q^(1/2)z image 1; at μ=0 all equal 1_(P_r) | Matches AGLR (8.6), PZ (9.9), Theorem 9.16 | No change |

Degenerate cases: the trivial group and μ=0 give Spd O_E, Spec O_E and the unit idempotent throughout; rank 0 in §4.9 is excluded by the nonzero-H hypothesis; p=2 enters only where stated (Dᴴ Cartan, nonstandard SU₃, ramified unitary PEL); the zero ring is not a DVR base; q≥2 protects every denominator. Context: every polynomial-range theorem (§§1.3–3.3, 8.1 monodromy) carries its tame or prime-to-p hypothesis in the sentence; the all-prime theorems (§§3.6, 7.5–7.6, 8.3–8.4) carry none and are the source of R01's demand.

### Pinned declarations opened

Pins: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 (content/lake-manifest.json), equal to those cited at README lines 39 and 43.

| Declaration | File:line at the pin | What it supplies |
| --- | --- | --- |
| `Submodule.span` | Mathlib/LinearAlgebra/Span/Defs.lean:46 | sInf of containing submodules; no geometric content |
| `Algebra.trace` | Mathlib/RingTheory/Trace/Defs.lean:70 | Linear trace of multiplication; total |
| `Module.Grassmannian` | Mathlib/RingTheory/Grassmannian.lean:66–70 | Submodule with finite projective quotient and `rankAtStalk_eq` at every prime; quotient-rank convention; not a represented scheme |
| `traceForm_nondegenerate` | Mathlib/RingTheory/Trace/Basic.lean:501 | Needs `FiniteDimensional` and `Algebra.IsSeparable` |
| `AlgebraicGeometry.Scheme` | Mathlib/AlgebraicGeometry/Scheme.lean:40 | Locally ringed space, locally affine |
| `AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono` | Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:392 | Closed immersion ⇔ proper and mono |
| `TauCeti.AlgebraicGeometry.ZariskiTangentSpace` | TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65 | Residue-field dual of the cotangent space; no regularity |
| `Derivation.adjointWeightSpace` | TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean:100 | Weight submodule for a diagonalizable-group homomorphism |

Object greps at the pins for “affine Grassmannian”, “Schubert”, “parahoric”, “kimberlite”, “nearby cycle”, “Wakimoto”, “Frobenius split”: no hits except an unrelated quadratic-field Frobenius file. No declaration of this roadmap's objects exists at the pins; Suggested.lean declares no names, so no name collision is possible.

### Cross-roadmap citations resolved

| Supplier (where read) | Resolved |
| --- | --- |
| GeometricSatakeAndFusion (#1235, 0652974) | Targets “Generic Schubert bounds” (line 344), “Equal-characteristic Schubert models and coefficient comparison” (785), “Integral parahoric ind-properness” (843), “Bounded admissible affine flag loci” (947), “Relative-position flag correspondences” (971); GS2 and GS4 layers exist. No unibranch or Schubert-normality statement (R01). |
| ReductiveGroupsPartII (#785, 1383569) | RG2.0a.1–2, RG2.1.2–5, RG2.2.2–4, RG2.3.3–5 (RG2.3.5 “Tame realization …” at line 4708), RG2.3.7, RG2.4.1–3, RG2.5 all present. |
| RootSystemsPartII (packages/RootSystemsPartII/design/README.md) | RS2.4 (line 410), “Existential dominant orbit-sum step” (472), “Coroot step with central directions retained” (501), “Independent continuation briefs” MB.1–MB.3 (590–600). |
| DiamondsAndVStacksPartII (packages/DiamondsAndVStacksPartII/design/README.md) | D10.8, 10.9, 10.12–10.15; D11.5, 11.11–11.14, 11.16–11.20. D11.20 requires algebraically closed residue field (line 1790), as §7.6 provides; D11.14's closed-specialization hypothesis (line 1651) is met by perfectly finite-type reductions. |
| SchemeAndStackFoundations (main) | §§0.8, 0.17–0.21, 0.26, 0.28, 0.30, 1.1, 4.6–4.14 present. |
| ModularCurves (main) | §0G (line 427) constructs the relative Grassmannian of locally free quotients with charts, gluing and universal quotient. |
| LefschetzPencilsAndVanishingCycles (#873, 8f3e9b1) | §1.10 (line 1396) lists `VanishingCycles.semisimpleTrace`, `_refinement`, `_additive` as its targets; LPV.0, LPV.1, §§6.1–6.2 exist. |
| SmoothRepresentationsOfLocalGroups (#785) | SR.1 (974), SR.3.2 (2604), SR.4.1 (3084). |
| ClassicalAdicEtaleCohomology (#875, dfcb6b7) | §4.5a “Comparison with nearby cycles of the adic generic fibre” (line 2150–2152). |
| EtaleDualityAndPerverseSheaves (#1040, 34e0692) | §§2.1–2.3, 2.6–2.10 present. |
| PELModuli (#966, e6a4fe8) | Layer M0 (line 420). |

The resolver's five leads (RS2.4, D10.8, three semisimpleTrace names) all resolve as above. Ownership against the board index: the design READMEs of PELModuliPartII, ShimuraVarietiesPartII, SchemeAndStackFoundationsPartII, VectorBundlesAndIsocrystalsPartII, CrystallineCohomologyPartII, EndoscopicTransferAndUnitaryTraceComparisonPartII and CompletedCohomologyAndLocalGlobalCompatibilityPartII were read at their listed heads (under packages/<Name>/design/README.md). ShimuraVarietiesPartII consumes this roadmap (gap:local-models, gap:same-field-schubert-curves); PELModuliPartII consumes unitary local models and asks ReductiveGroupsPartII for smoothness of polarized unitary multichain stabilizers (its line 130), a different object from the EL/PEL chain torsor equivalence of §6.2 here. No second owner of any object of this roadmap was found. Open roadmap pull requests were searched by object through the roadmap service (polynomial local models, chain incidence, tubular neighbourhoods, test function conjecture, Wakimoto, Drinfeld local model, formal-curve span): no construction of these objects elsewhere; EndoscopicTransferAndUnitaryTraceComparison's “Kottwitz conjecture” hit is the obstruction conjecture, unrelated.

### Declared gaps and dependency order

plan.json `gaps` and the README's “What X must provide (gap:…)” contracts agree on all 41 slugs, suppliers and needs sentences (compared mechanically); every slug is used by a Needs line; none has supplier `none`. The new gap:algebraic-compatible-schubert-splitting is precise and minimal (SchubertGeometry S5 on main covers finite flag varieties only; GS0 states no affine splitting). R01 asks for one more.

    depcheck: 56 roadmaps, 644 edges, 0 problem(s)

No UPWARD, CYCLE or moved line; the merge order was not edited.

### Shape, headlines and Lean

README shape: title, Summary, Scope and ownership, Conventions, Exact supplier contracts per supplier, How to read the build, Layers 0–8 each ending with Examples and Dependencies, Downstream consumers, Worked examples, References. Style greps: no LaTeX delimiters, no process words, pull-request numbers or paths (the only “PR” is the source id), no `lemma`, `set_option`, `#eval`; every definition section has an API list and at least three Checks (mechanical count; the one flagged section, §5.5, is a theorem whose prose contains “defines”).

Headlines: the module docstring names each headline family of Layers 1–8 and the carrier each lacks. No headline is statable at the pins with only simple definitions: no affine Grassmannian, Schubert scheme, parahoric model, kimberlite or nearby-cycle carrier exists there (greps above), and `Module.Grassmannian` is a module-valued functor, not a represented scheme. The §2.8 trace-form statement is statable but is a supporting lemma, not a headline. Zero declarations, so no padding, no sorry'd data, no lost binders; the `#check` audit has no names to check.

Elaboration: `lake env lean` on the absolute path of packages/GeometricSatakeAndFusionPartII/Suggested.lean from the content checkout: exit 0, no output, no warnings (10 s). It imports `Mathlib` only; no TauCeti module build was needed.

## Not verifiable

- AGLR Proposition 3.7 (unibranch components of the canonical deperfection, cited by GL line 281) could not be located in the AGLR extraction by text search (“3.7”, “branch” return nothing in that region of the v2 extraction); R01 is therefore witnessed with HLR Theorem 1.1 and GL's own lines, which suffice.
- The published Annals text of KZ was not collated; all KZ locators refer to the manifest's author version l-indep_v2.
- The board packages ArithmeticLocallySymmetricSpacesPartII, HigherHidaAndColemanTheory, LawrenceVenkateshMethod, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PadicLocalLanglandsForGL2QpPartII and VStackSheavesAndLisseCategoriesPartII were not read this round; their subjects (locally symmetric spaces, Hida theory, Lawrence–Venkatesh, modularity lifting, p-adic Langlands for GL₂, lisse categories) do not touch local models, and the previous round found no overlap in the ones it could read. Ownership against them is not certified.

## Source issues

- none (the fourteen errata recorded by the round-3 review were re-encountered at the same lines and stand; no new source mistake was found).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e609a139d64dbc1e08c4bfd1fc7ee60481faf04d", "job": "REV-PKG-GeometricSatakeAndFusionPartII~4", "model": "fable", "worker": "chris-i"} -->
