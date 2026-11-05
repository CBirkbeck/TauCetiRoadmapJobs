<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1502#issuecomment-6417606557 -->
Red team round 1 pass b (claude) of 959da23

Verdict: needs changes

1. **F01** (P2) Smooth relative Poincaré duality is attributed to a supplier section that states only curve duality

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:83` ("§9.6 supplies smooth Poincaré duality with invertible coefficients"), `:696` (smooth principal comparison: "smooth Poincaré duality, Leray and closed-support continuity", *Needs:* "ClassicalAdicEtaleCohomology §§1.1–1.5, 8.3–8.5, 9.6, 10.1–10.4"), `:678` and `:748` (same citation).

   **Claim.** The uniform route's step from `R^j d(f)_! ℤ/n` to `R^j d(f)_* ℤ/n` for the smooth, non-proper map `g : W → B(a,b)` of pure relative dimension `N` is supplied by ClassicalAdicEtaleCohomology §9.6.

   **Witness.** ITO20 line 2009–2010 and line 2038–2040 use Huber's Corollary 7.5.5 for the smooth non-proper adic `g` of pure dimension `N ≥ 0` over an annulus: `R^j g_*(ℤ/n(N)) ≅ (R^{2N−j} g_! ℤ/n)^∨` (also ITO20 line 141). ClassicalAdicEtaleCohomology §9.6 (open head, "Effacement and duality at every valuation rank") states (i) the trace and duality for a smooth separated taut *curve* over `Spa(C,C⁺)` and (ii) for general `d` only the étale-local effacement with trace factorisation; §9.7 states the general-`d` duality for "separated smooth strict Berkovich" maps and explicitly says it is "not asserted here for every arbitrary non-overconvergent adic `G`; each adic application below states the properness/local-coefficient hypotheses", and every adic application it then states is for smooth *proper* `f`. So no cited section states the non-proper adic relative duality the route uses.

   **Repair.** (a) At `README.md:83` replace "§9.6 supplies smooth Poincaré duality with invertible coefficients" by "§9.6 supplies curve duality and the general-dimension local effacement; §9.7 supplies the Berkovich-strict relative duality `Rh_* RHom(G, h^*F(d)[2d]) ≅ RHom(Rh_!G, F)` for separated smooth `h` of pure dimension `d` and its proper adic transports". (b) Declare `gap:huber-smooth-relative-duality` with supplier `ClassicalAdicEtaleCohomology`, section `9.7`, needs: "For a smooth separated quasi-compact morphism `g : W → B(a,b)` of analytic adic spaces of pure relative dimension `N` over an annulus over `Spa(K,O)`, `K` algebraically closed and `n` invertible in `O`, with every `R^i g_! ℤ/n` locally constant constructible, the trace induces `R^j g_*(ℤ/n(N)) ≅ Hom(R^{2N−j} g_! ℤ/n, ℤ/n)` for every `j` (Huber, Corollary 7.5.5)." Add it to the plan's `gaps` list and under the ClassicalAdicEtaleCohomology subsection of "Exact supplier contracts"; cite the gap in the *Needs:* lines at `:678` and `:696` and in the Layer 3 Dependencies at `:748`, replacing "9.6" by "9.6–9.7" there. Tested on the instance that refuted the original: for `g` the identity of an annulus (`N = 0`) the gap statement reads `ℤ/n ≅ Hom(ℤ/n, ℤ/n)`, and for the rank-three direct image of `T ↦ T³` (`N = 0`, `n = 3`) it reads `(ℤ/3)³ ≅ Hom((ℤ/3)³, ℤ/3)`, both true; the curve-only §9.6 statement does not even apply to `N = 0`.

2. **F02** (P3) A Check describes the base-changed scheme wrongly

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:637`: "Over V[π^(1/2)] the scheme splits into two copies of the base and the action is trivial for every n."

   **Claim.** `X ×_V V′` with `V′ = V[π^{1/2}]` is two disjoint copies of `Spec V′`.

   **Witness.** `V′[t]/(t² − π) = V′[t]/((t − √π)(t + √π))` and `(t − √π) − (t + √π) = −2√π` lies in the maximal ideal, so the two factors are not comaximal: the special fibre is `Spec k[t]/(t²)`, one point, and the two branches meet there. Only the generic fibre is two points. The stalk conclusion `(ℤ/n)²` with trivial action is right (the strictly local Milnor fibre is `K̄′ × K̄′`), the scheme description is not. Same instance as the accepting review's F01.

   **Repair.** Replace the quoted clause by "Over V[π^(1/2)] the generic fibre splits into two points (the branches t = ±π^(1/2) meet over the closed point), so the stalk is (ℤ/n)² with trivial action for every n." Tested: the repaired sentence is true on the instance above and the Check's conclusion is unchanged.

