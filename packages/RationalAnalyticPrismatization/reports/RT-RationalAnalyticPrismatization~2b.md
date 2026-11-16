<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18047#issuecomment-6912989776 -->
Red team round 2 pass b (claude) of 05a6825

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 6.1 declares the unpunctured Fargues–Fontaine disc, with its locus p = 0, a Berkovich space over ℚ_p

   **Location.** `packages/RationalAnalyticPrismatization/README.md:1094`: "define the relative Fargues–Fontaine disc `D_{FF,S}` = Spa(A_inf(A)) ∖ V([ϖ]) as the Berkovich space ⋃_s `GSpec(B^†_{[0,s]}(S))`"; same line: "`κ_ϖ^{-1}(0)` is the overconvergent neighbourhood of {p = 0}" and "Prove `D^⋄_{FF,S}` = S × Marc(ℤ_p)". Also `README.md:25` ("`κ^{-1}(0)` = {|p| = 0}"), `README.md:1110` and `README.md:1262` ("the unpunctured product `D_{FF,K}` `×_{GSpec(ℚ_p)}` `D_{FF,K}` is strictly larger, containing the points of radius (0, r) and (r, 0)").

   **Claim.** `B^†_{[0,s]}(S)` is a Gelfand ring, `D_{FF,S}` a derived Berkovich space of 2.6 with a nonempty locus κ = 0, and a fibre product over GSpec(ℚ_p) has points with p = 0.

   **Witness.** Gelfand rings are ℚ_p-algebras (1.1, 1.4) and every point of M(A) has |p| = `p^{-1}` (1.5, fourth Check); p is not a unit of `B_{[0,s]}(S)`. ALRS uses only the punctured disc after ALRS line 2299 (ALRS line 2355).

   **Repair.**

   - `README.md:1094`, first sentence, replace by: "For an affinoid perfectoid space S = Spa(A) of characteristic p, qfd and separable, with pseudo-uniformizer ϖ, define the relative punctured Fargues–Fontaine disc `D^×_{FF,S}` = Spa(A_inf(A)) ∖ V(p[ϖ]) as the Berkovich space `⋃_{[r,s]}` `GSpec(B^†_{[r,s]}(S))`, the union over the intervals [r, s] ⊂ (0, ∞) with rational ends, where A_inf(A) = W(A°), `B_{[r,s]}(S)` is the ring of the rational subset {|p|^s ≤ |[ϖ]| ≤ |p|^r} of Spa(A_inf(A)), a Banach ℚ_p-algebra because [ϖ] is a unit there and p divides a power of it, and `B^†_{[r,s]}(S)` is the colimit of the `B_{[r′,s′]}(S)` over r′ < r, s′ > s (ALRS §3.2, p. 44, ALRS line 2295; ABLB line 2607–2610). The unpunctured disc Spa(A_inf(A)) ∖ V([ϖ]) of ALRS line 2299 contains the locus p = 0, where no ring of functions is a ℚ_p-algebra; it is not a Gelfand stack and is not used."
   - Same line, second sentence: "Construct its Frobenius φ_S and the radius map κ_ϖ: `D^×_{FF,S}` → (0, ∞)^Betti with κ_ϖ(x) = log|[ϖ]|_x / log|p|_x, so that κ_ϖ ∘ φ = p·κ_ϖ, with κ_ϖ → 0 towards V(p) and κ_ϖ → ∞ towards V([ϖ])"; third sentence: "Prove `D^{×,⋄}_{FF,S}` = S `×_{Marc(𝔽_p)}` Marc(ℚ_p), …" (delete the formula with Marc(ℤ_p)).
   - `README.md:25`: "Frobenius multiplies κ by p, and κ tends to 0 towards the locus p = 0, which lies outside `D^×_{FF,S}`."
   - `README.md:1110`: "The reciprocal convention log|p|/log|[ϖ]| would send Frobenius to multiplication by `p^{-1}` and would tend to 0 towards [ϖ] = 0, contradicting κ ∘ φ = p·κ."
   - `README.md:1262`, replace the clause after the semicolon by: "the two radius maps κ of the factors are independent on the product, taking every value in (0, ∞)², so the product is not `D^×_{FF,K}`: the diagonal Marc(K) → Marc(K) × Marc(K) is not an isomorphism."
   - `README.md:1112` (fourth Check of 6.1): "For S = ∅ the disc is empty."

   Tested on the witness: on `B_{[r,s]}(S)` with r > 0, |[ϖ]| ≤ |p|^r and [ϖ] invertible make p invertible, every point has |p| = `p^{-1}` after normalization and κ ∈ [r, s] ⊂ (0, ∞); at the untilt C with ϖ = p♭, κ = 1, as the first Check of 6.1 says.

