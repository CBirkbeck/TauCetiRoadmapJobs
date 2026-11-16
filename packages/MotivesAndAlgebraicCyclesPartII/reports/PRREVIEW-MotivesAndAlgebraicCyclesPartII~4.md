# Review of MotivesAndAlgebraicCyclesPartII (pull request #2459 at d54ace2)

**Verdict:** accepted

Incremental re-review of the 28 lines changed since `1fff774`. No findings.

## Previous findings

- R01 — repaired: §7.6 now proves "Every nonarchimedean strictly totally disconnected Banach ring lies in the class of §7.1", with a route constructing the unit and its roots; the Summary and the description's §7.6 bullet are then correct as written.
- R02 — repaired: "*Needs:* §§1.8, 2.2, 2.5, 2.7 (the free motive of a finitary arc-sheaf: case 2 with `n = 0`), 4.6; the animated group completion (gap:animated-group-completion)."
- R03 — repaired: "Theorem 4.1 and Remark 4.2, p. 19"; "Theorem 4.14, Propositions 4.15–4.16, p. 23"; "Definition 6.2, p. 35"; "Corollary 8.10 and proof, p. 47"; also "Definition 5.18, p. 34" (Scholze line 1445, page markers at 1428 and 1467).

## Verified sound

| Statement | Instances tried | README side | Computed / source side | Result |
|---|---|---|---|---|
| §7.6, strict rings lie in the class of §7.1: the unit `T` | `A = C × C′`, `f₁ = (π, 0)`, `f₂ = (0, π′)`; general strict `A` | `T` a unit with `sup_x |T|_x ≤ max_j ρ(f_j) < 1` | `T = (π, π′)`, `|T| = max(|π|, |π′|) < 1`; `{f_j ≠ 0}` open cover of a profinite set refines to a clopen partition; `|f_jⁿ| → 0` gives `ρ(f_j) < 1`; uniform norm is the supremum | holds |
| §7.6: approximate roots are near true roots | `K(x) = ℂ_p`, `p` odd, `m = 2`, `T = p²`, `y = p + p³` | some root `r` with `|y − r|_x ≤ ε^{1/m}` | `|y² − T| = |2p⁴ + p⁶| = p⁻⁴`; `|y − p| = p⁻³`, `|y + p| = p⁻¹`, product `p⁻⁴`; `p⁻³ ≤ p⁻²` | holds |
| §7.6: convergence and compatible roots | `ε_k = ε₀ 2^{−mk}`; `m = p` in residue characteristic `p` | Cauchy sequence, limit an `m`-th root; `T^{1/m!}` | `Σ ε_k^{1/m} = ε₀^{1/m} Σ 2^{−k} < ∞`; inseparable `X^p − T = (X − r)^p` still gives `|y − r|^p = |y^p − T|`; a root `y` has `|y|_x = |T|_x^{1/m} < 1`, so iterate with `n_i = i!` | holds |
| §7.6: negative control for the class | `ℚ_p` (not strict); discrete `k` | outside the class | `ℚ_p`: residue field not algebraically closed, valuation of a root would be `1/m ∉ ℤ`; `k`: not analytic, `A_{<1} = 0` | consistent with §7.1 Checks |
| §7.1 API: functoriality in contractive maps | `A → A′` contractive, `a ∈ A_{<1}`; identity map | carries `A_{<1}` into `A′_{<1}`; roots not needed | `|φ(a)| ≤ |a| < 1`; `ℤ ⊕ A_{<1} → ℤ ⊕ A′_{<1}` is a unital ring map; `E_K = cofib(K(I) → K(A))` mentions no root | holds |
| §7.3: roots on perfectoid rings | `ℂ_p` with `ϖ^p ∣ p`; `ℚ_p` | `n_i = pⁱ` roots of a pseudo-uniformizer, from PerfectoidSpaces §P1.3 | §P1.3 on main states `PseudoUniformizerRoots.nonempty` for every perfectoid Tate ring and `IsEmpty (PseudoUniformizerRoots ℚ_[p])`; `pⁱ` strictly increasing | holds |
| §4.7 Needs | `U` finitary arc-sheaf of sets, `n = 0` | §2.7 case 2 supplies `ℤmot[U]` | README §2.7: for `n = 0` the free motive is `L_B f_♯ ℤ` | holds |

Rows for the statements the change does not touch stand as in the previous review, of `1fff774`.

- Source locators checked against the text: 6 (Scholze lines 791–809, 969–998, 1445–1448, 1500–1505, 1944–1948, 1988–1992, with the page markers at 789, 833, 962, 1002, 1428, 1467, 1962, 2003). The seeded sample falls outside the changed passages.
- Cross-roadmap citations resolved: PerfectoidSpaces §P1.3 on main (existence of compatible `p`-power roots is stated there); TropicalAndBerkovichArithmetic §0.14 (unit criterion, `ρ(a) = max_x x(a)`) and §0.25 (idempotents and clopen subsets) at its open head; README §0.4 (clopen factors, surjections `A → K(x)`). No supplier is added: all three were already suppliers.
- Layer 7 Dependencies agree with the changed Needs lines (Layers 0–6, PerfectoidSpaces §P1.3, TropicalAndBerkovichArithmetic §§0.14, 0.25).
- Gate at d54ace2: every check 0, OK (the worker's run and a rerun). `depcheck: 261 roadmaps, 2598 edges, 0 problem(s)`. No change outside the folder. `lake env lean` on `Suggested.lean`: exit 0, no output; the file is unchanged and declares nothing, so there is nothing to probe for padding.
- Pull-request text: title, summary block and prose agree with the head; the §7.6 bullet ("on nonarchimedean strictly totally disconnected rings") is what §7.6 now proves; no section, headline or supplier is added or removed by the change.
- Overlap check: read RationalAnalyticPrismatization, ArcTopologyAndDescent, DiamondEtaleCohomology, AnalyticStacks, EnhancedDerivedSheaves, SchemeKTheoryOperations, DiamondsAndVStacks; nothing shared (as in the previous review; the change adds no object).
- Source independence: changed passages only; 4 passages compared with 1 source (Scholze), none shared: the root construction of §7.6 is not in the source, which assumes the roots (line 1944); largest share Scholze, 107 of 121 locators; the change adds, removes and reorders no layer, so the contents comparison stands: independent.
- Research link: the headline targets are the main theorems of Scholze, Berkovich motives (2024), and the §10.6 comparison is with the étale motives of Cisinski–Déglise (2013) through the rigidity of Bachmann (2018); rests on the README Summary and these three sources.

## Not verifiable

- BLR §9.2 (cited in §4.3): recorded as uncertified in the manifest, cited by locator and not read.

## Source issues

- **Gap** in Scholze at Theorem 8.9, p. 47: the source says the cofibre is a sheaf on all strict rings; it should repeat the standing assumption of p. 46, a unit with roots, or show that strict nonarchimedean rings have one; affects a stated result.

## For the human reviewers

- none