3. **F03** (P3) The uniform-reduction *Needs:* line omits the compactification it uses

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:696`: "descend the alteration to some finite stage K(T^(1/p^N)) … and extend it by a proper model … *Needs:* … SchemeAndStackFoundations §§0.9, 0.23a, 4.11, 4.16, 4.19".

   **Claim.** The listed inputs supply the proper model extending the field alteration.

   **Witness.** ITO20 line 1956–1958 obtains that proper surjective model by Nagata's compactification theorem. SchemeAndStackFoundations §0.9 (main, "Limits of schemes, Noetherian approximation and spreading out") supplies finite-presentation models, not compactifications; the package itself names EtaleCohomologyFoundations §G.2 `nagataCompactification` for this very step at `:642` and `:656` but not at `:696`. Same as the accepting review's F02.

   **Repair.** Append "EtaleCohomologyFoundations §G.2 `nagataCompactification` for the proper model over `Spec O[T^(1/p^N)]`" to the *Needs:* line at `:696`. `nagataCompactification` exists on main (`TauCetiRoadmap/EtaleCohomologyFoundations/README.md:105–107`, qcqs base, separated finite type).

4. **F04** (P3) The ITO20 References entry predates the round-3 repair

   **Location.** `packages/DeligneWeightsAndPurityPartII/README.md:931`: "Theorem 1.1 and §1.2, pp. 1–3; Proposition 4.1 and Lemma 4.3, pp. 19–20; … Lemmas 7.1–7.7, pp. 3–4, 33–46. ITO20 line 76, line 99, … line 1774."

   **Claim.** The entry lists the ITO20 locators the roadmap uses.

   **Witness.** §3.4 (`:625–:696`) cites §2.1, Definitions 2.1–2.2 and 2.5, Remark 2.3, Theorem 2.7, §3.1, Proposition 3.1, Theorem 3.3, Definition 3.4, Lemmas 3.5–3.16, Corollary 3.17, Theorem 5.3, Proposition 5.5, Definition 6.1, Theorems 6.2–6.3, Definition 6.5, Propositions 6.6–6.7, Theorem A.6, Proposition A.8 and Lemma A.11, at ITO20 lines 189, 238, 252, 317, 348, 359, 378, 388, 412, 429, 803, 1198, 1299, 1413, 1427, 1439, 1455, 1481, 1502, 1518, 1606, 1662, 2191, 2279, 2338, 2382 and 2391; `sources.toml` records them (locator "pp. 1–54"), the README entry does not. Same as the accepting review's F03.

   **Repair.** Extend the ITO20 bullet at `:931` to the theorem list and line locators recorded in `sources.toml` (adding pp. 5–18, 26–37 and 46–54).

5. **F05** (P3) The sole Lean declaration is a free-carrier linear-algebra lemma, not a headline

   **Location.** `packages/DeligneWeightsAndPurityPartII/Suggested.lean:52–73` (`duality_splitting`), and `README.md:109` ("The sole Lean declaration, `duality_splitting`, states the native perfect-pairing form of §4.4").

   **Claim.** `Suggested.lean` states a headline theorem of the roadmap.

   **Witness.** The statement quantifies over arbitrary `E, G, U, U′, V, V′ : Type*` with a field, a group, four finite-dimensional modules, two perfect pairings and four representations; its conclusion (injectivity, `IsCompl`, stability) is linear algebra on those hypotheses and mentions none of the objects the roadmap defines (local monodromy data, `D_k`, purity, `WMC_ℓ`, tubes, the comparison `f*`). The README itself files the content under "Mathlib's perfect pairings and annihilators own the elementary linear algebra" (`:11`) and §4.4 *Needs:* "no geometric supplier is needed" (`:866`). The theorem is true (dimension count: `dim range a = dim U = dim U′`, `dim ker((q.flip.comp b).flip) = dim V − dim U′`, trivial intersection since `q(a x, b y) = c·p(x,y)` with `c ≠ 0` and `p` perfect; stability of the annihilator from `b` equivariant and `q(ρV g v, ρV′ g v′) = χ(g) q(v,v′)`), but it is the §4.4 target, not an end theorem.

   **Repair.** Delete `duality_splitting` from `Suggested.lean` (the README keeps §4.4 as a target with its Checks) and add to the module docstring the sentence "The equivariant Poincaré splitting (§4.4) is elementary linear algebra on free carriers and is kept as a README target; its geometric application (§4.5) lacks the comparison map." The file then states nothing, which the acceptance-test rules allow. Tested on the instance that motivates the finding: after deletion no backticked Lean name of this roadmap remains in the README except in `:109`, which the repair rewrites to "No Lean declaration is statable at the pins; the headline statements require supplier carriers described in the module docstring."

Head reviewed: `959da23` (the checkout was already at that head; no fetch was needed). Package files read in full: `packages/DeligneWeightsAndPurityPartII/README.md` (936 lines, 30 numbered targets, 39 Check blocks), `packages/DeligneWeightsAndPurityPartII/Suggested.lean` (75 lines, one declaration), `sources.toml`, `metadata.toml`, `design/plan.json` (`gaps` only). No pass-a report exists on the pull request: its first comment is the pass-a job announcement, not a report, and the `reports/` folder holds only the package report and the two repair reports. The accepting review of `959da23` left three non-blocking findings unrepaired at this head; I re-derived each independently and list them below (R02–R04) with my own witnesses, so the repair worker applies them from one list.

One finding is blocking in the sense of P2 (a proof input attributed to a supplier section that does not state it); the other four are P3.

## Verified sound

Counts: 1 Lean declaration read (its elaborated type was not re-elaborated here, no Lean is run in this pass; its binders were compared by reading: all four `FiniteDimensional`, both `IsPerfPair`, `hc`, `hpair`, `ha`, `hb`, `hq` are explicit and no section `variable` exists in the file, so nothing can be lost); 30 numbered targets read, plus the eight bold sub-targets of §3.4; 57 line locators verified against the extractions (SCH12: 2496, 2508, 2511, 2518, 2527, 2543, 2547, 2560, 2564, 2571, 2589, 2592, 2597, 2598, 2601, 2604, 2607, 2612, 2622, 2636, 2652, plus Theorem 1.1 at p. 245 and Theorem 1.15 at p. 251; ITO20: 76, 99, 103, 124, 189, 238, 252, 317, 348, 359, 378, 388, 412, 429, 803, 866, 918, 964, 974, 987, 1003, 1030, 1198, 1299, 1413, 1427, 1439, 1455, 1481, 1502, 1518, 1586, 1606, 1662, 1673, 1738, 1774, 1813, 1846, 1901, 1928, 1973, 2191, 2279, 2338, 2382, 2391; DEL80 1524–1529; DJ96 597–606); 39 Check blocks read and 31 Checks recomputed (table below); 61 supplier citations resolved (every section number and backticked name of ClassicalAdicEtaleCohomology, DeligneWeightsAndPurity, ArithmeticGaloisRepresentations, LefschetzPencilsAndVanishingCycles, FiniteFlatGroupsAndIntegralPadicHodgeTheory, AbelianSchemesAndArithmeticModuli, EtaleDualityAndPerverseSheaves at their open heads; EtaleCohomologyFoundations, PerfectoidSpaces, AdicEtaleGeometry, SchemeAndStackFoundations, AdicSpacesPartII, AdicSpacesPartIII, AnalyticToricGeometry, LocalFieldsRamification on main; AnalyticToricGeometryPartII NT.0–NT.6 in its accepted design, including the automorphism naturality of NT.3 `toricProjection_baseChange`/open-topos and NT.4 projection-cohomology that `README.md:93` relies on); 6 Tau Ceti and 11 Mathlib declarations opened at the pins (`TauCeti.inertiaSubgroup`, `isClosed_inertiaSubgroup`, `IsArithFrobeniusLift`, `inertiaTameCharacter` (Kummer ratio `σ(π^{1/m})/π^{1/m}`), `IsArithFrobeniusLift.smul_eq_pow` (`x ↦ x^q`), `teichmullerLift`; `Field.absoluteGaloisGroup`, `absoluteGaloisGroup.mapOfAlgebra`, `Representation` (an `abbrev` for `G →* V →ₗ[k] V`), `IsNilpotent.exp`, `LinearMap.IsPerfPair`, `LinearMap.IsPerfectCompl`, `Module.End.HasEigenvalue`, `CategoryTheory.Abelian.Ext.comp`, `Ext.mapExactFunctor`, `Ext.mapExactFunctor_comp`, `CategoryTheory.Sheaf.H`, all at the stated files).

Sources: SCH12 Theorem 9.4 (line 2571) is stated for `x ∈ C(𝔽_q)`; the README's closed-point form with `Q = #κ(x)` says so and reduces to it by constant extension (`:411`), which is correct. Theorem 9.6 (line 2589) matches §4.6 word for word in content: local field of characteristic 0, geometrically connected proper smooth `Y`, set-theoretic complete intersection in a projective smooth toric variety. Corollary 8.8 (line 2496) matches §4.1's approximation data including the dense-subfield clause. Lemma 9.8/9.9 and the final paragraph (lines 2622, 2636, 2652) match §§3.5, 4.3, 4.5. Scholze's `NΦ = qΦN` (line 2530) agrees with the Conventions. ITO20 Theorems 1.4/6.10 (lines 124–139, 1586–1605) match the uniform annular target including the order of the two factors of `h` (Kummer covering first, then the finite Galois map) and the `a < b ≤ δ` quantifier; Theorem 4.5 is stated with `K` algebraically closed (ITO20 line 932–933 is the standing hypothesis of §4.3), so §3.4's first paragraph does not narrow it; Theorem 4.9 and Corollary 4.11 match §§3.4, 3.6; Theorem 6.3's `a/b < t² < 1` and Definition 6.1's henselised completed residue field match; Proposition 6.6 and 6.7 match the adapted-coefficient target; Lemma 7.1 and the characteristic-`p` reduction (lines 1950–1969) match the uniform-reduction paragraph, including `f = (f′)^{p^N}` and `T(V(f′),ε) = T(V(f),ε^{p^N})`. DEL80 (1.8.4) at line 1528 is the local monodromy theorem for a punctually pure lisse sheaf; DJ96 Theorem 4.1 and Remark 4.2 (lines 597–606) give the finite constant-field extension with smooth geometrically irreducible source.