2. **F02** (P3) arc-stacks over 𝔽_p and over ℤ_p are used and never defined

   **Location.** `README.md:664` defines only "`ArcStk_{ℚ_p}` of light arc-stacks over Marc(ℚ_p)"; `README.md:1116`: "`D^×_{FF,−}`: ArcStk → GelfStk … For an arc-stack X over 𝔽_p"; `README.md:1134`: "for a map f: Y → X of qfd arc-stacks over ℤ_p"; the same at `README.md:1143`, and "ArcStk" in 7.4.

   **Witness.** The categories `ArcStk_{𝔽_p}`, `ArcStk^qfd_{ℤ_p}` and the objects Marc(𝔽_p) (16 uses) and Marc(ℤ_p^cyc) have no definition in the README; the source defines them at ABLB line 2020, ABLB line 2062–2069 and uses them at ABLB line 4981–4994, ABLB line 5415.

   **Repair.** Append to the first sentence of 2.8: "Define likewise `ArcStk_{𝔽_p}`, written ArcStk from Layer 6 on, as hypersheaves of anima on the arc-site of separable perfectoid spaces of characteristic p, with final object Marc(𝔽_p), and `ArcStk_{ℤ_p}` on separable perfectoid spaces over ℤ_p (untilts of characteristic 0 or p), with final object Marc(ℤ_p) and Marc(B) for a separable perfectoid ℤ_p-algebra B, each with its qfd variant (ABLB line 2020; ABLB Definition 4.1.11, p. 39, ABLB line 2062–2069); `ArcStk_{ℚ_p}` is the slice of `ArcStk_{ℤ_p}` over Marc(ℚ_p), and the de Rham stack of 3.1 is defined on it only." In 6.3 write "qfd arc-stacks over ℤ_p (2.8)". After S01 the README uses Marc(ℤ_p) only through this sentence and Marc(ℤ_p^cyc) in the route of 6.3.

3. **F03** (P3) eleven supplier sections named in *Needs:* lines are missing from their layer's Dependencies

   **Location and witness.** A script comparison of the *Needs:* lines of each layer with its "### Dependencies" paragraph (`README.md:517`, `:689`, `:811`, `:994`, `:1086`, `:1174`, `:1314`, `:1641`; Layers 0, 8, 10, 11 and 12 have no miss):

   | Layer | Used in | Missing from Dependencies |
   |---|---|---|
   | 1 | 1.1 | SolidAnalyticRings §1.5 |
   | 2 | 2.1; 2.8 | EnhancedDerivedSheaves §E0.5; PerfectoidSpaces §P1.27 |
   | 3 | 3.6 | SchemeAndStackFoundations §1.15 ("§1.18–§1.22" does not contain it) |
   | 4 | 4.2; 4.5 | AdicSpacesPartII §R0.16; DerivedModuleAlgebra §0.4 |
   | 5 | 5.2 | DerivedModuleAlgebra §0.25 |
   | 6 | 6.4 | VectorBundlesAndIsocrystals Layer 6 |
   | 7 | 7.2; 7.3 | PerfectoidSpaces §P1.27; EnhancedDerivedSheaves §E2.7 |
   | 9 | 9.8 | VectorBundlesAndIsocrystals Layer 6 |

   **Repair.** Add each entry of the third column to the Dependencies paragraph of its layer, in the form already used there (for Layer 1: "…; SolidAnalyticRings §1.5."; for Layer 3: "SchemeAndStackFoundations §1.15, §1.18–§1.22"; for Layer 6: "VectorBundlesAndIsocrystals Layer 0, Layer 1, Layer 6"; for Layer 9: "…; VectorBundlesAndIsocrystals Layer 6; …"). All edges point to main or down the merge order, so the dependency check is unchanged.

4. **F04** (P3) 0.1 describes 1Pr in two ways

   **Location.** `README.md:213`: "Let Pr^L_κ be the ∞-category of κ-presentable ∞-categories and colimit-preserving functors that preserve κ-compact objects … Define 1Pr = Pr^L_κ"; later in the same paragraph: "formed in 1Pr, that is, in κ-presentable ∞-categories and colimit-preserving functors".

   **Witness.** The gloss drops the condition on κ-compact objects that the definition (Gest Definition 2.7, Gest line 563–565) imposes; Gest line 1713 forms the colimit in 1Pr. The sentence was added by the last repair.

   **Repair.** "…, formed in 1Pr = Pr^L_κ (its morphisms preserve colimits and κ-compact objects; the functors C ↦ Mod_C(nPr) are such morphisms), equivalently the limit of ∞-categories along the right adjoints D ↦ End_D(1)." Tested on the third Check of 0.2: ⋃_n A^n still lies in the limit and in no CAlg(A_{n+1}).

Round 2. `packages/RationalAnalyticPrismatization/README.md` (2236 lines) and `packages/RationalAnalyticPrismatization/Suggested.lean` (75 lines) were read in full. One P2 finding and three P3 findings, all new; no P1. Every round-1 finding is repaired or settled.

## Round-1 findings at this head

