# Review of RationalAnalyticPrismatization (pull request #2456 at 4670ade)

**Verdict:** needs changes

## R01 (P2) — 10.3 and 10.6 rely on BG^cont → GSpec(ℚ_p) being 0-proper, which no target states

**Location** `TauCetiRoadmap/RationalAnalyticPrismatization/README.md:1696` (10.3 route): "G^la/G^cont → GSpec(ℚ_p) is 0-proper since G^la is affinoid and BG^cont is proper (10.2)". Also line 1764 (10.6 route) and line 1671 (10.2: "so BΠ^cont is D-proper over GSpec(ℚ_p)").

**Claim** Both routes need BG^cont → GSpec(ℚ_p) to be 0-proper. 10.2 states only D-properness, which does not give 0-properness. It also assumes finite p-cohomological dimension, which a compact G with p-torsion does not have.

**Witness** ALRS Lemma 5.2.2(3) (ALRS line 4868) concludes only "proper". Its proof gets 0-properness only for the fibre Π^cont (ALRS line 4899), yet ALRS lines 5150 and 5824 use "0-proper". G = ℤ/p × ℤ_p has cd_p = ∞.

**Repair** In 10.2, after "so BΠ^cont is D-proper over GSpec(ℚ_p)", insert: "; moreover f is 0-proper, its base change along itself being the affinoid Π^cont (0.4, locality on the target), and BΠ^cont → GSpec(ℚ_p) is 0-proper, 0-properness being checkable along the D-proper, 0-proper !-cover f of the source (2.2)". Add the same sentence to the third API bullet of 10.2.

In the 10.3 route, replace "and BG^cont is proper (10.2)" with "and BG_0^cont is 0-proper (10.2), after reducing to an open uniform G_0 ⊆ G by base change along BG_0^la → BG^la, whose fibre G/G_0 is finite".

In the 10.6 route, replace "for BG^cont as in the proof of ALRS Proposition 5.3.2, ALRS line 5822" with "for BG^cont by 10.2 after the same reduction".

## R02 (P3) — The description says nothing outside main and the merge order is a prerequisite; MotivesAndAlgebraicCyclesPartII is

**Location** Pull request description: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim** MotivesAndAlgebraicCyclesPartII is a supplier: it has a contract at README:97–99 and appears in the *Needs:* lines of 1.4, 1.8, 2.4, 2.8 and 4.7. It is not on main, has no pull request and is missing from the merge-order block, so this pull request cannot merge before it.

**Witness** `roadmaps resolve` on README:9 reports "no roadmap MotivesAndAlgebraicCyclesPartII on main or in an open pull request". It exists only as a board package, whose last review is `needs_changes` with 9 blocking findings.

**Repair** Replace the sentence with: "Roadmaps on main are cited by name. One supplier, MotivesAndAlgebraicCyclesPartII (Layer 0: the Banach arc-site, Marc(A), strictly totally disconnected Banach rings, quasi-pro-étale maps), is neither on main nor in a pull request yet; this pull request merges after it. Every other supplier is on main or in the merge order below."

## R03 (P3) — The description's Lean and build sentences describe declarations the file does not have

**Location** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti"; "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim** `Suggested.lean` declares nothing, so it has no definition, no theorem and no `sorry` warning. The text never tells the reader that no headline theorem is stated.

**Witness** `TauCetiRoadmap/RationalAnalyticPrismatization/Suggested.lean:12`: "None of the headline theorems is statable at the pins, so this file states nothing". Lines 73–75 are an empty namespace, and `lake env lean` on the file exits 0 with no message.

