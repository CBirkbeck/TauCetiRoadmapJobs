<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18047#issuecomment-6911629882 -->
Red team round 1 pass a (claude) of 61666d4

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The module docstring of Suggested.lean overstates two headline theorems

   **Location.** `packages/RationalAnalyticPrismatization/Suggested.lean:44–45`: "`X/G^cont → |X|^Betti/G^la` is 0-proper with fully faithful pullback"; and `:50–51`: "for a rigid smooth map of relative dimension `d`, `f^{Div¹,!} O ≅ O{d}[2d]`".

   **Claim.** (a) Pullback along h is fully faithful. (b) The dualizing complex of `f^{Div¹}` is O{d}[2d] for every rigid smooth f.

   **Witness.** (a) G trivial, X = GSpec(ℚ_p⟨T⟩): End(O) on |X|^Betti is the locally constant functions on a connected space, ℚ_p; End(O_X) = ℚ_p⟨T⟩. README 10.6 and 10.12(1) (ALRS line 4743–4744) say "on modules over O^la_X". (b) README 12.3(3) and ALRS line 8881 require X smooth partially proper rigid over ℚ_p.

   **Repair.** Replace the two clauses by:

   - "`X/G^cont → |X|^Betti/G^la` is 0-proper, and pullback is fully faithful on modules over `O^la_X = h_* O`,"
   - "for a rigid smooth map `f : Y → X` of pure relative dimension `d` with `X` a smooth partially proper rigid space over `ℚ_p`, `f^{Div¹,!} O ≅ O{d}[2d]`;"

   Tested on the witness: (a) Mod over h_*O = O_X on |X|^Betti has End(unit) = ℚ_p⟨T⟩, equal to End(O_X); (b) is now 12.3(3).

2. **F02** (P2) The declared gap `nuclear-modules` still asks AnalyticStacks for facts that RefinedTraceMethods §4.3 provides

   **Location.** `packages/RationalAnalyticPrismatization/design/plan.json`, `gaps`, slug `nuclear-modules`: "needs: … the Hom criterion, closure under colimits and tensor products, ω₁-compact nuclear objects basic nuclear, …", "section: §4.3(1)–(2)".

   **Claim.** AnalyticStacks §4.3(1)–(2) must supply closure of nuclear objects under colimits and tensor products and "ω₁-compact = basic nuclear".

   **Witness.** `packages/RationalAnalyticPrismatization/README.md:73` cites those facts to RefinedTraceMethods §4.3 (found there at its README lines 1604 and 1637; line 352 of the merge order, earlier than AnalyticStacks). AnalyticStacks §4.3 (its README line 918) takes Nuc(A) from RefinedTraceMethods §4.3. The README no longer uses §4.3(2).

   **Repair.** In `plan.json`, entry `nuclear-modules`: `"needs": "Nuclear objects of D(A) for a solid ℚ_p-algebra A, characterized by the Hom criterion, and, for nuclear A, nuclearity tested on the underlying ℚ_p-module and on homotopy groups, with closure under countable limits."`, `"section": "§4.3 (opening and (1))"`. Tested on A = ℚ_p and `⊕_{n≥0}` ℚ_p[−n]: its nuclearity (a colimit of nuclear objects, fourth Check of 2.3) is then read from RefinedTraceMethods §4.3, as README:73 says.

