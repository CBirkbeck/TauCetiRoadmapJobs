<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6903936657 -->
Review (claude) of c876b4f

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) The module docstring defines K_D(n) by a formula that fails at n = 0

   **Location.** `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean:14–15`: "`p` acts trivially on `JL(M)` and `JL(M)` is trivial on `K_D(n) = 1 + ϖ_D^n O_D`".

   **Claim.** For every level n of the roadmap (n ≥ 0), K_D(n) = 1 + ϖ_D^n O_D.

   **Witness.** `README.md:45`: "Put K_D(0) = O_D^× and K_D(n) = 1+ϖ_D^nO_D for n ≥ 1"; `README.md:181` (§0.1, Checks): "At n = 0, 1+O_D contains 0 = 1+(−1) and is not a subgroup of Ǧ". The docstring's own Steinberg clause is used at n = 0 (`README.md:1114`).

   **Exact repair.** Write "`JL(M)` is trivial on `K_D(n)`, where `K_D(0) = O_D^×` and `K_D(n) = 1 + ϖ_D^n O_D` for `n ≥ 1`", and rewrap the paragraph to the file's line width.

   **Repair tested.** At n = 0 the repaired text gives the group O_D^×; `δ∘Nrd` is trivial on it exactly when δ is unramified, and with δ(p)² = 1 this leaves the two characters δ(p) = ±1, the two summands of `H¹_ét` of the two copies of Ω. A scratch copy of `Suggested.lean` with the change elaborates with exit 0 and no output.

2. **F02** (P3) §4.10: the third Check computes nothing and asserts an unsupported failure

   **Location.** `README.md:773`: "(c) fails without finite length or admissibility hypotheses on Π; they are part of the statement."

   **Claim.** Statement (c) is false when either hypothesis is dropped.

   **Witness.** No instance is given, here or in the source: CDN23 line 2396 proves (c) by one citation and says nothing about its failure. The bullet would read the same beside a wrong definition of the bounded vectors, so §4.10 has two discriminating Checks.

   **Exact repair.** Replace the bullet by:

   "- For Π = St^cont, Π^an = St^an (§4.2). The functional ℓ(f) = f′(0), the derivative at 0 in the coordinate z, kills the constants and is continuous on St^an, so ℓ ∈ (St^an)′_b. For g = diag(pᵐ,1), (gℓ)(f) is the derivative at 0 of f(pᵐz), that is pᵐℓ(f); the orbit of ℓ contains pᵐℓ for every m ∈ ℤ and is unbounded as m → −∞, so ℓ is not G-bounded. Accordingly ℓ is not in (St^cont)*: the function equal to p⁻ᵐz on p²ᵐℤ_p and to 0 elsewhere has sup norm p⁻ᵐ → 0, while ℓ takes on it the value p⁻ᵐ, of absolute value pᵐ → ∞. The measure δ₁ − δ₀ is G-bounded. Taking all of (Π^an)′_b in (c) would include ℓ."

   **Repair tested.** With (gℓ)(f) = ℓ(g⁻¹f) and (g⁻¹f)(z) = f(gz) = f(pᵐz): the derivative at 0 is pᵐf′(0). On p²ᵐℤ_p, |p⁻ᵐz| ≤ pᵐ·p⁻²ᵐ = p⁻ᵐ. Both sides of (c) exclude ℓ and contain δ₁ − δ₀, as (c) requires.

3. **F03** (P3) §2.3 cites Colmez's Remarque 0.2(ii) for a statement it prints without the twist

   **Location.** `README.md:436`: "By COLMEZ19POIDS Remarque 0.2(ii) (lines 161–166) and Théorème 0.6(iii) at k = 1 (line 234), Π(V)^an is an extension of Π(M,−1)⊗det by LL_p(M) = π".

   **Claim.** Both locators state the extension with quotient Π(M,−1)⊗det.

   **Witness.** COLMEZ19POIDS line 163 gives the quotient as Π(M,−k), with no twist; line 234 gives Π(M,−k)⊗x^k. For trivial central character and k = 1 the centre acts on Π(M,−1) by x⁻² (value p⁻² at p) and on Π(V)^an by 1. The corrections E1–E24 do not record it.

   **Exact repair.**

   - `README.md:436`: write "By COLMEZ19POIDS Théorème 0.6(iii) at k = 1 (line 234), Π(V)^an is an extension of Π(M,−1)⊗det by LL_p(M) = π when V has weights {0,1}; Remarque 0.2(ii) (lines 161–166) states this without the twist (source correction E25)."
   - Add to *Source corrections*: "**E25** (misprint, COLMEZ19POIDS, Remarque 0.2(ii), lines 161–166; affects nothing). For Δ de Rham, nontrianguline, of weights 0 and k ≥ 1, Π(Δ) is printed as an extension of Π(M,−k) by LL_p(M)⊗Symᵏ⁻¹. The quotient is Π(M,−k)⊗x^k, as in Théorème 0.6(iii) (line 234): the centre acts by x^kω on Π(Δ) and on LL_p(M)⊗Symᵏ⁻¹, and by x⁻ᵏω on Π(M,−k). §2.3."

   **Repair tested.** From Théorème 0.6(ii), Π(M,k)′⊗x^kω lies in a module with central character x^kω, so Π(M,k) has central character x^kω and Π(M,−k)⊗x^k has x⁻ᵏω·x²ᵏ = x^kω, that of Π(Δ_(k,ℒ)). The check of `README.md:459` (x⁻²·x² = 1) agrees.