**Repair** Replace the first sentence with: "`Suggested.lean` declares nothing: none of the seven headline theorems is statable at the pins, and its module docstring names, for each one, the missing carriers (Gelfand stacks, six-functor formalisms and Gestalten, analytic stacks)". Replace the second with: "the targeted Lake build succeeds with no warnings".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, radius κ_ϖ | untilt C of C♭, ϖ = p♭; Frobenius | \|[p♭]\| = \|p\| gives κ = 1; φ^*[ϖ] = [ϖ^p] gives κ∘φ = p·κ, matching Tau Ceti `isRadiusLowerBound_comap_frobenius_iff` (Window.lean:149) | holds |
| Conventions, Breuil–Kisin twist | cyclotomic prism | φ(log q/(q−1)) = p[p]_q⁻¹·log q/(q−1) and φ(e⟨1⟩) = p⁻¹e⟨1⟩, so φ(e) = [p]_q⁻¹e; PrismaticCohomologyPartII §3.11 gives e_A = p·e | holds |
| 0.5 transmutation (sample) | finite sets with D = Fun(−, D(Λ)); AnSpec(0); AnSpec(ℚ_p) | fold map: f_! = f_* = ⊕, algebra Λ × Λ; empty family covers iff D(X) = 0; Gest Prop 9.3 is an iff | holds; Gest pp. 79–83 match |
| 2.4 nilperfectoid basis (sample) | A = ℚ_p; A = 0; strictness | ℚ_p → ℚ_p^cyc has a trace retraction, so it is descendable; κ(x) = ℚ_p is not algebraically closed, so ℚ_p is not strictly totally disconnected | holds; ABLB 4.6.4, 4.4.3 and ALRS 2.1.7 match |
| 2.5 Betti realization (sample) | S = ∅, two points, ℕ ∪ {∞} | GSpec(0); GSpec(ℚ_p × ℚ_p); C^lc gives eventually constant sequences, while C(S, ℚ_p) gives convergent ones | holds; ABLB 4.2.9 |
| 2.6 Berkovich and †-rigid spaces (sample) | r = 0; closed disc versus its canonical compactification | K⟨T⟩_≤0 is a one-point thickening and misses 1/(1 − T/c); both compactifications give GSpec(ℚ_p⟨T⟩); ℤ_p + pℤ_p⟨T⟩ is integrally closed | holds |
| 3.2 de Rham exactness (sample) | BG, G locally profinite; disjoint unions | (BG)^dR = BG^sm (ABLB line 377); ABLB Prop 4.5.7 is stated for (−)^DR, and its proof applies verbatim in the qfd case | holds |
| 4.7 †-quasi-pro-étale topology (sample) | †-rational localization; C(S, C_p) → C(S₁, C_p) | the first is †-formally étale but not finite étale; the second is a filtered colimit of finite étale maps, hence flat (A.2.20) | holds; A.2.17–A.2.20 match |
| 4.8 tangent complexes (sample) | BG_m; trivial group; A¹ at A = C_p[ε]/ε² | L = O[−1]; L = 0; T[1] = BA, its dR part BC_p, its † part B(C_p·ε) | holds (source misprint, see Source issues) |
| 7.5 Perf on thickened curves (sample) | A = C_p[ε]/ε²; A perfectoid | Γ(FF_A, O) = ℚ_p ×_{C_p} A = ℚ_p ⊕ C_p·ε = ℚ_p^la(A) (3.4); for perfectoid A the square is trivial | holds; Prop 3.6.3, Cor 3.6.5 |
| 8.4 Breuil–Kisin divisor (sample) | cyclotomic prism; translates | ⊗_{n≥0}([p]_{q^{p^n}}) = (log q/(q−1)); φ^*I_BK = [p]_q⁻¹I_BK; the copies at radii p^n are disjoint | holds; Lemma 4.2.10 |
| 8.7 descent along †-smooth maps (sample) | identity; non-surjective open immersion | identity gives isomorphisms; the open immersion is †-étale but not an arc-cover, so f^Δ is not an epimorphism | holds; Thm 4.7.1 |
| 9.4 formal and overconvergent HT stacks (sample) | GSpec(ℚ_p); X = D; X = D × BG_m | Spf(K_∞[[t]])/ℤ_p^{×,la}; D^∧; cone_s = X × B²G_a{1}, a trivial torsor; the non-Berkovich case is allowed by the source ("X → D a Gelfand stack") | holds |
| 10.2 classifying stacks BΠ^cont (sample, R01) | Π trivial; ℤ_p with (1+p)^a; ∏ℤ_p | Φ = id; a one-dimensional comodule; Φ not fully faithful (Rem 5.2.4(2)); the source says "proper" only | statement holds; 0-properness missing (R01) |
| 10.3 / 10.6 routes (R01) | compact G with p-torsion | cd_p(ℤ/p × ℤ_p) = ∞, so 10.2 does not apply; "D-proper ⇒ 0-proper" is not a law of 2.2 | gap (R01) |
| 10.7 classical decompletion (sample) | ℚ_p^cyc with Γ; trivial G; C(G, ℚ_p) | K^la = ℚ_p(μ_{p^∞}) (BC16 Th. 3.2, proof); R^la = R; C^la_G is dense in C(G) | holds |
| 10.8 ϵ-TORS criterion (sample) | Λ° with trivial action; G = ℤ_p; d = 0 | π₋₁ = coker(γ−1), killed by ϖ^ϵ iff 2^{−ϵ}r^{w(γ)} ≤ 1; for d = 0, R₀ = A_{ϖ^ϵ} and δ = 0 | holds; Ex 5.5.9, footnote 43 |
| 10.12 decompletion theorem (sample, headline) | trivial G on the closed disc | End(1) on the connected \|X\|^Betti is ℚ_p, End(O_X) is ℚ_p⟨T⟩; full faithfulness holds only on O^la-modules | holds as stated; Thm 5.1.1 |
| 11.1 arithmetic comparison, twisted form | K = ℚ_{p²} | untwisted: H⁰ ⊇ K, H¹ of dim 4; required: H⁰ = ℚ_p, H¹ of dim 3; twisted: (K ⊗ ℚ_p)^{σ⊗1} = ℚ_p | twisted form right; ALRS Rem 6.1.5 wrong |
| 11.2 arithmetic Sen operator (headline) | C_p(n) | n ≠ 0: θ = n invertible, H* = 0; n = 0: H⁰ = H¹ = K, H² = 0 (PadicPeriodRings §1.4) | holds |
| 11.5 geometric HT stack (headline) | dim X = 1; X = D | L = (T{1})^∨[−1] = Ω¹{−1}[−1]; X^HT = D with θ = 0; the k-th Higgs term is Ω^k{−k} | holds |
| 11.6 comparison (headline) | X = GSpec(K); X = ∅ | reduces to 11.1; both sides empty; hypotheses agree with ALRS Thm 6.3.1 (smooth partially proper over a finite K) | holds |
| 11.7 pro-étale cohomology (headline) | GSpec(ℚ_p); [K:ℚ_p] = n | dims 1, 2, 0 and χ = −1; dim H¹ = n + 1; the last isomorphism is gap:proetale-v-comparison | holds |
| 11.9 locally analytic torsors (headline) | GSpec(ℚ_p), G = ℤ_p; trivial G | Hom(G_{ℚ_p}^ab, ℤ_p) = ℤ_p² (from ℤ_p^× and Ẑ); for trivial G all mapping anima are points | holds |
| 12.2 local Tate duality (headline) | Div¹ → GSpec(ℚ_p) | RΓ(O): 1, 2, 0; RΓ(O{1}): 0, 2, 1; ω_{A¹/G_m} = I[1] ⊗ O[−1] = I; δ(p) = [pℤ_p : ℤ_p] = p⁻¹ (HM line 4927) | holds |
| 12.3 Poincaré duality (headline) | d = 0; Y = G_m | étale: O; G_m: O{1}[2], and composed with Div¹: O{2}[4] | holds |
| 12.4 smooth proper maps (headline) | P¹_X → X | f_*O = O ⊕ O{−1}[−2]; f_*O{1}[2] = O{1}[2] ⊕ O, the dual of f_*O | holds |
| 12.5 projective bundle formula (headline) | d = 1 | ⊕_{k=0}^{1} O{1−k}[2−2k] = O{1}[2] ⊕ O = f^Δ_*O{1}[2] | holds |
| 12.6 Riemann–Hilbert (headline) | X = GSpec(ℚ_p) | weight-0 part of h_*1 is RΓ(Q_p^HT, O) = ℚ_p ⊕ ℚ_p[−1]; the source writes ℚ_p[1] | holds with [−1] |
| 12.1 locally †-f.p. maps, cusp Check | R = ℚ_p⟨x,y⟩/(y²−x³) → k | the map k[1] → k²[1] is zero, so L_{k/R} = k²[1] ⊕ k[2], perfect; R → k is a finite cell attachment (Tate resolution) | holds |