3. **F03** (P2) 12.2 cites FarguesFontaineDiamonds §F2 for the properness of Div¹, which that section does not state

   **Location.** `packages/RationalAnalyticPrismatization/README.md:2112`: "cohomological properness follows from 3.3(1) since `Div^{1,⋄}` → Spd ℚ_p is proper (FS Proposition II.1.21; FarguesFontaineDiamonds §F2)"; also the *Needs:* line 2114 and the Layer 12 Dependencies, line 2204.

   **Claim.** FarguesFontaineDiamonds §F2 supplies properness of Div¹.

   **Witness.** FarguesFontaineDiamonds at its open head: Layer F2 ("Frobenius and the effective quotient") has no properness statement; Div¹ occurs only in its scope note. VectorBundlesAndIsocrystals Layer 5, target "Effective divisors and projective sections", states that Div^d "is proper over `∗`, representable in spatial diamonds and cohomologically smooth".

   **Repair.** Line 2112: "… since `Div^{1,⋄}` → Spd ℚ_p, the base change of Div¹ → ∗ along Spd ℚ_p → ∗, is proper (FS Proposition II.1.21; VectorBundlesAndIsocrystals Layer 5, “Effective divisors and projective sections”, d = 1)". Lines 2114 and 2204: replace "FarguesFontaineDiamonds §F2" by "VectorBundlesAndIsocrystals Layer 5". VectorBundlesAndIsocrystals is line 134 of the merge order, so the edge points down; §F2 stays in Layers 6 and 7, where the Frobenius quotient is what is used.

4. **F04** (P3) Two supplier sections are cited for statements they do not make

   **Location.** (a) `README.md:1938`: "the labelled Sen operator Θ = log ρ(γ)/log χ_p(γ) of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2". (b) `README.md:13`: "the p-adic monodromy theorem (ABLB Theorem 7.1.1; PadicHodgeTheory §5.1)".

   **Witness.** (a) §R07.P7.2 at its open head states the weight convention (χ_p of weight +1) and the tensor, dual and symmetric-power formulas; the formula log ρ(γ)/log χ_p(γ) is not in it. (b) PadicHodgeTheory §5.1 is "The differential equation attached to a de Rham representation" and imports `deRham_iff_potentiallySemistable` from NoncommutativeAndEquivariantIwasawa §F.6.

   **Repair.** (a) "… and the labelled Sen operator of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2, in which χ_p has weight +1." (b) "(ABLB Theorem 7.1.1; NoncommutativeAndEquivariantIwasawa §F.6)".

5. **F05** (P3) 10.2 proof route: ℚ_p is said to have a finite free resolution over the integral Iwasawa algebra

   **Location.** `README.md:1670`: "which holds because ℚ_p has a finite free resolution over `ℤ_{p,■}[Π_0]`".

   **Witness.** Π_0 trivial: `ℤ_{p,■}[Π_0]` = ℤ_p and ℚ_p is not a perfect ℤ_p-module. The statement of 10.2 and the route of 10.4 (line 1717: "resolution of ℤ_p by finite free `ℤ_{p,■}[G]`-modules") have it right.

   **Repair.** "which holds because ℚ_p is a perfect `ℚ_{p,■}[Π_0]`-module (for uniform Π_0, the Lazard–Serre resolution of ℤ_p by finite free `ℤ_{p,■}[Π_0]`-modules with p inverted)". For Π_0 trivial this reads: ℚ_p is perfect over ℚ_p.

6. **F06** (P3) Div¹~ is written as the perfect prismatization of the stack Q_p^Δ

   **Location.** `README.md:23`: "Div¹~ = `(Q_p^Δ)^{Div¹~}`"; the same formula at line 1343.

   **Witness.** By 8.2, `X^{Div¹~}` = lim_φ X^Δ for a Gelfand stack X (ALRS line 2969–2972). With X = Q_p^Δ the formula reads lim_φ (Q_p^Δ)^Δ, the prismatization applied twice. The intended object is GSpec(ℚ_p)`^{Div¹~}` = lim_φ Q_p^Δ, as 9.7(4) (Div¹~ ≅ `X_cyc/ℤ_p^{×,la}`) uses.

   **Repair.** Both places: "Div¹~ = `GSpec(ℚ_p)^{Div¹~}` = lim_φ Q_p^Δ".