Three findings, all P3, none blocking. The six findings of round 8 are repaired and the repaired passages hold under the adversarial pass. What remains: one formula the last repair wrote into the module docstring is wrong at level 0; one Check of §4.10 asserts a failure without computing anything; and §2.3 cites a remark of Colmez for a statement the remark prints without its twist, with no entry in the source corrections. No replanning is needed.

## Previous findings checked first

| Round 8 finding | Repaired passage | Status |
|---|---|---|
| F01 (P2) docstring without M ∈ ΦNᵖ_n | `Suggested.lean:13–18`: "for a supercuspidal type `M` in `ΦNᵖ_n` … when `V = δ` is a character with `Sp ⊗ δ` in `ΦNᵖ_n` … and `0` otherwise"; `:27` "types `M` in `ΦNᵖ_n`"; `README.md:5` "for a supercuspidal type M of level at most n with p acting trivially on JL(M)". | **Repaired**; the added definition of K_D(n) is R01. |
| F02 (P2) the two H⁰ of §4.9 | `README.md:746`: "The two H⁰ differ, since π₀(M_(n,C)) is infinite … The first term vanishes in every case"; new Check `:753`. | **Repaired.** Recomputed (table). |
| F03 (P3) "the route follows" | `README.md:454` "The route (COLMEZ19POIDS lines 244–260):"; `:485`, `:503`, `:511` likewise. | **Repaired.** No line matches "route follows". |
| F04 (P3) page citation of CDN23 | `README.md:1063`: "(CDN23, Théorème 5.24(i) and its proof, lines 2779–2836)". | **Repaired.** |
| F05 (P3) range of Exemple 6.5 | `README.md:268`: "(DLB17, Exemple 6.5, lines 1288–1299, and Exemple 6.6 with Définition 6.7, lines 1335–1345)". | **Repaired.** DLB17 lines 1288, 1296, 1299, 1335, 1338 read. |
| F06 (P3) Layer 4 dependencies | `README.md:865`: "§§0.3, 0.4, 6.2, 6.5, 6.9, 7.1–7.3 and 7.5". | **Repaired.** |

The pattern repairs of the fix round (the hypotheses added to the docstring bullets on §§3.3, 7.2, 7.4 and 7.6, and the phrase of §0.2) were read against their README targets and agree with them. Repaired patterns searched in the rest of the package: a headline stated without its level or sector condition (none left); a locator range that misses a named item (none in the sample); a citation of a source for a silently corrected statement (R03).

## Verified sound

### Coverage, principles, shape

All 1284 lines of the README, the Lean file, the manifest and the metadata were read. Eight layers, each named by its mathematics and ending with Examples and Dependencies. The Summary says where the base roadmap stops, and the base roadmap's Scope (its line 24 at its open head) names this roadmap as owner of the discharge of the hypotheses of its §6.9 and of the extension to the p-central sectors. No algorithm, `set_option`, sorry'd data, pull-request number, date, HTML anchor, machine path or LaTeX delimiter in the README, the Lean file or the manifest. No maintainer notes were given. No suspicious instruction was met in any text read.

### Seeded source sample

No locator is flagged unverified by the author. The five manifest texts were read from the cache; nothing was fetched and the manifest is unchanged.