- Source locators checked against the cached texts: about 120 (ALRS, ABLB, Gest, HM, ALBM, RJRC22, BC16): theorem number, printed page and line. All 15 seeded targets match.
- Library declarations opened at the pins: 11 in Mathlib (1b1ccf4) and 14 in Tau Ceti (2fd255d), each at the cited file and line, with the stated hypotheses (`BDeRhamPlus` is zero when p = 0; `spectralNorm` is defined via minpoly).
- Cross-roadmap citations resolved: all 36 consumed AnalyticStacks sections at the #1687 head (dd5bc83), with the stated content and matching conventions (weight of t, modulus δ, the §7.3 Check). Also resolved: 16 further suppliers or comparison partners at main or open heads (VectorBundlesAndIsocrystals, 7 quoted headings). AdicSpacesPartIII `Huber.GelfandSpectrum` is in its `Suggested.lean`, so the resolve lead is a false positive.
- Gate: the worker's gate passed with every check at 0. Dependency check output: `depcheck: 259 roadmaps, 2488 edges, 0 problem(s)`. `lake env lean` on `Suggested.lean` exits 0 with no messages. There are no declarations, so the `#check @name` comparison and the one-tactic probe have nothing to test, and there is no padding.
- Gaps: the 18 AnalyticStacks gaps are supplied at #1687 (the cited sections exist and say what is consumed). gap:proetale-v-comparison is stated in the README and in plan.json. gap:gestalten-affine-proper and gap:gestalten-transmutation (supplier `none` in plan.json) are owned by Layer 0 (0.2–0.5), and AnalyticStacks' Scope leaves Gestalten out.
- Shape: 93 numbered subsections, each with at least three Checks and a *Needs:* line; all 13 layers end with Examples and Dependencies; no LaTeX and no process words.
- Ownership: Gelfand rings and stacks, Gestalten, derived Berkovich spaces, nilperfectoid rings and twistor or Hyodo–Kato stacks occur only here and in AnalyticStacks, whose "Left to other roadmaps" hands them to this roadmap.