7. **F07** (P3) The P¹ Check of 4.7 glues along a cover that 2.6 does not allow

   **Location.** `README.md:963`: "The analytic projective line P¹, glued from two closed unit discs with coordinates T and 1/T along the annulus |T| = 1".

   **Witness.** 2.6 (line 619) takes as covers the strict closed covers, "refined by an open cover". The Gauss point lies in the interior of neither {|T| ≤ 1} nor {|T| ≥ 1}. And by 2.6 and 4.2 the closed disc GSpec(ℚ_p⟨T⟩) is not Berkovich-smooth, while P¹ is.

   **Repair.** "The analytic projective line P¹, covered by the overconvergent discs {|T| ≤ p} and {|1/T| ≤ p}, a strict closed cover with overlap the annulus `p^{−1}` ≤ |T| ≤ p, has cotangent complex …" (rest unchanged). The interiors {|T| < p} and {|T| > `p^{−1}`} cover P¹, including the Gauss point.

8. **F08** (P3) plan.json still lists two gaps with supplier `none` although Layer 0 now states them

   **Location.** `design/plan.json`, `gaps`, slugs `gestalten-affine-proper` and `gestalten-transmutation`: `"supplier": "none"`.

   **Witness.** README Layer 0 (0.2–0.5, lines 234–323) states every clause of the two `needs` sentences as targets of this roadmap, and the README has no contract line for either slug. The intake reads `plan.json`, where the two are still unowned gaps. I searched main, the open heads and the board packages for Gestalten, Stefanich rings and transmutation: only AnalyticStacks mentions them, to exclude them (its README line 22), so no other owner exists.

   **Repair.** Remove the two entries from the `gaps` list of `plan.json` (the prerequisite is a target here, 0.2–0.5, not a supplier gap). If the plan's targets must keep a prerequisite, name "§0.2–§0.5" there. See also the first bullet for the human reviewers.

Eight findings: no P1, three P2 (R01–R03), five P3 (R04–R08). Both files were read in full (README 2235 lines, Suggested.lean 67 lines).

## Verified sound

**Counts.** Declarations read: 0 (Suggested.lean has a module docstring and an empty namespace). Targets read: 93 of 93. Checks read: 372 of 372; every target has at least three. Line locators: 585; 471 tied to a theorem label and checked by script against the source text (426 have the label at the cited line, the other 45 point inside the cited item, each read); 412 page numbers checked against the page markers, no mismatch; about 40 passages read by me. Sibling citations checked: 145 (35 AnalyticStacks sections and numbered parts, read by me at its open head; 63 ids in 16 roadmaps on main and 47 ids in 18 open or board roadmaps, located by helpers, every flagged one reread by me). Library declarations: 23 of 23 exist at the pins with the cited file and line (10 in Mathlib 1b1ccf4, 13 in Tau Ceti 2fd255d).

**Dependency check.** Output:

    depcheck: 256 roadmaps, 2452 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Suggested.lean.** `import Mathlib` only; no declaration, `sorry`, `set_option`, `lemma` or `#` command. There is nothing to elaborate, so the `#check @name` comparison has no input; I ran no Lean. The seven headlines of the docstring are the seven end theorems of the README Summary. None is statable at the pins: each names Gelfand stacks, and the pins have no analytic rings, six-functor formalisms or Gestalten (grep of both libraries). Tate's computation of H^i(Gal_K, C_p(n)) is a consequence owned by PadicPeriodRings §1.4 and names none of this roadmap's objects; it is rightly not stated. No padding.

**Policy.** The pull request changes only `packages/RationalAnalyticPrismatization/`. No pull-request numbers, process words, `lemma` or `set_option` in the README or the Lean file. Every target has a locator.

**Suppliers.** Every cited section exists where cited, apart from R03 and R04. AnalyticStacks §2.3(1), (7), §4.3(1), §4.4(1), (3)–(6), §6.3(1), §6.5(3)–(4), §7.3 (the ℤ[T] Check), §7.5(4) and Conventions (4) say what the README says they say. `Huber.GelfandSpectrum` is declared in AdicSpacesPartIII's `Suggested.lean` (namespace `Huber`), so the lead in `citations.md` is not a defect. MotivesAndAlgebraicCyclesPartII is a board package at line 407 of the merge order; its Layer 0 and §0.4 exist and it defines no Gelfand rings, light arc-stacks or de Rham stacks. The 18 AnalyticStacks gaps of the plan are stated in the README as citations of sections that exist at its head. `gap:proetale-v-comparison` is declared in both places with the same wording; no roadmap states that comparison (search for RΓ_v and v-cohomology), so it asks for nothing already provided.