| Finding | Repaired passage (quoted) | Status |
|---|---|---|
| 1a/F01, 1b/F04 (docstring overclaims) | `Suggested.lean:44–47`: "0-proper with pullback fully faithful on modules over `O^la_X = h_* O`"; `:55–57`: "its base change to `FF_{X^⋄}` has dualizing complex `O{d}[2d]`, and `f^{Div¹,!} O ≅ O{d}[2d]` when `X` is a smooth partially proper rigid space over `ℚ_p`" | repaired; agrees with README 10.12(1), 12.3(2)–(3) and ALRS line 4743, ALRS line 8878–8882 |
| 1a/F02 (gap `nuclear-modules`) | `design/plan.json`, `nuclear-modules`: section "§4.3 (opening and (1))", needs "… characterized by the Hom criterion, and, for nuclear A, nuclearity tested on the underlying ℚ_p-module and on homotopy groups, with closure under countable limits." | repaired; AnalyticStacks §4.3 at its open head states the criterion in its opening and these facts in (1) |
| 1a/F03 (properness of Div¹) | README 12.2 route: "by the properness of Div¹ → ∗ (FS Proposition II.1.21, FS line 2133; VectorBundlesAndIsocrystals Layer 5, “Effective divisors and projective sections”, the case d = 1)" | repaired; that target at the open head says of `Div^d`, d ≥ 1, "It is proper over `∗`" |
| 1a/F04 (two supplier citations) | 11.2 Check: "the labelled Sen operator of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2, in which χ_p has weight +1"; Scope: "de Rham implies potentially semistable, NoncommutativeAndEquivariantIwasawa §F.6" | repaired; §F.6 stage 3 on main proves `deRham_iff_potentiallySemistable` |
| 1a/F05 (10.2 route) | "ℚ_p is a perfect `ℚ_{p,■}[Π_0]`-module, the hypothesis (… for Π_0 trivial, ℚ_p is perfect over ℚ_p although it has no finite free resolution over ℤ_p)" | repaired |
| 1a/F06 (Div¹~) | Conventions and 8.2: "Div¹~ = `GSpec(ℚ_p)^{Div¹~}` = lim_φ Q_p^Δ" | repaired (both occurrences) |
| 1a/F07, 1b/F05 (P¹ cover) | 4.7 Check: "glued from the overconvergent discs D = `GSpec(ℚ_p⟨pT⟩_{≤1})` = {|T| ≤ p} and D′ = {|1/T| ≤ p} along the overconvergent annulus" | repaired; recomputed: {|1/T| ≤ p} = {|1| ≤ |T/p|}, Gauss point has |T| = 1 ∈ (p⁻¹, p) |
| 1a/F08, 1b/F10 (plan `gaps`) | repair report: "not actionable in this package" | settled; the reason holds: the layers of `design/plan.json` still name `gap:gestalten-affine-proper` (3 times) and `gap:gestalten-transmutation` (once) as prerequisites. Not re-raised; see the human reviewers' section |
| 1b/F01 (StRing colimit) | 0.1: "the colimit … formed in 1Pr, … equivalently the limit of ∞-categories along the right adjoints D ↦ End_D(1). It is not the union of the CAlg(nPr)" | repaired; a residual wording slip is S04 |
| 1b/F02 (slice Künneth) | 0.5: "if moreover the restriction of D to the slice `C_{/X}` satisfies the Künneth formula, D(Y) `⊗_{D(X)}` D(Z) ≅ D(Y ×_X Z) … The slice condition is also necessary"; 2.2 route names AnalyticStacks §2.3(7) | repaired; Gest line 3028–3030 is an "if and only if" |
| 1b/F03 (direction of α) | 2.1 law: "has as inverse image the left exact colimit-preserving functor GelfStk^qfd → GelfStk sending GSpec(A) … to GSpec(A), and as direct image the restriction" | repaired; ALRS line 661–669 |
| 1b/F06 (sections consumed) | EnhancedDerivedSheaves contract lists §E0.8, §E5:presentability.1, §E5:presentability.2; AnalyticStacks list has §2.1 | repaired; a script comparison of all 93 *Needs:* lines with the "Sections consumed" lists finds no miss. The per-layer Dependencies lines are a different list: S03 |
| 1b/F07 (PrismaticCohomologyPartII) | 9.8: "§§3.8–3.9, built for transversal prisms … (§3.8) and extended to all prisms by base change (§3.9)"; Check: "φ(e_A) = `[p]_q^{-1}e_A` … §3.11" | repaired; headings 3.8, 3.9, 3.11 exist at the open head with that content |
| 1b/F08 (factor p) | 9.9 Check: "log_Δ(q^p) = p·log_Δ(q) = p(q − 1)e, so the two formulas agree exactly when the integral generator e_A corresponds to p·e" | repaired; recomputed |
| 1b/F09 (undefined terms) | 1.7: "a bounded solid ℚ_p-algebra (1.1)"; 4.8: "weakly representable in arc-diamonds if for some arc-cover …"; 9.5: "for a smoothoid X …, that is, an analytic adic space X with a smooth morphism X → D"; 12.1: "pro-Berkovich-étale maps are, that is, maps that are, locally on strict closed covers …" | repaired |