| Target | Text opened | Checked |
|---|---|---|
| 0.4 | DLB17 lines 186–192, 228–236; CDN20 lines 238–252, 915–935; CDN23 lines 2438–2448 | M_dR(π); Théorème 1.4 with M*_dR and ℒ^⊥; D_pst(V)[1]; ℒ⁻¹ = M*_dR/ℒ^⊥; footnote 30. |
| 1.1 | DLB17 lines 1284–1299, 1333–1345 | Fil⁰ form of D⁺_dif,n, N⁺_dif,n = L_n[[t]]⊗D_dR, Définition 6.7. |
| 1.5 | DLB17 lines 1440–1465, 1466–1543 | Théorème 7.3 with the general weights and the Casimir; §7.3 for any absolutely irreducible two-dimensional V; Définition 7.4; Remarque 7.5; Proposition 7.6. No hypothesis on p in the source. |
| 2.2 | DLB17 lines 1944–1984 | Proposition 9.6(a), Théorème 9.7, Lemme 9.8; the proof gives the one-sided identity (E7). |
| 2.4 | COLMEZ19POIDS lines 150–180, 203–272 | Remarque 0.2, Théorème 0.3(ii), the modules Δ_(k,ℒ), Théorèmes 0.6 and 0.8 with (a−c∂)^k, Remarque 0.7. The twist of Remarque 0.2(ii) is R03. |
| 3.1 | DLB17 lines 639–668, 755–790, 800–808, 940–948, 978–984, 997–1010, 1060–1076, 1117–1124, 1182–1210, 1862–1866 | Proposition 3.1, the covering U_i and G_i, O(k), Théorème 3.2, Lemme 3.5(a)–(c), Proposition 3.6, Théorèmes 4.1, 5.1, 5.4, 5.5, 5.7, 8.8, footnote 29, the twist set aside at line 1198 (E3). |
| 3.3 | DLB17 lines 159–164, 2708–2782; CDN20 lines 266–272, 343–356, 950–954, 1759–1764, 1872–1878; CDN23 lines 2438–2448 | Remarque 1.3(a) on the central character; proof of Théorème 1.4; Remarque 11.13 with its two forms (E10) and footnote 53; Théorème 0.4; Propositions 0.9, 2.9, 5.2, 5.7. |
| 4.1 | CDN20 lines 321–330, 747–766, 809–821; CDN23 lines 2501–2514 | Théorème 0.8, the L⊗F-rational O[M] and Ω¹[M], Corollaire 2.1, Remarque 2.3, the fixed-level diagram. |
| 4.7 | CDN20 lines 915–964 | W′, ℒ⁻¹, W; Proposition 2.9 proved by one citation (E21); Proposition 2.10. |
| 4.8 | CDN20 lines 1009–1019; CDN23 lines 2378–2380 | bounded sets with one bound for each seminorm; G-bounded vectors. |
| 4.9 | CDN20 lines 1020–1032, 2247–2253; CDN23 lines 2417–2422, 2791–2796, 2825–2827 | Proposition 2.12, Remarque A.2, Proposition 5.6, the vanishing of bounded functions, footnote 31. |
| 4.10 | CDN23 lines 2381–2396; CDN20 lines 1076–1084 | Lemme 5.3(a)–(c) with its hypotheses; Corollaire 2.13. |
| 5.1 | CDN23 lines 2627–2664, 2689–2700, 1062–1068, 1260–1272, 1774–1778, 1793–1797 | the definitions with n fixed, Proposition 5.16 and its proof, Corollaire 5.17, Remarque 5.20, Théorème 2.1, the hypothesis p > 2. |
| 7.2 | DLB17 lines 2718–2725; COLMEZ19POIDS lines 310–340 | the row with (u⁺)ᵏ⁺¹ and detᵏ⁺¹; Conjecture 0.10; Remarque 0.11; the printed k-th derivative (E22). |
| 7.5 | DLB17 lines 444–448, 2785–2800 | Théorème 1.10 and its proof, which applies Théorème 1.2 to every nontrivial type (E2, E19). |