**Ownership.** No other roadmap on main, at an open head or among the board packages defines Gelfand rings or stacks, analytic de Rham or Hyodo–Kato stacks, the twistor stack or Gestalten. LocallyPresentableCategories proves the 1-categorical Gabriel–Ulmer duality; 0.1 is the ∞-categorical one, a different statement.

**The adversarial table.** One row per target; "ok" means the two sides agree on the instances shown.

| Target | Instances | Values on each side | Result |
|---|---|---|---|
| Suggested.lean docstring | G trivial, X closed disc; f rigid smooth, X arbitrary | End(O): ℚ_p against ℚ_p⟨T⟩; 12.3(3) needs X partially proper | R01 |
| Conventions, twists | generator e on X_cyc | φ(log q/(q−1)) = p·`[p]_q^{-1}`·log q/(q−1); φ(e⟨1⟩) = `p^{-1}`e⟨1⟩; φ(e) = `[p]_q^{-1}`e | ok |
| Conventions, radius | untilt C, ϖ = p♭; p = 0 | κ = 1; φ^n: p^n; κ = 0 | ok |
| 0.1 | C = D(k); A_2 = 1Pr | End(1) = D(k); Ani ≠ D(k) | ok |
| 0.2 | S over R; ∗ → B²G_m; ∅ | (B/A)_0 = S; 1-affine not 0-affine (Gest line 1888); ∅ 0-affine only over D(k) (Gest line 2525) | ok |
| 0.3 | k[x] over k; X^dR diagonal | forgetful functor colimit-preserving; lim_n not | ok |
| 0.4 | k[x]; ℤ[T] in AnalyticStacks §7.3 | M ⊗ k[x] does not preserve products; both verdicts 0-prim, not 0-suave | ok |
| 0.5 | one-object C; finite sets, fold map | K_D = Mod_V(1Pr); f_! = f_* = ⊕, relative algebra Λ × Λ | ok |
| 1.1 | ℚ_p; ℚ_p[T]; 0 | A° = ℤ_p; A^b = ℚ_p ≠ A; 0 bounded | ok |
| 1.2 | ℚ_p⟨T⟩; ℚ_p[ε]; ℚ_p⟦T⟧[1/T] | `A_{≤p^{-k}}` = p^kℤ_p⟨T⟩; Nil† = ℚ_pε; T ∈ Nil†, 1 = `T^{-1}`T ∉ Nil† (unbounded) | ok |
| 1.3 | ℚ_p[ε]; `ℚ_p⟨T⟩_{≤1}`; 0 | A^u = ℚ_p, 1+ε ↦ 1; A^u = ℚ_p⟨T⟩; A^u = 0 ⇒ A = 0 | ok |
| 1.4 | C_p; ℚ_p⟨T_n⟩; 0 | separable qfd; not qfd; qfd | ok |
| 1.5 | ℚ_p; ℚ_p × ℚ_p; 0; bounded seminorm on ℚ_p | 1 point; 2 points; ∅; |p| ≤ 1/p and |1/p| ≤ p force equality | ok |
| 1.6 | {|T| ≤ |p|}; f = 1, g = p | `colim_{r>1/p}` ℚ_p⟨T/r⟩ against ℚ_p⟨T/p⟩; zero ring | ok |
| 1.7 | ℚ_p × ℚ_p; ℚ_p[ε] | ranks may differ; ℚ_p not dualizable; parts (1), (5), (6) of AnalyticStacks §4.4 as cited | ok |
| 1.8 | C_p[ε]; ℚ_p(μ_{p^∞}); ℚ_p | nilperfectoid; uniformly perfectoid only; neither | ok |
| 2.1 | A × B; 0 | disjoint union; initial | ok |
| 2.2 | open disc; closed disc | f_!O in degree 1, f_*O in degree 0; 0-affine | ok |
| 2.3 | ∏_ℕℤ_p[1/p]; ⊕ℚ_p[−n] | compact, not dualizable, so not nuclear; nuclear, in no `D_{≥−n}` | ok |
| 2.4 | ℚ_p; 0 | ℚ_p → ℚ_p^cyc; empty family | ok |
| 2.5 | two points; ℕ ∪ {∞} | ℚ_p × ℚ_p; C^lc ≠ C | ok |
| 2.6 | closed disc and its compactification; r = 0 | A⁺ = ℤ_p + pℤ_p⟨T⟩, same GSpec; image of `K⟨T_i⟩_{≤r}` misses 1/(1 − T/c), |c| < ρ | ok |
| 2.7 | A = `ℚ_p[u^{±1}]` | GSpec_X(A) = ∅ | ok |
| 2.8 | ℚ_p[ε]; final object | Marc(ℚ_p); not preserved by X ↦ X̂ | ok |
| 3.1 | A¹ at C_p[ε]; GSpec(ℚ_p) | ε and 0 same image; X^dR final | ok |
| 3.2 | BG | BG^sm | ok |
| 3.3 | d = 0; open disc | O; smooth, f_! ≠ f_* (ABLB line 3567) | ok |
| 3.4 | ℚ_p[ε]; C(ℤ_p, C_p) | ℚ_p ⊕ ℚ_pε against ℚ_p; C(ℤ_p, ℚ_p) = H⁰(FF, O) | ok |
| 3.5 | Spec R(*) | S | ok |
| 3.6 | GSpec(ℚ_p), s = 0 and s ≠ 0 | ℚ_p ⊕ ℚ_p[1]; ∅ | ok |
| 4.1 | 0 → A¹ at C_p[ε] | fibre C_pε against a point | ok |
| 4.2 | three discs | rigid smooth; Berkovich-smooth only; neither (ALRS line 1351) | ok |
| 4.3 | two discs at the origin; Z = ∅ | ℚ_p⟨S,T⟩/(ST); X ⊔ Y | ok |
| 4.4 | ℚ_p[ε] → ℚ_p; ℚ_p⟨T⟩ → ℚ_p | †-thickening; not | ok |
| 4.5 | ℤ_p[T]; ℤ_p `⊗_{ℤ_p[x]}` ℤ_p; ψ^ℓ on gr^k | L not p-complete; L = A[1]; ℓ^k − ℓ ≠ 0 for k ≥ 2 | ok |
| 4.6 | 0 → A¹; M = ℚ_p[−1] | L^∨ = ℚ_p[−1] not connective; section not surjective | ok |
| 4.7 | P¹ | two closed unit discs are not a strict cover | R07 |
| 4.8 | BG_m; A¹ at C_p[ε] | O[−1]; BA, BC_p, B(C_pε) | ok |
| 5.1 | point; ∅; G_a; zero section in the disc | A¹/G_m; G_m/G_m; G_a/G_a(−1); gr = ℚ_p[x̄] | ok |
| 5.2 | obstruction | fibre sequence puts it in π_0Hom(`L_{Y/X}`, f^*M[2]) | ok |
| 5.3 | X = Y = GSpec(K) | K in weight 0 | ok |
| 5.4 | I = R; vector bundle on a disc | X^dR; ‖θ^n‖ ≤ C^n, entire series converge | ok |
| 6.1 | ϖ ↦ ϖ^m; reciprocal convention | κ multiplied by m; contradicts κ∘φ = pκ; Tau Ceti `isRadiusLowerBound_comap_frobenius_iff` at Window.lean:149 | ok |
| 6.2 | X = ∅; nonempty | isomorphism; not (ALRS line 2357) | ok |
| 6.3 | P¹ | f_*O = O ⊕ O(−1)[−2], ω = O(1)[2], pairing into O (ABLB line 5415) | ok |
| 6.4 | Marc(ℚ_p) | dimensions 1, 2, 0; χ = −1 | ok |
| 7.1 | two copies of the disc; S = ∅ | not a δ-space; (∅, ∅) | ok |
| 7.2 | A perfectoid; C_p[ε]; ℚ_p(μ_{p^∞}) | pushout along identity; `A_{≤1} = O_{C_p}` ⊕ C_pε; `A_{≤1}` → A^{u,°} not surjective | ok |
| 7.3 | final object | GSpec(ℚ_p) | ok |
| 7.4 | Marc(𝔽_p) | GSpec(ℚ_p), HK = GSpec(ℚ_p)/φ^ℤ | ok |
| 7.5 | C_p[ε] | ℚ_p ⊕ C_pε = ℚ_p^la(A) of 3.4 | ok |
| 7.6 | λ = 1, −1; D_λ in place of `D_{−λ}` | 1 + 𝔪; C_p/ℚ_p; H⁰(O(1)) would be 0 | ok |
| 8.1 | [p]_q; q − 1; [p]_q² | degree one; empty; degree two | ok |
| 8.2 | notation Div¹~ | `(Q_p^Δ)^{Div¹~}` = lim_φ (Q_p^Δ)^Δ | R06 |
| 8.3 | C_p; ℚ_p[ε] | Y^HT = Y; same de Rham stack | ok |
| 8.4 | X_cyc | zeros of log q/(q − 1): primitive p^m-th roots, m ≥ 1 | ok |
| 8.5 | κ against 1/κ | Hodge–Tate at 1, translates at `p^{-n}`; (0, p) and (1, ∞) become (1/p, ∞) and (0, 1) | ok |
| 8.6 | point; ∅ | Div¹ = A¹/G_m `×_{A^{1,dR}/G_m^dR}` Q_p^HK; ∅ (ALRS line 3406: any X) | ok |
| 8.7 | non-surjective open immersion | not an epimorphism | ok |
| 9.1 | point; C_p | identity; T_Y[1]{1} = O | ok |
| 9.2 | X = D; D × BG_a | D; fibre product over (O{1}[3])^†, not a gerbe | ok |
| 9.3 | 0 → A¹ | not an epimorphism | ok |
| 9.4 | X = D | D^†, D^∧ | ok |
| 9.5 | G_m | cocycle γ ↦ t, nonzero in H¹(ℤ_p(1), Ĉ(1)) | ok |
| 9.6 | point | Â¹/G_m `×_{BG_m^dR}` GSpec(ℚ_p) | ok |
| 9.7 | a ∈ ℤ_p^×; p | `q^{1/p^n}` ↦ `q^{a/p^n}`; q ↦ q^p | ok |
| 9.8 | perfected generator log q ⊗ e⟨1⟩ | φ = p·`p^{-1}` = 1, slope 0 | ok |
| 9.9 | log_Δ(q); PrismaticCohomologyPartIII §6.10 | (q − 1)e; (q − 1)e_A = log_Δ(q^p), so e_A = p·e, a φ-invariant unit multiple | ok |
| 10.1 | ℤ/2 on ℚ_p × ℚ_p | M_2(ℚ_p) against ℚ_p⁴ | ok |
| 10.2 | Π_0 trivial | ℚ_p not perfect over ℤ_p | R05 |
| 10.3 | ℤ_p, r = 1/p; ℤ discrete | p discs of radius 1/p; G^cont = G^la | ok |
| 10.4 | (1 + p)^a; Σ p^k binom(a, p^k); ϖ = p² | (r/p)^n → 0 for r < p; `p^{-k}r^{p^k}` → ∞; |p|_ϖ = `2^{-1/2}` > 1/2; Legendre bounds recomputed | ok |
| 10.5 | C(ℤ_p, ℚ_p) over ℚ_p, over C^la | no decompletion in either case | ok |
| 10.6 | G trivial | h = (X → |X|^Betti), O^la = h_*O (ALRS line 4743) | ok |
| 10.7 | ℚ_p^cyc; C(G, ℚ_p) | K^la = ℚ_p(μ_{p^∞}); R^la = C^la_G | ok |
| 10.8 | d = 0 | every module decompletes | ok |
| 10.9 | G trivial | identity | ok |
| 10.10 | Λ = ℚ_p | exponents `v_p(ϖ)^{-1}`ℤ, not dense | ok |
| 10.11 | Γ finite; G trivial | own de Rham stack; contractible mapping anima | ok |
| 10.12 | G trivial | tautological | ok |
| 11.1 | K = `ℚ_{p²}`, `ℚ_{p³}` | dimensions 1, 3, 0 against 2, 4, 0; σ ⊗ φ acts by φ on each of three factors, invariants ℚ_p³; with `σ^{-1}` a field `ℚ_{p³}` | ok |
| 11.2 | C_p(n) | n ≠ 0: 0; n = 0: K, K, 0; the formula for Θ is not in the cited section | R04 |
| 11.3 | d = 0 | Div¹ = `X_cyc/ℚ_p^{×,la}` | ok |
| 11.4 | X = D | FF_D, identity | ok |
| 11.5 | dim 1; X = D | two-term Higgs complex; L = (T{1})^∨[−1] = Ω¹{−1}[−1] | ok |
| 11.6 | point; ∅ | 11.1; empty (ALRS line 8082) | ok |
| 11.7 | ℚ_p; degree n | 1, 2, 0; H¹ of dimension n + 1 | ok |
| 11.8 | K = `ℚ_{p²}` | K ⊗ K = K × K, so the product over ℚ_p is two copies | ok |
| 11.9 | G = ℤ_p over ℚ_p | Hom(Gal, ℤ_p) free of rank 2 | ok |
| 11.10 | K(μ_{p^∞}) | K^HT = GSpec(K(μ_{p^∞}))/Γ^la | ok |
| 12.1 | cusp; ℚ_p⟨T_n⟩ → ℚ_p | L = k²[1] ⊕ k[2], perfect; I/I² infinite-dimensional | ok |
| 12.2 | mirabolic, K = ℤ_p ⋊ (1 + pℤ_p); properness citation | [pℤ_p : ℤ_p] = `p^{-1}`; §F2 has no properness statement | R03 |
| 12.3 | G_m over a point | O{1}[2]; composite O{2}[4] | ok |
| 12.4 | P¹ | f_*(O{1}[2]) = O{1}[2] ⊕ O = (O ⊕ O{−1}[−2])^∨ | ok |
| 12.5 | d = 1; d = 0 | O{1}[2] ⊕ O; O | ok |
| 12.6 | point | weight-n part of h_*O: 0 for n ≠ 0, ℚ_p ⊕ ℚ_p[−1] for n = 0 | ok |