No repair introduced a false statement. The new citations (VectorBundlesAndIsocrystals Layer 5, NoncommutativeAndEquivariantIwasawa §F.6, EnhancedDerivedSheaves §E0.8 and §E5:presentability.1–2, AnalyticStacks §2.1, AdicEtaleGeometry §A2.4, PrismaticCohomologyPartII §§3.8, 3.11) resolve at main or at the open heads.

## Adversarial pass: record

`Suggested.lean` declares nothing (one module docstring, `module`, `import Mathlib`, an empty namespace), so the table of declarations is empty and the `#check @name` comparison has no input; no Lean was run. The rows below are the 93 README targets and the Conventions.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Docstring, seven headlines | G = 1, X closed disc; f rigid smooth over arbitrary X | End(1) = ℚ_p on \|X\|^Betti, ℚ_p⟨T⟩ on X: restricted to `O^la_X`-modules; (3) only for partially proper X | agrees with 10.12, 12.3 |
| Conventions, radius | untilt C, ϖ = p♭; locus p = 0 | κ = 1, translates p^n; \|p\| = 0 impossible on M(A) | S01 |
| Conventions, twists | cyclotomic e | φ(log q/(q−1)) = p[p]_q⁻¹·, φ(e⟨1⟩) = p⁻¹e⟨1⟩, φ(e) = [p]_q⁻¹e | ok |
| 0.1 | D(k); ⋃A^n over the unit | End of unit of Mod_{D(k)}(1Pr) = D(k), of 1Pr = Ani; D(k) is 1-affine over (∗, Ani, 1Pr, …), so by left cancellation ⋃A^n is n-affine over the unit for no n | ok; wording S04 |
| 0.2 | D(S) over D(R); ∅ over the unit | (B/A)_0 = S; 0-th terms ∗ = ∗, and Mod_M(Ani) ≠ ∗ for every monoid M | ok |
| 0.3 | k[x] over k; m ≥ n + 1 with n = 0 | forgetful functor D(k)-linear, colimit-preserving; condition starts at f^*_0: A_1 → B_1 (Gest line 1944–1951) | ok |
| 0.4 | k[x]; index of (B/A)^!_m | ⊗ k[x] does not commute with ∏; f_{m,♯} exists for m ≥ n since f_{m−1,♯} does for m ≥ n + 1 (Gest line 2115–2124) | ok |
| 0.5 | finite sets, fold map; P¹/k; X = AnSpec(0) | f_! = f_* = ⊕, f_*1 = Λ × Λ; slice Künneth holds, D(P¹) ≠ D(k), not 0-affine; D = 0 both sides | ok |
| 1.1 | ℚ_p; ℚ_p[T]; 0 | A° = ℤ_p; A^b = ℚ_p; bounded | ok |
| 1.2 | nilpotent x; ℚ_p⟦T⟧[1/T] | germs → ℚ_p[T]//T^k → A; T ∈ Nil†, 1 ∉ Nil† | ok |
| 1.3 | colim_{r>1} ℚ_p⟨T/r⟩; 0 | A_{≤1}/p^k = (ℤ/p^k)[T], so A^u = ℚ_p⟨T⟩; A^u = 0 ⇒ A = 0 | ok |
| 1.4 | Banach B; ℚ_p⟨T_n⟩ | Nil† = spectral radius 0; Hilbert cube in M | ok |
| 1.5 | C‖·‖-bounded seminorm | \|f\|^n ≤ C‖f‖^n ⇒ \|f\| ≤ ‖f‖; \|p\| = p⁻¹ forced | ok |
| 1.6 | {\|T\| ≤ 1} on ℚ_p⟨T⟩; f = 1, g = p | A ⊗_{ℚ_p[X]} ℚ_p⟨X⟩_{≤1} = A by idempotency; zero ring | ok |
| 1.7 | ℚ_p[ε]; items of AnalyticStacks §4.4 | ℚ_p not dualizable; (1) trace class, (3) connectivity, (5) surjection, (6) Huber pairs, as cited | ok |
| 1.8 | ℚ_p(μ_{p^∞}); ℚ_p | uniformly perfectoid only; neither | ok |
| 2.1 | ℤ_p((x))^∧[1/p] | residue field 𝔽_p((x)) uncountable, so no nonzero separable Banach algebra receives it | ok |
| 2.2 | open and closed disc | f_!O in degree 1, f_*O in degree 0; 0-affine | ok |
| 2.3 | ∏_ℕ ℤ_p[1/p]; ⊕ℚ_p[−n] | compact not dualizable; nuclear, not eventually connective | ok |
| 2.4 | ℚ_p → ℚ_p^cyc | split by the normalized trace | ok |
| 2.5 | ℕ ∪ {∞} | C^lc ≠ C | ok |
| 2.6 | compactification of the closed disc; r = 0 | ℤ_p + pℤ_p⟨T⟩ integrally closed (reduction mod p algebraic over 𝔽_p is constant); image misses 1/(1 − T/c) | ok |
| 2.7 | ℚ_p[u^{±1}], \|u\| = 2 | u⁻¹ ↦ π_{−2} = 0, so 1 ↦ 0 | ok |
| 2.8 | ℚ_p[ε]; categories used later | Marc(ℚ_p); only `ArcStk_{ℚ_p}` defined | S02 |
| 3.1 | A¹ at C_p[ε] | ε, 0 same image | ok |
| 3.2 | BG | BG^sm | ok |
| 3.3 | d = 0; perfectoid punctured disc | O; O[2] (ABLB line 3567, ABLB line 4860) | ok |
| 3.4 | C(ℤ_p, C_p); profinite S | C(ℤ_p, ℚ_p); maps C^lc(S) → A = continuous maps M(A) → S | ok |
| 3.5 | Spec R(*) | S | ok |
| 3.6 | s = 0, s ≠ 0 on a point | ℚ_p ⊕ ℚ_p[1]; ∅ | ok |
| 4.1 | 0 → A¹ | fibre C_pε against a point | ok |
| 4.2 | three discs | rigid smooth; Berkovich-smooth; neither | ok |
| 4.3 | two discs at 0 | ℚ_p⟨S⟩ ×_{ℚ_p} ℚ_p⟨T⟩ = ℚ_p⟨S,T⟩/(ST) | ok |
| 4.4 | ℚ_p⟨T⟩ → ℚ_p | †-reductions differ | ok |
| 4.5 | ℤ_p ⊗_{ℤ_p[x]} ℤ_p; ℓ^k − ℓ | L = A[1]; a p-power times a unit of ℤ_p, so the fibre is p-complete | ok |
| 4.6 | 0 → A¹; M = ℚ_p[−1] | L^∨ = ℚ_p[−1]; section not surjective | ok |
| 4.7 | P¹ | degree −2, Gauss point covered | ok |
| 4.8 | BG_m; A¹ at C_p[ε] | O[−1]; BA, BC_p, B(C_pε) | ok |
| 5.1 | ∅; identity of X; G_a | G_m/G_m; X × Â¹/G_m; cofib(I → R), weight −1 | ok |
| 5.2 | obstruction | lies in π_0Hom(L_{Y/X}, f^*M[2]) by the fibre sequence | ok |
| 5.3 | X = Y = GSpec(K) | K in weight 0 | ok |
| 5.4 | skyscraper ℚ_p[θ] | Σ p^{n²}θ^n has no value | ok |
| 6.1 | untilt C; Tau Ceti `isRadiusLowerBound_comap_frobenius_iff`; p = 0 | κ = 1; q ≤ κ(φv) ⇔ q/p ≤ κ(v); not a point of any M(A) | S01 |
| 6.2 | X = ∅ | isomorphism | ok |
| 6.3 | P¹; base | O ⊕ O(−1)[−2], ω = O(1)[2]; "arc-stacks over ℤ_p" undefined | ok; S02 |
| 6.4 | FF of Marc(ℚ_p) | 1, 2, 0; χ = −1 | ok |
| 7.1 | two copies | not a δ-space | ok |
| 7.2 | C_p[ε] | thickened at radii p^n, n ≥ 0 | ok |
| 7.3 | final object | GSpec(ℚ_p) | ok |
| 7.4 | Marc(K) × Marc(K) | Check places p = 0 points over GSpec(ℚ_p) | S01 |
| 7.5 | C_p[ε] | ℚ_p ×_{C_p} C_p[ε] = ℚ_p ⊕ C_pε | ok |
| 7.6 | λ = −1 at C_p[ε] | π_0 = C_p/ℚ_p, π_1 = C_pε | ok |
| 8.1 | [p]_q; q − 1; [p]_q² | degree 1; empty; degree 2 | ok |
| 8.2 | D over a perfect prism | 𝒳/φ^ℤ | ok |
| 8.3 | C_p | Y^HT = Y | ok |
| 8.4 | (φ^n)^*[p]_q | zeros: primitive p^{n+1}-th roots; product over n ≥ 0 = log q/(q − 1) | ok |
| 8.5 | divisor at 𝒳_T-radius ρ | φ^*D at ρ/p, so κ = 1/ρ ↦ p/ρ; φ^{−n}(HT) at p^{−n} ∉ (1, ∞) | ok |
| 8.6 | point | A¹/G_m ×_{A^{1,dR}/G_m^dR} Q_p^HK | ok |
| 8.7 | non-surjective open immersion | not an epimorphism | ok |
| 9.1 | C_p | T_Y[1]{1} = C_p(−1)(1) = O | ok |
| 9.2 | D × BG_a | fibre product over (O{1}[3])^†, a B²G_a^†{1}-torsor | ok |
| 9.3 | 0 → A¹ | amplitude [−1, 0], not an epimorphism | ok |
| 9.4 | D × BG_m | BG_m(R ⊕ I[1]) = BG_m(R) × B²I | ok |
| 9.5 | G_m | cocycle γ ↦ t | ok |
| 9.6 | point | Â¹/G_m ×_{BG_m^dR} GSpec(ℚ_p) | ok |
| 9.7 | action of the kernel of ℤ_p^{×,la} → ℤ_p^{×,sm} | trivial on GSpec(ℚ_p(μ_{p^∞})): Q_p^HT = GSpec(ℚ_p) ×_{Bℤ_p^{×,sm}} Bℤ_p^{×,la}, a G_m^†-gerbe, as (2) says | ok |
| 9.8 | φ^*I_BK | ⊗_{n≥1}(φ^n)^*I_Δ = I_Δ⁻¹I_BK; perfected: φ(log q ⊗ e⟨1⟩) = p·p⁻¹ | ok |
| 9.9 | log_Δ(q^p) | p(q − 1)e = (q − 1)e_A | ok |
| 10.1 | ℤ/2 on ℚ_p × ℚ_p | M_2(ℚ_p), also for p = 2 | ok |
| 10.2 | Π_0 = 1 | ℚ_p perfect over ℚ_p | ok |
| 10.3 | ℤ_p, r = 1/p; ℤ | p discs; G^cont = G^la | ok |
| 10.4 | (1 + p)^a; Σ p^k binom(a, p^k); ϖ = p², p^{1/2}; w − 1 on 1 + p²ℤ_p | r < p; p^{−k}r^{p^k} → ∞; 2^{−1/2}, 1/4; a p-valuation for p odd (≥ 1 > 1/(p − 1)) | ok |
| 10.5 | M = C(ℤ_p, ℚ_p) over C^la | M^la ⊗ A = C^la ≠ M | ok |
| 10.6 | G = 1 | 2.7 | ok |
| 10.7 | ℚ_p^cyc | ℚ_p(μ_{p^∞}) | ok |
| 10.8 | G = ℤ_p, d = 1 | exact bound 2^{−ϵ}r^{w} ≤ 1 against the source's sufficient 2^{−ϵ} < r^{−2w} (ω = 2w) | ok |
| 10.9 | G = 1 | identity | ok |
| 10.10 | Λ = ℚ_p | exponents v_p(ϖ)⁻¹ℤ, not dense | ok |
| 10.11 | G = 1 | contractible | ok |
| 10.12 | closed disc, G = 1 | ℚ_p against ℚ_p⟨T⟩ | ok |
| 11.1 | ℚ_{p²}; Marc(k) | 1, 3, 0 against 2, 4, 0; D^×_FF of Marc(k) = GSpec(W(k)[1/p]) with Frobenius σ | ok |
| 11.2 | C_p(n) | 0 for n ≠ 0; K, K, 0 for n = 0 | ok |
| 11.3 | d = 0 | Div¹ = X_cyc/ℚ_p^{×,la} | ok |
| 11.4 | X = D | identity of FF_D | ok |
| 11.5 | X^HT against X^{HT/D} | equal since D^HT = D (8.3); dim 1: two-term Higgs complex | ok |
| 11.6 | point; ∅ | 11.1; empty | ok |
| 11.7 | degree n | dim H¹ = n + 1 | ok |
| 11.8 | shape of L_{X^HT/X}[1] | 0 → O → · → Ω¹{−1} → 0 = FE ⊗ O{−1} | ok |
| 11.9 | G = 1 | points | ok |
| 11.10 | K(μ_{p^∞}) | GSpec(K(μ_{p^∞}))/Γ^la | ok |
| 12.1 | cusp; {\|T^n/p\| ≤ 1} | k²[1] ⊕ k[2]; radius p^{−1/n} ↑ 1 | ok |
| 12.2 | ω of A¹/G_m; HM formula | I[1] ⊗ O[−1] = I; δ(g) = [gKg⁻¹ : K] gives δ(p) = p⁻¹ (HM line 4927) | ok; see Not verifiable |
| 12.3 | G_m over a point | O{1}[2] | ok |
| 12.4 | P¹ | (O ⊕ O{−1}[−2])^∨ = O ⊕ O{1}[2] | ok |
| 12.5 | d = 1; base change | O{1}[2] ⊕ O; f^Δ is a base change of (P^d)^Δ → Q_p^Δ by 8.2 | ok |
| 12.6 | point, weight n | 0 for n ≠ 0, ℚ_p ⊕ ℚ_p[−1] for n = 0 | ok |