Ownership: `roadmaps grep` finds no other owner of "local monodromy datum", "set-theoretic complete intersection", "oc-quasi-constructible", "sliced nearby" or `duality_splitting`; the "weight-monodromy" hits in CrystallineCohomology are the `p`-adic Binda–Kato–Vezzani statement, which `README.md:17` excludes; WeightsInEtaleCohomology (later in the order) states no local monodromy datum or `WMC_ℓ`; ClassicalAdicEtaleCohomologyPartII (open) is about almost-coherent nearby cycles and does not touch Layer 3's objects. The two declared gaps are precise, name their supplier sections (which exist at the open head: §§4.5, 5.2, 8.3, 8.4, 8.2, 11.1), appear with the same slugs in `plan.json` and the README, and ask for nothing a supplier already states (CAEC §5.2/§5.4 build the nearby-cycle topos but not Huber's Theorem 5.7.8 stalk comparison; §§8.2/11.1 state the comparison without automorphism naturality).

Dependency gate, run from the board checkout with the prescribed command: `depcheck: 56 roadmaps, 651 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. DeligneWeightsAndPurityPartII sits at line 180 of the merge order, after every cited supplier (AnalyticToricGeometryPartII at 178, WeightsInEtaleCohomology, named only as a consumer, at 160 is cited for nothing).

Policy: `git diff --stat origin/main...HEAD` touches only `packages/DeligneWeightsAndPurityPartII/`; no `lemma`, no `set_option`, no pull-request numbers or process narrative in README or Lean (the word "repair" at `:744` is mathematical); every numbered target carries a locator; no machine path in any package file; `theorem` only; single `import Mathlib`; no sorry'd data; one module docstring naming each non-statable headline and its missing carrier.

### Adversarial pass (one row per statement; values on both sides)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions string | `Ne₁=e₀, Ne₀=0, Φ=diag(1,q)` | `NΦe₁ = qe₀ = qΦNe₁`; `ΦNΦ⁻¹e₁ = q⁻¹e₀`; grades −1,1 carry eigenvalues 1,q, weights 0,2, centre 1; twist: `q⁻¹,1`, centre −1 | agrees with SCH12 line 2530 |
| §0.1 datum, tame model | `ℤ_ℓ ⋊ ℤ̂`, `n·x = q^{−n}x` | `(0,1)(x,0)(0,−1) = (q⁻¹x,0)`; `Fr = ℤ_ℓ×{−1}` gives `qx`, not `Q⁻¹x` for any `Q ≥ 2`; `Fr = I` forces `(1−Q⁻¹)t = 0` | datum holds; both non-examples fail as stated |
| §0.1 discrete model | `ℤ[1/Q] ⋊ ℤ` | twist holds, `{0}` open in inertia with `t = 0` | excluded by profiniteness only, as stated |
| §0.1 open subgroups | `I₁ ⊆ I` open | `t(I)` nonzero torsion-free, `I/I₁` finite ⇒ `t(I₁) ≠ 0` | holds |
| §0.2 restriction | `ϖ = u(ϖ′)^e`, `k′ = ℚ_p(√p)` | inertia fixes `u^{1/ℓ^n}` in `k^{ur}` (Hensel, `ℓ ≠ p`); `t_k = 2 t_{k′}`; constant of `eD_{k′} → D_{k′}` is `e⁻¹ = 1/2` | holds, also `ℓ = 2` |
| §0.3 restricted datum | `Φ′ = Φ^f τ` | `t(Φ′σΦ′⁻¹) = Q^{−f}t(σ)`; `Q^f ≥ 2` prime to `ℓ`; `H′ = G_{k(ϖ^{1/ℓ^∞})}`: every Kummer ratio 1, `t = 0`; `H′ = G_{k_∞}`: `[k_∞k^{ur}(ϖ^{1/ℓ^n}) : k_∞k^{ur}] = ℓ^n`, image dense in `ℤ_ℓ` | admissibility and both Checks hold |
| §0.4 uniqueness, Frobenius relation | `I₂ = I₁ ∩ Φ⁻¹I₁Φ` | `exp(aN) = exp(aN′)`, `a ≠ 0` ⇒ `N = N′`; `exp(t(σ)ΦNΦ⁻¹) = exp(Q⁻¹t(σ)N)` ⇒ `ΦNΦ⁻¹ = Q⁻¹N` | holds |
| §0.4 lift independence | `A = ρ̄(Φ)`, `F` finite | `(Aτ)^{r|F|} = A^{r|F|}`; `|β|^m = |α|^m` ⇒ equal weights | holds in both directions |
| §0.4 Checks | `ℚ_ℓ ⊕ ℚ_ℓ(−1)`, `N = 0` | eigenvalues 1,q in grade 0, weights 0,2 | not pure, as stated |
| §0.5 non-example | `H′ = G_{k(ϖ^{1/ℓ^∞})}` | `t = 0` on `H′∩I`; Tate string restricted: eigenvalues 1,q on whole space | theorem fails without (b), as stated |
| §0.6 scalar | `D → ℓD`, `ℓ = 2` | `N′ = N/2`, `2·(N/2) = N` | holds |
| §0.7 | `ker N = Ee₀` | `N = 0`, eigenvalue 1, weight 0 ≠ 1 | subrepresentation not pure of weight 1, as stated |
| §0.8 L-factor | `V^I ⊆ ker N ⊆ M_0` | weights on `V^I` ≤ `i`, poles `Re s ≤ i/2` | consequence holds |
| §0.9 ℙ¹ | residue degree `f` | eigenvalues `(1,q) → (1,q^f)`, trace coordinates 1,1 | holds |
| §1.1 Legendre | `λ = 0`, `p` odd | `y² = x²(x−1)`, node, split iff `−1` square; `N ≠ 0`, weights 0,2 | holds; nonsplit sign unramified |
| §2.1 | `O_K/ϖ` | `colim 𝔽_q[X]/(X^{p^n})`, `X ↦ X′^p` = `𝔽_q[T^{1/p^∞}]/(T)`; `k = ℚ₂(√2)`: `ϖ₁` nonzero, `ϖ₁² = 0`; `N(ϖ₁) = −ϖ`, `t♯ = ϖ` | holds |
| §2.2 | `k = ℚ₂`, `ζ₃ ∉ K` (residue field 𝔽₂) | `(β(σ)ζ₃♭)♯ = ζ₃² ≠ ζ₃` | holds |
| §2.3 | `x^{ℓ^n} = 1`, `x♯ = 1` | `x_r^{p^r} = 1`, order divides `gcd(p^r,ℓ^n) = 1`; `ℓ = p`: `μ_{p^n}(C♭) = 1` | holds; non-example holds |
| §2.4 direction | `t = u(ϖ″)^e` | `t_{ℓ,k} = e(t_{ℓ,k″}∘β)` via `(β(σ)x)♯ = σ(x♯)`; constant `e⁻¹`; `k″ = 𝔽_q((t^{1/p}))`: `e = p`, `(1/2)(2N) = N` | holds |
| §2.4 hypothesis from §4.1 | `k₁ ⊆ C♭` finite over `E_n = 𝔽_q(t^{1/p^n})` | `k₁ ⊆ k₁^s E_{n+r}` and `E_{n+r}/E_n` simple purely inseparable ⇒ `k₁ = k₁^s E_{n+r′}`, separable over `E_{n+r′}`; then `L♭` is the completion of `k″^{perf}` | hypothesis holds automatically; no change |
| §3.1 | `Z = V(T), Z′ = V(ϖT), ε = |ϖ|²` | `T(Z′,ε) = {|T| ≤ |ϖ|}`, `T(Z,ε) = {|T| ≤ |ϖ|²}`; `ε ≥ 1`: both unit disc; `∩_ε T(Z,ε)`: continuity of the valuation gives `|g| = 0` | holds |
| §3.4 `t² = π` | `σ` swap on `(ℤ/n)²` | `(σ−1)² = −2(σ−1)`; nonzero powers for odd `n`, zero for `2`-powers; base change `V[√π]`: branches meet, stalk `(ℤ/n)²` trivial | Check conclusion holds; scheme description wrong (R02) |
| §3.4 `T = S³`, `n = 2` | 3-cycle on `𝔽₂³` | `(σ−1)³ = σ(σ+1) ≠ 0`, `σ` semisimple of odd order | not unipotent, as stated |
| §3.4 Artin–Schreier | `T = w²/(1−w)`, char 2 | `u² − u = (1−w)/w² = T⁻¹`; `|T| = |w|²` for `|w| < 1`, `|T| ≥ 1` otherwise; `dT/dw = w²/(1−w)²`; `g² − g = S^{−m}`, `m` odd: `g_{−m} = 1`, `g_{−2^j m} = 1`, divergent | all Checks hold |
| §3.4 `f = T²`, char 2 | `ε = |t|²` | `T(V(T),|t|²) = T(V(T²),|t|⁴) = {|T| ≤ |t|²}` | holds |
| §3.4 `n = p` | mixed characteristic | `H¹(B(1),ℤ/p)` infinite, `H¹({0},ℤ/p) = 0` (ITO20 line 987) | exclusion necessary |
| §3.5 | `n = 3, a = b = 2` | `ab = 4 = 1`, unit `1 ↦ 1`; zero endomorphism sends `1 ↦ 0` | holds |
| §3.6 | plane cubic in ℙ² | `H¹(ℙ²_C) = 0`, `dim H¹(Y_C) = 2` | whole ambient space fails, as stated |
| §4.1 | `Y = ℙ¹/ℚ₃`, `Z′: y² = x³ − x` over `𝔽₃(t)` | `x³ − x` has roots 0,1,2 distinct in char 3, smooth; `deg g = 2`; `dim H¹ = 2 ≠ 0` | approximation data valid, no isomorphism asserted |
| §4.3 | `deg(c₁(g*H)^d[Z′]) = deg(g)·deg(c₁(H)^d[W])` | positive integer, nonzero in `ℚ̄_ℓ`; zero mod 2 for the degree-2 cover | holds; ℤ/ℓ^m failure as stated |
| §4.4 / `duality_splitting` | `G = S₃`, `a = b = diag`, `c = 3`, `E = ℚ` | `q(ax,by) = 3xy`; annihilator `x₁+x₂+x₃ = 0`, dim 2; `1 + 2 = 3`; char 3: `c = 0`, diagonal inside the plane | holds; negative control holds |
| §4.4 | `G = C₂`, `V = V′ = E` | `q(g1,g1) = −1 = χ(g)`; identity maps, `c = 1` | top character nontrivial admitted |
| §4.4 | `U = U′ = 0`; `𝔽₂` with all spaces one-dimensional | `V = 0 ⊕ V`; `V = V ⊕ 0` | holds |
| §4.6–4.7 | Fermat `e`, `p ∤ e`, `n ≥ 2`; cubic threefold | partials `e x_j^{e−1}` no common projective zero ⇒ good reduction | agrees with §0.10; threefold needs no reduction hypothesis |

## Not verifiable

- HUB96 (Theorems 3.7.2, 3.8.1, Lemma 2.7.11, Theorem 5.7.8), HUB98 (Definition 1.4, Theorems 2.1, 3.6) and LUT93 (Theorem 2.2) are settled uncertified; their formulations were checked only against the recollections in ITO20 (lines 27–33, 99–106, 964–981, 1198–1201, 1662) and SCH12 (lines 2601–2606). The page range "pp. 224–228" given for HUB96 Theorems 3.7.2/3.8.1 could not be checked.
- The open-PR suppliers were read at the heads the roadmap index serves (ClassicalAdicEtaleCohomology `dfcb6b7`, DeligneWeightsAndPurity `6c2402d`, ArithmeticGaloisRepresentations `761fa1e`, LefschetzPencilsAndVanishingCycles `8f3e9b1`, FiniteFlatGroupsAndIntegralPadicHodgeTheory `34f4657`, AbelianSchemesAndArithmeticModuli `71ecc01`, EtaleDualityAndPerverseSheaves `34e0692`); AnalyticToricGeometryPartII has only an accepted design on the board (no package README yet), so its NT targets were read from `packages/AnalyticToricGeometryPartII/design/README.md`.
- No Lean was run (the brief gives no Lean command for this pass); the elaboration and `#check` audit of `duality_splitting` reported by the round-2 and round-3 repairs was not repeated. Its signature was checked by reading only.
- Ownership against open pull requests whose files the brief does not provide was not checked beyond the `roadmaps grep` index.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "959da23", "job": "RT-DeligneWeightsAndPurityPartII~1b", "model": "fable", "worker": "fable-rt238"} -->