### Copyright, licences and scope

**Wording.** A script compared every line of the README and of Suggested.lean with the full texts of ALRS, ABLB, Gest, RCSolid and HM (runs of nine or more shared words). The longest shared runs outside the bibliography are 13 words: the chain of implications "strongly †-formally smooth ⇒ …" (README:829, ALRS line 1289), a formula of 4.1 (README:819, ALRS line 1280) and "cohomologically proper if and only if f is truncated and [f]_D is" (README:304, Gest line 3115). Each is a statement that can be written in one way. I also read about 40 passages side by side (among them 2.2, 6.2, 8.6, 10.2, 10.6, 11.1, 11.6, 12.2, 12.3, 12.4 and the docstring of Suggested.lean): none follows the source clause by clause.

**Arrangement.** ALRS has 378 of the 585 line locators. Against its contents (ALRS line 15–70), by number: Layer 0 ↔ Gest Lectures II, III, VI–IX; Layer 1 ↔ ABLB §§2–3; Layer 2 ↔ ABLB §4 with ALRS §§2.1–2.3; Layer 3 ↔ §§2.3–2.5 with ABLB §5; Layer 4 ↔ §§2.6–2.7 with Appendix A; Layer 5 ↔ §§2.8–2.9 and 3.1; Layer 6 ↔ §3.2 with ABLB §6 and ALBM §4; Layer 7 ↔ §§3.3–3.7; Layers 8–9 ↔ §4 (8.7 and 9.3 split §4.7); Layer 10 ↔ §5 (10.12 ↔ §5.1 placed last); Layers 11–12 ↔ §6 (11.3 from §4.10 and §1.2). The layers do not map one to one onto ALRS's sections: seven layers draw on two or three sources, §4 and §6 are each split in two, and Appendix A is merged into Layer 4. The order of Layers 7–12 is forced by the *Needs:* lines (8.1 needs 7.1; 9.1 needs 8.6; 11.1 needs 9.7 and 10.12; 12.3 needs 11.4 and 11.6). No finding.