## Dependency check

    depcheck: 258 roadmaps, 2470 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. AnalyticStacks names this roadmap only as a consumer (its Scope and its Downstream consumers).

## Verified sound

- **Suggested.lean.** 0 declarations; `module`, the single `import Mathlib`, one module docstring titled "Rational analytic prismatization: target signatures", an empty namespace; no `sorry`, `set_option`, `lemma`, `#` command or process words. The seven headlines are the seven end theorems of the README Summary; each is about Gelfand stacks, and the pins have no analytic rings, six-functor formalisms or Gestalten, so none is statable and none is missing. Pinned names of the docstring checked: `CondensedMod.IsSolid` (Mathlib/Condensed/Solid.lean), `TauCeti.FarguesFontaine.spaX` (Quotient.lean:59). No padding.
- **Targets.** 93 numbered targets read; each has a *Needs:* line, at least one locator and at least three Checks (373 Checks; about 110 recomputed, 95 rows above).
- **Locators.** 596 line locators (ALRS 384, ABLB 79, Gest 76, RCSolid 17, HM 11). Read against the text in this pass, about 40: ALRS Notations (ALRS line 589–598), §2.1 (ALRS line 636–670), Theorem 2.1.7, §3.2 with Remark 3.2.1 and Lemma 3.2.2, Remark 3.2.4, Proposition 3.7.4, the pushout before (4.2.1), Theorem 5.1.1, Theorem 6.1.1, Remark 6.1.5, Theorems 6.3.1, 6.3.2, 6.4.1, Remarks 6.3.4, 6.4.2, Theorem 6.5.4, Remark 6.5.5, Theorem 6.5.8, Proposition 6.5.10, Proposition 6.6.7, Proposition 6.7.1; ABLB Definitions 2.1.1, 4.1.8, 4.1.11, 4.3.6, 6.1.1–6.1.2, Lemma 4.2.7 with footnotes 27–28, Theorems 5.1.7, 6.3.1, Proposition 5.7.1; Gest Definitions 2.7, 3.13, 6.1, 6.9, 6.16, Propositions 6.14, 9.3, Remark 9.6; HM Example 5.3.21. All support the README's statements, apart from S01.
- **Sibling citations.** 34 roadmaps. Re-resolved in this pass: AnalyticStacks (all headings §0.1–§7.7; §4.3, §4.4 items (1)–(7), its Scope), VectorBundlesAndIsocrystals Layer 5, PrismaticCohomologyPartII §§3.8, 3.9, 3.11, 4.12, 4.13, FarguesFontaineDiamonds F2, F4, RelativeFarguesFontaine §§1.2, 2.1, 2.2, 3.2, 4.7, PadicHodgeTheory §§2.2, 2.3, 4.4, 7.1, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2, NoncommutativeAndEquivariantIwasawa §F.6, EnhancedDerivedSheaves §E0.8 and §E5:presentability.1, AdicEtaleGeometry §A1.12, §A2.4, MotivesAndAlgebraicCyclesPartII Layer 0 and §0.4 (board package, line 407 of the merge order). `Huber.GelfandSpectrum` and MotivesAndAlgebraicCyclesPartII, the two leads of the citation tool, were settled in round 1 and are not defects.
- **Pinned declarations.** `TauCeti.FarguesFontaine.IsRadiusLowerBound` (Window.lean:102: v([ϖ])^b ≤ v(p)^a, that is a/b ≤ κ), `isRadiusLowerBound_comap_frobenius_iff` (Window.lean:149), `PadicInt.mahlerEquiv` (MahlerBasis.lean:353) read at the pins; the other 20 were checked in round 1 and their lines are unchanged.
- **Gaps.** `gap:proetale-v-comparison` has the same slug and sentence in `design/plan.json` and at README:160, names DiamondsAndVStacks §D6.5 (on main), and no roadmap on main or at an open head states the comparison (search for RΓ_v and pro-étale against v-cohomology: no match). It is precise and minimal.
- **Ownership.** `roadmaps grep` for Gestalt, Stefanich, Gelfand stack, twistor stack, Hyodo–Kato stack, δ-space, nilperfectoid, analytic de Rham stack: only AnalyticStacks, which leaves them to this roadmap or outside its scope. "Analytic prismatic F-crystals" of CohomologyComparisons §2.24 are prismatic F-crystals on formal schemes, a different object. No declaration name can collide.
- **Policy.** The pull request changes only `packages/RationalAnalyticPrismatization/`. No pull-request numbers, process words, machine paths, `lemma` or `set_option` in the README or the Lean file.
- **Wording.** Nine passages put beside the source in this pass (0.3 and Gest line 1944–1951; 0.4 and Gest line 2115–2124; 2.1 and ABLB line 2198–2208; 2.4 and ALRS line 797–806; 2.6 and ABLB line 2384–2388; 3.3 and ABLB line 3567–3569; 6.1 and ALRS line 2295–2321; 10.12 and ALRS line 4738–4750; 12.3 and ALRS line 8875–8882): the longest shared run found is 7 words ("refines to an internal right adjoint in", a forced statement). No table, figure or list is taken over.
- **Arrangement.** ALRS has 384 of 596 locators. Against its contents (ALRS line 15–70): Layer 0 ↔ Gest; Layer 1 ↔ ABLB §§2–3; Layers 2–4 ↔ ALRS §§2.1–2.7 with ABLB §§4–5 and Appendix A; Layer 5 ↔ §§2.8–2.9, 3.1; Layer 6 ↔ §3.2 with ABLB §6 and ALBM §4; Layer 7 ↔ §§3.3–3.7; Layers 8–9 ↔ §4 (§4.7 split between 8.7 and 9.3); Layer 10 ↔ §5 (§5.1 last); Layers 11–12 ↔ §6 (11.3 from §4.10). Thirteen layers against six chapters and an appendix, three layers led by other sources; the order of Layers 7–12 is forced by 8.1 → 7.1, 9.1 → 8.6, 11.1 → 9.7 and 10.12, 12.3 → 11.4 and 11.6. Same result as round 1.