Further locators opened: DLB17 lines 100–118, 150–158, 430–443; CDN20 lines 98–109, 128–134; CDN23 lines 91–95, 119–125, 176–184, 218–230, 2337–2371, 2401–2416, 2463–2475, 2539–2557, 2604–2626, 2786–2788, 2822–2824. Each carries what the README cites it for.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Docstring §4.14, K_D(n) | n = 0; n = 1 | 1+O_D ∋ 0, not a group; README has K_D(0) = O_D^×; 1+ϖ_DO_D of index p²−1 in O_D^× | R01 |
| Docstring and §4.14, Steinberg branch | n = 0; aI₂ and a ∈ Ǧ | δ unramified with δ(p) = ±1: two characters; centre: δ(a²)⁻¹ on (St^cont⊗δ_G)*, δ(a²) on δ∘Nrd, product 1 | holds (headline) |
| §4.14 supercuspidal branch | twist χ(p) = 1+p; centre | JL(M)(p) = (1+p)² ≠ 1 gives 0; ζ⁻¹ on Π(V)*, ζ on JL(M), product 1 | holds (headline) |
| §4.9 Hochschild–Serre | M_(0,C), a_h = p^(−|h|); a_h = 1 | f_(h+2) = f_h+a_h from f_0 = f_1 = 0 is a finite sum: solvable in ∏_h L; for a_h = 1, f_h ∈ ℤ, |f_h| ≤ 1; f = p^(−|h|) ∈ ∏_h L, ∉ L⊗∏_h O_L | holds |
| §4.9 bounded functions | z on Ω | u(b)z = z−b, sup over b unbounded on a vertex affinoid | holds |
| §4.10(c) | Π = St^cont, ℓ = f ↦ f′(0); δ₁−δ₀ | diag(pᵐ,1)ℓ = pᵐℓ, unbounded; sup norm p⁻ᵐ against value of absolute value pᵐ; orbit of δ₁−δ₀ of norm 1 | statement holds; Check is R02 |
| §4.8 | trivial action; n·x = pⁿx on ℚ_p; seminorms i·p_i | orbit a point; |pⁿx| → ∞ as n → −∞; bounds i depend on i | holds |
| §4.12 (headline) | Π = Π_(M,ℒ) | Hom(Π*, (Π^an_ℒ)′) = L and Hom(Π*, π′) = L give ≤ 2; the sequence of ℒ′ gives 0+1; image in ℒ⊗π′ | dimension 1, the line ℒ |
| §4.13 (headline) | kernel | X⁺_st(M) ∩ (C⊗ℒ) = V_(M,ℒ), dimension 2 against 1 in §4.12 | holds |
| §4.7 | e ↦ ae; ℒ ≠ ℒ′ | a·a⁻¹ = 1; W′_ℒ ∩ W′_ℒ′ = preimage of 0 = d(O[M]^(G_ℚ_p)) | holds |
| §4.1 | n = 0; slope 0 | Ǧ/O_D^× ≅ ℤ abelian: no supercuspidal of level 0; (B⁺_cris)^(φ=1) ≠ 0 at slope 0 | holds |
| §0.4(c) | ℒ = Le₁ | v ↦ (w ↦ v∧w) sends e₁ to the functional killing e₁: Le₂*⊗∧² = ℒ^⊥⊗∧² | holds |
| §0.2 decomposition | irreducibles of Ǧ/(p^ℤK_D(n)) | dimension 1: χ∘Nrd = JL(Sp⊗χ); dimension ≥ 2: JL of a supercuspidal; all in ΦNᵖ_n | holds |
| §1.1 | jumps (−1,0); (0,1); (−k,0) | tN⁺+L_n[[t]]ℒ; N⁺+t⁻¹L_n[[t]]ℒ ⊄ N⁺; t^kN⁺+L_n[[t]]ℒ | holds |
| §1.3 third API bullet | m ≥ −v_p(b), N ≥ m+n; the example φ, b = p⁻¹ | c = pᵐb ∈ ℤ_p; S(1−u(c₀)) = (1−u(p^N))·Σ_(j<c₀)u(j); 1−u(p^Nc₁) ∈ (u(p^N)−1)·(…); Σ_(i<p²) ε(ix) = p·Σ_(i<p) ζ_p^(iu) = 0 | holds |
| §1.5 (sampled) | relations; weights (0,1), (1,2); Sen X²−c | [a⁺,u⁺] = t; [u⁺,u⁻] = 2∇−k+1 = a⁺−a⁻; Casimir (k²−4ab−1)/2 = ((a−b)²−1)/2: 0, 0, (4c−1)/2; a⁺+a⁻ = k−1 | holds |
| §1.2 Check | tx | (∇−1)(tx) = t∇x = t²∂x | holds |
| §2.2 (sampled) | w; u(b); diag(a,1); O(Ω) | w: −∂²u⁺ = u⁻; ∂−b; a⁻¹·a²u⁺ = au⁺; (g∂g⁻¹f)(z) = (dz−b)/(a−cz)·f(z) | holds |
| §2.4 (headline, sampled) | central characters; k = 1, 2 | Π(M,k): x^kω; Π(M,−k)⊗x^k: x^kω; ω = x⁻¹ for trivial centre; det Δ_(2,ℒ)(p) = p, δ_2(p)² = p⁻¹ | holds; the remark is R03 |
| §3.1 Lie action (headline, sampled) | O(k); duals; Ω¹ = O(2)⊗det | a⁺ = −zf′−kf = (u⁺∂+1−k)f; u⁻ = z²f′+kzf; on O′: ∂u⁺−1; on (Ω¹)′: ∂u⁺, −∂u⁺, −u⁺∂²−2∂ = −∂²u⁺ | holds |
| §3.1 cocycle | g, g′ | (a−cz)(a′−c′g⁻¹z) = (aa′+bc′)−(ca′+dc′)z | action |
| §3.1 Checks | u(p⁻¹); f = (1,−1) | (p 1; 0 p): elementary divisors 1, p²; diag(p,1)f = −f | holds |
| §3.3 (headline, sampled) | A = diag(1,2); A fixing three lines; p = 7, ω | L(e₁+e₂) ↦ L(e₁+2e₂); α = β; squares of characters of μ₆ have order dividing 3 | holds |
| Supplier contract, p-valuation on G_i | p odd, i ≥ 1; p = 2, i ≥ 2 | ω([g,h]) ≥ ω(g)+ω(h)+i−1, resp. +i−2; ω ≥ 1 > 1/(p−1), resp. 2 > 1; ω > p/(p−1) forces G_(i+1); 1+1 > 3/2, 2+2 > 2 | (HYP) holds |
| §5.1 (sampled) | p = 5, n = 0, μ_j = δ_(5^j)−δ₀ | pairing 1 with the indicator of 5^jℤ_5^×, 0 for l ≠ j; u(5^j)(δ₀−δ_∞)−(δ₀−δ_∞) = μ_j ∉ 5H | holds |
| §5.4 Check | diag(5,1), μ = δ₀−δ_∞ | gμ = μ; g(μ,0) = (0,μ) | holds |
| §6.3 | rank-one idempotent; saturation | trace 1 on V, 0 on W; End = A, F⊗H = Hom over F | holds |
| §6.6 (headline) | A = L⟨T⟩, T = 0; n = 0 | Ǎ = bounded sequences, left shift: Ǎ/TǍ = 0, Ǎ[T] = L·ev₀; two Steinberg summands against two copies of Ω | holds |
| §7.1 | aI₂ | a⁻ᵏ | holds |
| §7.2 (headline, sampled) | centre; k = 1, a = p; duals | middle a⁻ᵏ⁻²a²ᵏ⁺² = a^k; O(s)^ρ: a⁻ˢ = x^(2−s)·x⁻² from Π(M,s−1)′⊗det⁻¹; p⁻³p⁴ = p; preimage of ℒ^⊥ = annihilator of ℒ⊗(π⊗Sym^k) | holds |
| §7.3 | p = 2, 3 | Y^(p−1)+W^(p−1) = ∏(Y−ζW), ζ^(p−1) = −1; 2(p−1) divides p²−1 for odd p | holds |
| §7.4 (headline) | trivial representation | H¹_e = 0, H¹_f of dimension 1 | holds |
| §7.5 (headline, sampled) | f = (1,−1) over ℚ_p² | primitives (z^j/j!, −z^j/j!); not a pullback from Ω | holds |
| §7.6 (headline) | line ℒ | total dimension 2, F⁰ a line | holds |
| Contract, CompletedCohomology §6.3 | irreducible WD, crystabelline | inertia through an abelian quotient gives Frobenius-invariant characters, so WD reducible | "equivalently" holds |