**Reuse.** No table, figure or list is taken over from a source. Suggested.lean has no declaration to compare with a public formalisation.

Source independence: 93 sections compared by script with 5 sources and about 40 passages read side by side, none shared (longest forced run 13 words); largest share ALRS, 378 of 585 locators; contents compared with ALRS: independent.

## Not verifiable

- The sign of the modulus in the fifth Check of 12.2. ALRS line 8819 writes α^*δ(a) = `|a|_p^{-1}`; the README takes δ(p) = `p^{-1}` from the generalized index and adjusts the dictionary to isocrystals so that the result is O⟨1⟩[2]. Both routes reach the dualizing complex forced by 6.4(2); which convention HM Example 5.3.21 fixes for a right or left action was not settled here.
- Proof steps taken from inside source proofs (the p-completeness argument of 4.5 at ALRS line 9471–9506, the 0-affineness argument of 12.1(3), the reductions of 10.8–10.10). I checked that each cited passage exists and concerns the step, not each step.
- Citations given without a line: SixFF Proposition 5.16, RC24 Lemma 2.6.13 and Proposition 3.7.5, RJRC Proposition 6.1.5 and Remark 2.1.5, Man26 Lemmas 10.3 and 10.5, AM24 Lemma 3.29, BC16 Théorèmes 3.2 and 3.4, Zav Theorem 5.7.7, FS Propositions II.1.21 and II.2.5. Their texts were not opened.
- The deep targets (11.6, 12.2–12.6, 10.9) beyond the instances of the table: their truth rests on ALRS, whose statements match the README at the cited lines.
- The Lean file was not elaborated (no build is allowed in this pass, and it has no declaration).