Source independence: 9 passages compared with 3 sources (ALRS, ABLB, Gest) in this pass, none shared (longest forced run 7 words), after the whole-file run comparison of round 1 with 5 sources; largest share ALRS, 384 of 596 locators; contents compared with ALRS: independent at the level of layers.

## Not verifiable

- The radius formula at ALRS line 2317: the extraction shows a leading minus sign and no fraction bar. The README's κ = log\|[ϖ]\|/log\|p\| is positive and agrees with Tau Ceti's bound and with ALRS line 2319–2321; whether the source prints a sign slip could not be read from the text.
- 12.2, fifth Check. HM line 4927 gives δ(g) = [gKg⁻¹ : K], hence δ(p) = p⁻¹ for a acting on ℚ_p by multiplication; ALRS line 8819 writes \|a\|⁻¹_p and line 8820–8821 reaches the isocrystal of slope −1. Which side of the semidirect product the source lets a act on, and its dictionary between characters and isocrystals, were not settled; the result O⟨1⟩[2] of 12.2(1) agrees with ALRS Theorem 6.5.4(1) and with 6.4(2).
- Whether `B_{[0,s]}(S)` can be made a Gelfand ring in some extended sense (ABLB line 2609–2611 also lists intervals with r = 0): the README's own definitions exclude it, which is all S01 uses.
- Proof steps taken from inside source proofs in Layers 10–12 (the reductions of 10.8–10.10, the 0-affineness argument of 12.1(3), the cell-attachment argument): the cited passages exist; the steps were not recomputed.
- About 260 of the 373 Checks were read for consistency and not recomputed.
- MotivesAndAlgebraicCyclesPartII is a board package, not on main and not an open roadmap pull request; its Layer 0 was read in the board checkout and its numbering may still move.
- Ownership against the open pull requests whose files the brief does not give by path was checked through `roadmaps grep` and `roadmaps show` only.