Sections without a row here keep the computed rows of the round 8 table (§§0.3, 1.6, 1.7, 4.5, 4.14 routes, 5.2, 6.1, 6.2, 6.4); none of their text changed.

### Pinned libraries, Lean, headlines

Pins: Mathlib `1b1ccf4b08`, Tau Ceti `2fd255d997`. Opened at the pin: `Bornology.IsVonNBounded` (`Mathlib/Analysis/LocallyConvex/Bounded.lean:61`), `NormedSpace.image_isVonNBounded_iff` (`:495`, namespace at `:454`), `WithSeminorms.isVonNBounded_iff_seminorm_bounded` and its image form (`Mathlib/Analysis/LocallyConvex/WithSeminorms.lean:659`, `:679`), `WithSeminorms.banach_steinhaus` (`Mathlib/Analysis/LocallyConvex/Barrelled.lean:164`), `Representation` (`Mathlib/RepresentationTheory/Basic.lean:48`), `Module.Basis` (`Mathlib/LinearAlgebra/Basis/Defs.lean:89`), `Module.finrank` (`Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`), `BDeRhamPlus` and `BDeRham` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`, `:88`). The pinned Tau Ceti has analytic stages and the untopologised `LocallyAnalytic` of functions on ℤ_p (`TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45`) and p-adic measures; it has no distribution algebra, no locally analytic or Banach representation, no rigid space and no Robba ring, as the README and the docstring say.

`lake env lean` on the package's `Suggested.lean`, from the content checkout: exit 0, no output. One import, `import Mathlib`; one module docstring; an empty namespace. The file declares nothing, so there is no `sorry`, and the one-tactic probe and the `#check @name` comparison have nothing to run on; there is no padding. Headlines of the Summary and Scope against the docstring: §4.14, §§4.12–4.13, §6.6, §3.3, §3.1, §§2.3–2.4, §§7.2–7.3, §7.4, §7.5 and §7.6 are each named with the carriers they lack, and none is statable at the pins. §4.3 and §6.3 are statable but are auxiliary lemmas, not headlines. The only backticked names of the README are eleven Mathlib names and `Suggested.lean`; none is presented as this roadmap's own.