## Source issues

- **Error** in ALRS at Remark 6.1.5, printed page 145: the source says that for unramified K the twistor stack of GSpec(K) is the plain product of GSpec(K) with Div¹; it should be the Frobenius-twisted product (GSpec(K) × Div¹~)/(σ × φ)^ℤ, since H⁰ must be ℚ_p and not K; affects a stated result.
- **Misprint** in ALRS at Proposition 3.7.4(2), printed page 56: the source puts the classifying stack of the de Rham additive group in the lower left corner of the square; it should be that of the analytic additive group, as its proof and the extension it deduces show; affects nothing.
- **Misprint** in ALRS at Theorem 6.2.2(4), printed page 147: the source twists the overconvergent tangent gerbe by {−1}; it should be {1}, as in its part (3), its proof and the square (6.2.2); affects nothing.
- **Misprint** in ALRS at Theorem 6.5.8(3), printed page 164: the source applies the upper shriek to the structure sheaf of the twistor stack of Y; it should be that of X, as at the end of its proof; affects nothing.

## For the human reviewers

- **Scope.** Layer 0 (Gestalten) is owned here because no roadmap owns it; the design's repair report had called a separate Gestalten roadmap a board decision. `plan.json` still lists the two gaps with supplier `none` (R08).
- **Scope.** The main sources are not refereed: ALRS (preprint 2026, author page, 378 of 585 locators), Gest (lecture notes, author page), Sch24 (author page), ABLB and RCSolid (arXiv 2025–2026).
- **Licence.** ALRS, Gest and Sch24 were read from an author page with no stated licence (`sources.toml`); the README restates their results with locators and copies no passage.
- **Scope.** At subsection level, Layers 7–12 follow ALRS §§3.3–6.7 closely (pairs listed under Arrangement); at layer level the mapping is not one to one, so it is not raised as a finding.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "61666d4c52d2232c64a38114afc72f6c5dace9e5", "job": "RT-RationalAnalyticPrismatization~1a", "model": "fable", "worker": "chris-x82"} -->