## Source issues

- **Gap** in ALRS at §3.2, printed page 44: the source says the unpunctured Fargues–Fontaine disc, which contains the locus p = 0, is a Berkovich space; it should be the punctured disc only, its Gelfand rings being ℚ_p-algebras; affects nothing.
- **Error** in ALRS at Remark 6.1.5, printed page 145: the source says the twistor stack of GSpec(K), K unramified, is the plain product with Div¹; it should be the Frobenius-twisted quotient, since H⁰ is ℚ_p and not K; affects a stated result.
- **Misprint** in ALRS at Proposition 3.7.4(2), printed page 56: the source says the lower left corner of the square is the classifying stack of the de Rham additive group; it should be that of the analytic additive group, as its proof says; affects nothing.
- **Misprint** in ALRS at Theorem 6.5.8(3), printed page 164: the source says the upper shriek is applied to the structure sheaf of the twistor stack of Y; it should be that of X; affects nothing.

## For the human reviewers

- **Scope.** `design/plan.json` still lists `gestalten-affine-proper` and `gestalten-transmutation` with supplier `none`, although README 0.2–0.5 states them as targets; the plan's layers name both slugs, so only a design-stage edit can retire them.
- **Scope.** The main sources are not refereed: ALRS (2026 preprint, author page, 384 of 596 locators), Gest (lecture notes, author page, 76 locators), ABLB and RCSolid (arXiv 2025–2026). No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS, Gest and Sch24 as author-page copies with no stated licence; the README restates results with locators and copies no passage.
- **Scope.** The supplier MotivesAndAlgebraicCyclesPartII (README:96) is a board package under review, the entry before this roadmap in the merge order.
- **Arrangement.** Inside Layers 7, 9, 10 and 12 the subsections 7.1, 7.4–7.6, 9.7–9.9, 10.6–10.11 and 12.5–12.6 each match one ALRS section in the source's order; both rounds judged the order forced by the *Needs:* chains.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "05a682520296aae63124d226ea9dc722d0f98356", "job": "RT-RationalAnalyticPrismatization~2b", "model": "fable", "worker": "chris-x26"} -->