### Suppliers, gaps, merge order

Every cited section was resolved at the supplier's current head (main for SmoothRepresentationsOfLocalGroups, the open head otherwise), by its heading: PadicLocalLanglandsForGL2Qp §§0.1, 0.2, 1.1–1.4, 1.6, 1.7, 2.5, 2.7, 3.1, 3.3, 3.5, 3.6, 3.8, 3.11, 4.1, 4.1k, 4.2, 4.2a, 4.9, 4.11, 5.1–5.6, 5.8, 5.12, 6.7, 6.9; EndoscopicTransferAndUnitaryTraceComparison §§12.4, 12.5, 12.7, 12.14, 12.19; LocallyAnalyticDistributions §§0.0, 0.2, 0.3; LocallyAnalyticDistributionsPartII §§1.5, 2.2, 2.3; ProetaleCohomologyOfPAdicCurvesAndTowers §§0.3, 0.4, 6.2, 6.5, 6.9, 7.1–7.5; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; LocallyAnalyticRepresentationsOfLocalGroups §§0.3, 0.5; PhiGammaModulesAndIwasawaCohomology §§2.4, 5.4, 5.6a, 5.7; PadicHodgeTheory §§3.3, 4.4, 5.1–5.4, 8.1; PadicDifferentialEquationsAndRigidCohomology §§RD.1.73, RD.2.43; GL2AutomorphicRepresentationsAndTransfer R16.1.8, R16.3, R17.3; CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9, 6.3, 6.4; HilbertModularVarietiesAndShimuraCurves §§R18.3.29, R18.4.24a, R18.4.25, R18.5.3, R18.5.16, R18.5.21; LocalGaloisDeformationRings §3.8; SmoothRepresentationsOfLocalGroups SR.0, SR.2, SR.3.2.

Statements read in full and compared this round: base §4.9 (the compactly supported P-finite space, p ≥ 5), §5.8 (the universal family at every prime, fibre Π(ρ_x(ε)), central character det(ρ^univ)ε), §5.12 and the Scope sentence on this roadmap; ProetaleCohomology §§7.1–7.5, whose sector rule (ω∘det)⊗(ω∘Nrd)⁻¹⊗(ω∘rec) with arithmetic reciprocity gives, for the Ǧ-character δ∘Nrd, the G-character δ⁻¹∘det and the Galois character δ in the geometric normalisation, as §§4.2 and 4.14 have; ScholzeFunctor §5.4; CompletedCohomology §§6.3 and 6.4; LocallyAnalyticDistributions §0.2 (strict countable inverse limits) and §0.3 (strong duality); LocallyAnalyticDistributionsPartII §§1.5, 2.2 and 2.3 with (HYP). Each says what the README assumes of it.

The four declared gaps have a named supplier and section, the same slug in `design/plan.json` and in the README, and one precise request each. None is provided at the suppliers' heads: CompletedCohomology §6.4 gives one form, SR.3.2 is stated for complex coefficients, PadicHodgeTheory §4.4 has no Banach-coefficient comparison, the base §6.9 has no fixed-radius statement. An acceptance after repair stays conditional on them.