Overlap check: read AnalyticStacks, PrismaticCohomologyPartIII, AInfCohomology, PrismaticCohomologyPartIV, CohomologyComparisons, CrystallineCohomology, EnhancedDerivedSheaves and PerfectoidSpaces. Shared objects and their owners:
- Gestalten and Gelfand stacks: this roadmap, by AnalyticStacks' Scope.
- Nuclear objects: RefinedTraceMethods §4.3 and AnalyticStacks §4.3, both cited.
- Integral Breuil–Kisin twist, prismatic logarithm and Hodge–Tate stack: PrismaticCohomologyPartII and PartIII, used here only in Checks.
- The d-variable Amice criterion over K: LocallyAnalyticDistributionsPartII §1.5. 10.4 keeps the Banach-valued generalization and says how it differs.

Source independence: 20 passages compared with 7 sources. No wording is shared beyond mathematics-forced definitions; the longest run is about 10 words, in the definition of locally †-finitely presented maps (ALRS line 8646). Largest share: ALRS, 864 of 1354 locators. Contents compared with ALRS: Layers 7–12 follow ALRS §§3.3–6.7 in the order the *Needs:* lines force (8.1 on 7.1–7.3, Layer 9 on Layer 8, 11.1 on 10.12, 12.2 on 11.1), and Layers 0–6 regroup Gest, ABLB and ALRS §§2, 3.1–3.2 and Appendix A. Result: independent.