Dependency check, full output: `depcheck: 234 roadmaps, 2241 edges, 0 problem(s)` (exit 0; no UPWARD, CYCLE or `moved:` line). `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

Overlaps: no other open pull request changes this roadmap, no cited id is dropped by a revision, none is defined only by a revision. Ownership was searched by object in the open heads and on main (the Breuil–Strauch comparison, infinitely primitivable functions, the P-finite Kirillov model, the type sets ΦNᵖ, G-bounded vectors, Teitelbaum's model, Colmez's weight change): the only roadmaps that state these are the base roadmap and ProetaleCohomologyOfPAdicCurvesAndTowers, each within the division the README records, and the latter lists this roadmap as a consumer of its §§7.1–7.5 with §4.9 here adding the vanishing of bounded functions.

Overlap check: read PadicLocalLanglandsForGL2Qp, ProetaleCohomologyOfPAdicCurvesAndTowers, LocallyAnalyticRepresentationsOfLocalGroups, CompletedCohomologyAndLocalGlobalCompatibility, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, CrystallineCohomology (main, no shared object); the comparison at trivial central character and its analytic criteria: PadicLocalLanglandsForGL2Qp §6.9; the discharge of its global hypotheses and the p-central sectors: this roadmap §§3.1 and 3.3 (the base says so); the multiplicity diagram and its integral form at infinite level: ProetaleCohomologyOfPAdicCurvesAndTowers §7.5; Hyodo–Kato and de Rham multiplicities: its §7.4; mod p finite length: ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §5.4; the supercuspidal locally algebraic vectors: CompletedCohomologyAndLocalGlobalCompatibility §6.3; nothing else shared.

### Copyright and arrangement

Passages set beside the source at its locator: §0.4 (DLB17 228–236; CDN20 917–933), §1.3 (DLB17 1473–1519), §1.5 (DLB17 1460–1465, 1535–1543), §2.2 (DLB17 1946–1984), §2.4 (COLMEZ19POIDS 215–271), §3.1 local analyticity and smoothness (DLB17 647–664, 783–787), §3.1 route (a) (DLB17 1184–1209), §3.3(iii) (DLB17 2753–2781), §4.1 (CDN23 2501–2514), §4.7 (CDN20 917–954), §4.8 (CDN20 1012–1019), §4.9 (CDN23 2791–2796), §4.10 (CDN23 2381–2396), §5.1 (CDN23 2627–2646), §7.2 (DLB17 2718–2725; COLMEZ19POIDS 310–340), §7.5 (DLB17 2790–2800), and the docstring bullet on §4.14 (CDN23 2357–2365). The sources are French; no sentence is a translation of a source sentence. The closest are the three-clause Hochschild–Serre step of §5.1 (CDN23 2640–2644; longest corresponding run about a dozen words, each clause forced by the argument) and the two steps of §3.1 route (a) (DLB17 1201–1209), which the README gives with other reasons and a corrected claim. Statements and formulas are forced by the mathematics. No table, figure or list is taken over.

DLB17 has the largest share of locators, 89 of 197 before the corrections and references. Its chapters are 3 covers and bundles, 4 uniformisation and de Rham cohomology, 5 the equivariant map, 6 differential equations, 7 the Kirillov model, 8 Π(π,0), 9 the O(Ω)-module, 10 surjectivity, 11 injectivity, 12 complements. The layers are not that sequence: Layer 1 draws on chapters 6–7 and Layer 2 on 8–9 with Colmez's paper, in the order their *Needs* lines force (§1.5 needs §§1.3–1.4, §1.7 needs §§1.5–1.6, §2.1 needs §§1.1, 1.2, 1.6, 1.7); Layer 3 then takes chapters 3, 4, 5 and part of 11; chapters 9–10 belong to the base roadmap; Layer 7 takes two remarks of chapter 11 and chapter 12. Layers 4–6 rest on CDN20 and CDN23; Layer 5 (CDN23 §5.3.1–5.3.2) comes before Layer 6 (CDN23 §5.2 and Théorème 5.24), the reverse of the source, and the run §§4.4–4.11 beside CDN20 §2.1.2–§2.2 is in the order the *Needs* lines force (§4.7 needs §§4.5–4.6, §4.10 needs §§4.7–4.9, §4.11 needs §§4.3, 4.5, 4.6, 4.10), with §§4.1–4.3 and 4.12–4.14 from elsewhere.

Source independence: 17 passages compared with 4 sources (TEI90 was not reopened this round), none shared; largest share DLB17, 89 of 197 locators; contents compared with DLB17: independent.

## Not verifiable

- The four supplier gaps are contracts, not theorems of any text read; their proofs are not certified here.
- Line locators are those of the cached copies (arXiv v2 for DLB17, the authors' copies for CDN20 and COLMEZ19POIDS, the HAL copy for CDN23, Numdam for TEI90); journal pagination was not compared.
- COLMEZ19POIDS Conjecture 0.10(i) prints a twist by x⁻² and multiplicities over JL(M)*, in a right-action convention, where §7.2 has det⁻¹ and multiplicities over JL(M); the two conventions were not reconciled from the text. The README's form was checked on central characters (table, §7.2).
- E4 (DLB17 Proposition 7.7(b)) depends on the source's normalisation of N⁺_dif of the Tate dual in weights {0,k}; the README's own statement was recomputed in round 8 and only k = 1 is used.
- E22 and R03 rest on the cached extraction of COLMEZ19POIDS (lines 163, 234, 321, 333); the PDF itself was not viewed.
- TEI90 and the locators of §§1.6–1.7, 4.2, 4.3, 4.6, 5.2–5.6, 6.2–6.5, 7.3, 7.6 and 7.7 were not reopened this round; they carry rows in the round 8 sample or its list of opened lines.

## Source issues

- **Misprint** in COLMEZ19POIDS at Remarque 0.2(ii), printed p. 4: the source says the representation of a de Rham nontrianguline module of weights 0 and k is an extension of Π(M,−k) by the locally algebraic part; it should be an extension of Π(M,−k) twisted by x^k, as in its Théorème 0.6(iii); affects nothing.
- **Misprint** in COLMEZ19POIDS at the paragraph before Conjecture 0.10 and Remarque 0.11(i), printed p. 8: the source says the operator from weight −k to weight k+2 is the k-th derivative, acting as u⁺; it should be the (k+1)-st derivative, acting as the (k+1)-st power of u⁺; affects nothing.
- **Gap** in CDN23 at the proof of Lemme 5.12, printed pp. 66–67: the source says irreducibility over the fraction field and equal traces give an isomorphism there; it should first establish absolute irreducibility of the generic fibres; affects the proof.
- **Misprint** in CDN23 at the proof of Théorème 5.10, printed p. 66: the source says the dual of the multiplicity space contains an absolutely irreducible representation; it should take an absolutely irreducible quotient, whose dual embeds; affects nothing.
- **Error** in CDN23 at Proposition 5.7 and Théorème 5.8, printed pp. 63–64: the source says the condition on the p-central quotient is level at most n; it should be level at most n with p acting trivially on the Jacquet–Langlands transfer; affects a stated result.
- **Misprint** in CDN23 at Théorème 5.15, printed p. 68: the source says the dual coefficient module is the dual of itself; it should be the continuous L-dual of the type ring; affects nothing.
- **Gap** in CDN20 at Proposition 2.9, printed p. 24: the source says the line property of the Hyodo–Kato identification is the cited theorem of Dospinescu–Le Bras; it should prove that the cited isomorphism is the Hyodo–Kato one, for every central character; affects the proof.
- **Gap** in DLB17 at Remarque 11.13, printed pp. 65–66: the source says agreement for two period lines gives the comparison for every line; it should use three distinct lines or fix the relative scale of the two classes; affects the proof.
- **Error** in DLB17 at Théorème 1.10, printed p. 11: the source says an infinitely primitivable function on a cover lies in the functions of the half-plane; it should allow locally constant functions on the components as coefficients; affects a stated result.
- **Error** in DLB17 at the introduction, printed p. 3 (DLB17 lines 114–116): the source says the level-zero space over ℚ_p is two copies of the half-plane; it should say so only after the unramified quadratic base change; affects nothing.
- **Gap** in DLB17 at the proof of Théorème 5.1, printed p. 30 (DLB17 lines 1198–1204): the source says u⁺ kills no element of the ρ-part of the differentials and sets the unramified twist aside; it should use that locally constant differentials have zero ρ-part and remove the twist by a global character; affects the proof.

## For the human reviewers

- **Scope.** The Galois-socle headline (§4.14) rests on gap:three-period-line-globalisation (`README.md:146`). No cited source states three such forms; DLB17 lines 2773–2775 assert a second form only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c876b4f0fb8ab8aca5bc4d7aa84361718daba77b", "job": "REV-PKG-PadicLocalLanglandsForGL2QpPartII~9", "model": "fable", "worker": "chris-x89"} -->