## Not verifiable

- MotivesAndAlgebraicCyclesPartII Layer 0: it has no pull-request head, so its §§0.4 and 0.6 and Marc(A) were read in the board package only (see R02).

## Source issues

- **Error** in ALRS at Remark 6.1.5, p. 145: the source says X^{Div¹} ≅ GSpec(K) × Div¹ for unramified K/ℚ_p; it should be (GSpec(K) × Div¹~)/(GSpec(σ) × φ)^ℤ, since the untwisted form puts K inside H⁰ = ℚ_p; affects a stated result.
- **Gap** in ALRS at Lemma 5.2.10(1), proof, p. 98, and Proposition 5.3.2, proof, p. 109: the source takes 0-properness of BG^cont from Lemma 5.2.2(3), which proves only cohomological properness; it should check 0-properness along the proper, 0-proper !-cover GSpec(ℚ_p) → BG^cont (footnote 58) after shrinking G; affects the proof.
- **Misprint** in ALRS at Example A.2.12, p. 181: the source cites Example A.2.12 itself for the reduction to affinoid X; it should be Lemma A.2.11; affects nothing.
- **Misprint** in ALRS at Construction A.3.1, p. 187: the source writes T_f[i](η) as τ_{≥−i}Hom_R(η^*L_f, R), whose underlying anima is the value at i = 0; it should be τ_{≥0}Hom_R(η^*L_f, R[i]); affects nothing.
- **Misprint** in ALRS at Definition 4.5.1(2), p. 69: the source names the relative formal Hodge–Tate stack with D† although it is the pullback to D^∧; it should be indexed by D^∧; affects nothing.
- **Misprint** in ALRS at Proposition 3.7.4(2), p. 56: the source puts B(G_a^dR ⊗ D_{−λ}) in the lower-left corner; it should be B(G_a^an ⊗ D_{−λ}), as its proof (ALRS line 2931) says; affects nothing.
- **Misprint** in ALRS at Construction 6.7.5, p. 171: the source gives h_*1 = ℚ_p ⊕ ℚ_p[1]; it should be ℚ_p ⊕ ℚ_p[−1], the summand being the H¹ class of Example 6.1.7(3); affects nothing.
- **Misprint** in ALRS at Theorem 6.5.8(3), p. 164: the source applies f^{Div¹,!} to the structure sheaf of Y^{Div¹}; it should be that of X^{Div¹}; affects nothing.
- **Misprint** in ALRS at Theorem 6.2.2(4), p. 147: the source gives the last Higgs-complex term as M ⊗ Ω^{dim X}{−1}; it should be Ω^{dim X}{−dim X}; affects nothing.
- **Misprint** in ALRS at Proposition 5.5.6, p. 113: the source writes A^{Bin_{r₀,ω}}, using the constant ω for ϖ; it should be A^{Bin_{r₀,ϖ}}; affects nothing.
- **Misprint** in ALRS at Proposition A.2.15(1), p. 182: the source writes f ∘ g for the composite of f: Z → Y and g: Y → X; it should be g ∘ f; affects nothing.

## For the human reviewers

- Scope: the main sources are unrefereed. ALRS (864 of 1354 locators) is a 2026 preprint on an author page, and Gest is 2026 lecture notes on an author page; ABLB, RCSolid and Hauck are arXiv preprints. sources.toml records no published versions.
