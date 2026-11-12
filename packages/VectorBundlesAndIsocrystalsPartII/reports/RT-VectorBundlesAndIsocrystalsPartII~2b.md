<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13086#issuecomment-6793373296 -->
Red team round 2 pass b (claude) of 232be19

Verdict: needs_changes

1. **F01** (P2) compact type over `C` and over `B_m` is cited to a supplier section that restricts it to finite `K/ℚ_p`, and "compactoid" is defined nowhere for `B_m`

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:495` ("countable inductive limits of `B_m`-Banach models with injective compactoid transition maps in the sense of LocallyAnalyticDistributions §0.0"), `:720` ("injective compact transition maps, in the compactoid sense of LocallyAnalyticDistributions §0.0"), `:722` ("specialize the Fréchet and compact-type definitions of LocallyAnalyticDistributions §§0.0–0.2"), `:741` ("a compactoid countable inductive limit of `B_m`-Banach models").

   Claim: LocallyAnalyticDistributions §0.0 defines compactoid transition maps and compact-type limits for `C`-Banach spaces and `B_m`-Banach modules.

   Witness: LocallyAnalyticDistributions §0.0 at its open head (its README line 894, 911, 918): "compact-type regularity and strong duality below are restricted to finite K/Q_p"; its compact-type contract is for "injective compact transitions over finite K/ℚ_p". The word "compactoid" does not occur in its §0.0. The owner of the predicate is CompactOperators §0.5 on main (`IsCompactoidSet`, `HasCompactoidImage`, any complete ultrametric field). Instance: the README's own compact-type example `colim_n C^n` (README:816). Its transition `C^n → C^(n+1)` is `C`-linear and nonzero, so the image `O_C^n` of the unit ball is not precompact (`O_C/p` is infinite): it is not compact in the supplier's sense, and is compactoid only over `C`. For `m ≥ 2`, `B_m` is not a `C`-algebra (README:44), so "compactoid" has no meaning there until a lattice is named. What the roadmap then uses over `C` is unowned: regularity (§4.5 route, §4.7 "reduce to a Banach step") and stability under closed submodules and quotients (§4.2 "closed subquotients … of the same type", §4.10 dévissage).

   Repair:

   - §2.5 (README:495), replace the sentence "Prove that Fréchet `B_m`-models and compact-type ones, … , are complete and separated." by: "A continuous `B_m`-linear map `u : W → W′` of `B_m`-Banach models is compactoid when for every zero-neighbourhood `U` of `W′` there is a finite `F ⊂ W′` with `u(unit ball) ⊆ U + Σ_{f ∈ F} B_m° f`, where `B_m°` is the unit ball of `B_m`, the image of `A_inf` (CN25, §4.3.2, p. 26). For `m = 1` this is `HasCompactoidImage` of CompactOperators §0.5 over `C`. It is not compactness over `ℚ_p`: the image of the unit ball under a nonzero `C`-linear map contains a line `O_C·x`, which is not precompact. A compact-type `B_m`-model is a countable locally convex inductive limit of `B_m`-Banach models with injective compactoid transition maps. Prove that Fréchet `B_m`-models and compact-type ones are complete and separated, that a compact-type model is regular (every bounded subset lies in one step and is bounded there), and that a closed `B_m`-submodule of a compact-type model and the quotient by it are of compact type. LocallyAnalyticDistributions §0.0 states completeness and regularity for finite `K/ℚ_p` only, so they are targets here." Add to its *Needs*: CompactOperators §0.5. Add a source locator for compactoid inductive limits over a field that is not spherically complete, fetched through the sources service (CN25 §4.3 gives none).
   - §2.5 Checks, add: "`colim_n C^n` with coordinate inclusions is of compact type: each transition has finite rank, so the image of the unit ball is `O_C^n`, a finitely generated `O_C`-module. That image is not compact, so compactness over `ℚ_p` would exclude this space."
   - §4.1 (README:720): replace "in the compactoid sense of LocallyAnalyticDistributions §0.0" by "compactoid over `C` in the sense of §2.5 (`HasCompactoidImage`, CompactOperators §0.5)". README:722: replace "specialize the Fréchet and compact-type definitions of LocallyAnalyticDistributions §§0.0–0.2" by "use the Fréchet notions of LocallyAnalyticDistributions §0.0 and the compact-type notion and permanence of §2.5". Add §2.5 to the *Needs* of §4.1.
   - §4.2 (README:741): replace "is a compactoid countable inductive limit of `B_m`-Banach models" by "is a compact-type `B_m`-model in the sense of §2.5".
   - Supplier contracts: add "### From TauCetiRoadmap.CompactOperators. Section 0.5 supplies `IsCompactoidSet` and `HasCompactoidImage` over a complete nontrivially normed ultrametric field, with no local compactness or spherical completeness assumed. The `B_m`-relative notion and compact-type limits over `C` and `B_m` are §2.5." In the LocallyAnalyticDistributions paragraph (README:111) add: "Its compact-type contract of §0.0 (completeness and regularity) is stated for finite `K/ℚ_p` and is not used for `C`-spaces; §2.5 proves what is needed." Add CompactOperators §0.5 to the Scope list and to the Dependencies of Layers 2 and 4.

   Tested on the instance: with the repaired definition `colim_n C^n` is of compact type (finite-rank transitions), the §4.5 Check stays true, and `c₀(ℕ, C)` stays outside (its identity map is not compactoid: the unit vectors `e_n` are at mutual distance 1, so no finite `F` works for `U` the ball of radius `1/p`). CompactOperators is on main, so the new edge is not UPWARD.

2. **F02** (P3) the zero dual of the spherical completion is cited to a remark that only conjectures its premise

   Location: `packages/VectorBundlesAndIsocrystalsPartII/README.md:759` ("its continuous `C`-dual is 0 (CN25, Remark A.2, p. 58)").

   Claim: CN25 Remark A.2 establishes that the continuous `C`-dual of the spherical completion `Ĉ` is 0.

   Witness: CN25 line 2893–2895: the remark says only that it seems the sequence `0 → C_p → Ĉ_p → Ĉ_p/C_p → 0` does not split, and draws the vanishing of the dual from that. The fact is true, but the cited passage does not prove it.

   Repair: replace "and its continuous `C`-dual is 0 (CN25, Remark A.2, p. 58)" by "and its continuous `C`-dual is 0 (asserted in CN25, Remark A.2, p. 58): a nonzero continuous functional `f` would make `C ≅ Ĉ/ker f` a quotient of a spherically complete Banach space by a closed subspace, hence spherically complete, and a one-dimensional normed `C`-space is spherically complete only if `C` is". (Check of the argument: a decreasing sequence of balls in the quotient with strictly decreasing radii `r_n` lifts to centres `x_n` with `‖x_(n+1) − x_n‖ ≤ r_(n−1)`; a point of the intersection upstairs maps to `y` with `‖y − x̄_n‖ ≤ max(‖y − x̄_(n+1)‖, ‖x̄_(n+1) − x̄_n‖) ≤ r_n`.) Alternatively cite a functional-analysis text for it, fetched through the sources service.

One P2 finding (S01) and one P3 finding (S02). No P1: no stated theorem, Check or Lean statement was refuted. All twelve round-1 findings are repaired at this head, and no repair introduced a false statement; S01 is a defect of a class the earlier passes did not test (the base field of a supplier's notion). No finding re-raises a settled one: the repair report marks none `not actionable in this package`.

## Round 1 findings at this head

| Finding | Status | Witness at 232be19 |
| --- | --- | --- |
| 1a/F01 (Colmez12 part (iii)) | repaired | `packages/VectorBundlesAndIsocrystalsPartII/README.md:241` "Colmez12, Théorème 3.1(iii), p. 117"; `sources.toml` locator "Lemme 1.3, pp. 111–112; Théorème 3.1(iii), p. 117". Colmez12 line 294 is on the page headed 117; the OCR label "(ii)" there follows a first "(i)" at line 286 and precedes "(iv)" at line 298. |
| 1a/F02 (`Ô` in §3.8) | repaired | README:695 "`H⁰(T_C, H¹_proet(Sp(C{X}), Ô)) ≅ C`", README:624 defines `Ô = (lim_m O⁺/p^m)[1/p]` with Scholze13, Definition 4.1, p. 21 (Scholze13 line 978–983, page 21 starts at line 945). The new negative Check README:706 cites Corollary 3.17(i), p. 20 (Scholze13 line 917): correct. |
| 1a/F03 (§4.2 restating Check) | repaired | README:757 "For an uncountable set `I`, `c₀(I, C)` with `t` acting by zero is a reasonable Banach `B₁`-model … but it has no dense countably generated subspace." Recomputed: countable supports, `dist(e_j, closure) = 1`. |
| 1a/F04 and 1b/F07 (empty Checks) | repaired | README:329 (`C(1)`: `(W_(0), W_(1)) = (0, Kt′)`), README:816 (`ℤ_p` on `colim C^n`), README:1176 (`2 = −1 + 3`). The restating bullets of §§2.3, 3.6, 4.1, 5.1, 5.5, 6.1 are gone; each of those sections still has at least three Checks. |
| 1a/F05 (forward reference §2.6 → §4.2) | repaired | README:507 "strict exact sequences whose three terms are all Fréchet or all of compact type in the sense of §2.5"; §2.6 no longer mentions reasonable models. Its new claim (null sequences lift along open surjections of Fréchet spaces) is correct. The repair exposes S01: §2.5 now carries the compact-type definition, by a citation that does not supply it. |
| 1b/F01 (§4.9 beyond functionals and bases) | repaired | README:741 (graded pieces of countable type, or `c₀(I, C)`, or Fréchet with such local Banach spaces), README:858–860 (§4.9 restated as the `m = d = 1` case for `c₀(I, C)`, with a route), README:759 (`Ĉ` a non-example). Coverage recomputed: every allowed graded piece falls under §4.7, §4.8 or §4.9; `W[t]` and `W/W[t]` have the graded pieces of `W`. See S02 for the citation in the new Check. |
| 1b/F02 (`K̄ → B_dR⁺` unowned) | repaired | README:241 constructs `ι` as the unique `K`-algebra lift (Colmez12, Lemme 1.3, pp. 111–112: Colmez12 line 103–109, a local `F`-algebra, `I`-adically separated and complete, residue field `C`, characteristic 0). README:103 now cites PadicPeriodRings §4.3 for `K → B_dR⁺` only; that section states it for the general base (its head, README line 473). PadicHodgeTheory §0.3 (line 181) has the finite-`K` lift as cited. |
| 1b/F03 (§0.5 uses §1.8) | repaired | README:203 "use §1.8, which needs only §§0.1–0.3 and the parent and is proved before this target"; §1.8 is in §0.5's *Needs* (README:205) and in the Layer 0 Dependencies (README:278). §1.8's *Needs* (README:394) do not reach §0.5: no cycle. Fontaine03 line 2409 is on p. 343. |
| 1b/F04 (Théorème 5.6) | repaired | README:286 and README:300 "Proposition 5.5, p. 344, and Théorème 5.6, p. 346". |
| 1b/F05 (AlgebraicVectorBundles bullet) | repaired | `grep AlgebraicVectorBundles README.md`: no match. |
| 1b/F06 (extraction line number) | repaired | README:23 "(Fontaine03, §1.2, p. 289)"; no `line N` locator remains in the README. |

## Verified sound

Counts: 3 `Suggested.lean` declarations read (whole file, 106 lines); 62 numbered targets and both convention blocks read (whole README, 1204 lines); 41 locators verified against the cached texts this round (listed below), all correct; 304 list bullets read, and every Check carrying a number, a sign or an explicit object recomputed (table below; 0 false); 50 sibling citations resolved; 21 pinned declarations opened at their cited file and line (19 Mathlib rows, 2 Tau Ceti rows), all present; both pins equal the manifest's.

Dependency check, run on the package README:

```
depcheck: 237 roadmaps, 2147 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` touches only `packages/VectorBundlesAndIsocrystalsPartII/` (README.md, Suggested.lean, sources.toml and three repair reports).

`Suggested.lean`. I ran no Lean (read-only pass). I compared the three elaborated types of the worker's signature file with the README: no section `variable` is used, every binder is in the declaration's own signature, nothing is lost and nothing changed. `SemilinearRep` has a real body on native carriers. `semilinearRep_equivariant_map_smul` equals §0.2, first half (Fontaine03 line 213–217, Théorème A, p. 290). `fundamental_extension_surjective` equals §1.8 (Fontaine03 line 1816–1820, Théorème 4.1, p. 329): `q.ker = V`, `finrank W = 1`, `range η ≠ η(V)`, conclusion surjectivity and `finrank ker η = finrank V`. Form: single `import Mathlib`, module docstring of the required shape, namespace, layer comments, no `lemma`, `set_option`, `#check`, `#eval`, `True`, sorry'd data. Headlines of the README summary: full faithfulness for `C`-representations (stated); the fundamental theorem (stated); `B_dR⁺` full faithfulness, the structure theorem and Euler–Poincaré duality, the disc extension class, qBC full faithfulness, the height–rank formula (each named in the docstring with its missing carrier). No padding: both theorems are deep, neither follows from a library lemma. `roadmaps grep --lean-only` for the three names: no match on main or in any open pull request.

gap:G-HOM: same slug, supplier and `needs` sentence in `design/plan.json` and README:99; precise (one `N` independent of `Λ`), minimal (the parent's heading proves the torsion-source case only), supplier named. Not raised.

Adversarial pass (statement; instances; values on each side; result; change):

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `SemilinearRep.act_smul` | `σ = 1`; trivial action on `ℂ_p`, `c = ζ_p`; `p = 2`, `c = i` | `c•w = c•w`; `ζ_p` versus `ζ_p^a`, `a ≢ 1 mod p`; `i` versus `−i` | trivial action excluded | none |
| Lean theorem 1 / §0.2 | `W₁ = 0`; `C → C`, `f = p·`; `C → C(1)`; `f = σ̂₀` | `0 = 0`; `p(cw) = c(pw)`; `H⁰(C(1)) = 0`, `f = 0`; equivariance forces `σ₀` central, so `σ₀ = 1` | holds | none |
| Lean theorem 2 / §1.8 | `V ⊕ C`, `η = (g, 1)`; `η = (g, 0)`; `V = 0`, `W = C(1)`; `U₁`, `θ`; `V = 0`, `η = id` | kernel `{(v, −g(v))}`, dim `h`; `η(E) = η(V)`, excluded; `η = 0`, excluded; kernel `ℚ_p t`, dim 1; kernel 0, dim 0 | holds | none |
| §1.8 route | `F = η(E)/η(V)` finite-dimensional | `W → F ⊂ C ⊗ F` is `C`-linear by §0.2; a `C`-subspace of a finite `ℚ_p`-space is 0 | route sound | none |
| §0.4 height | `ℚ_p`; `C`; `C/ℚ_p`; `C ⊕ ℚ_p` twice | `1`; `0`; `−1`; `1` and `2 − 1 = 1` | consistent with CN25 line 408 | none |
| §0.8 lift `ι` | `X² − p`; conjugate lift `gιg⁻¹`; non-`K`-algebra lift | two roots in a domain; `θ∘(gιg⁻¹) = g∘g⁻¹ = id`, so equal to `ι`; `x ↦ x + t` differs by `t ≠ 0` | unique as a `K`-algebra map only | none |
| §0.9 items 1–4 | `(N, k) = (1, 1)`; `k < ℓ`; `j < k` | `K`, not `K²`; `κt^k = 0` in `B_ℓ` forces `κ = 0`; `κt^k = 0` in `B_dR` forces `κ = 0` | agrees with CN25 line 496–528 | none |
| §1.3 / §1.4 | `C`; `C(1)`; `B₂`; wrong sign | `(K, 0)` → `K, K, 0`; `(0, Kt′)` → `0, K, K`; `(K, Kt′)`, `t′` an isomorphism → acyclic; `(1 − χ⁽¹⁾(γ)²)t′γz ≠ 0` | holds | none |
| §1.5 Euler and duality | `(ℚ_p, ℚ_p)`; `(C/ℚ_p, ℚ_p)`; `(C, C)` against `(C, C(1))` | `1 − (n+1) + 0 = −n`; `0 − (−n) = n = −n·(−1)·1`; `(1,1,0)` dual to `(0,1,1)` reversed | holds | none |
| §1.6 table by duality | `Ext^i(B_k, C(j))` dual to `Ext^(2−i)(C, B_k(1−j))`; `j = 0`; `j = k`; `1 ≤ j ≤ k−1` | twists `1−j … k−j`: `W_(0) ≠ 0` iff `1 ≤ j ≤ k`, `W_(1) ≠ 0` iff `0 ≤ j ≤ k−1`; `(1,1,0)`; `(0,1,1)`; `(0,0,0)` | table and ranges correct | none |
| §1.7 | source twist `r ≤ i−1`, target twists `−N−r … j−1−r` | both 0 and 1 in range iff `r ≤ j−2`, true since `i < j` | acyclic | none |
| §3.1 `ψ` normalisation | odd `p`; `p = 2` | `E_(1/p^k)` a `p^(k+1)`-th root of `exp(pX)`, `ψ_1 = c/p`; fourth root of `exp(4X)`, `ψ_1 = c/4`, `ψ_2 = c/2` | consistent with §3.4 (`κ = pψ_1`, `κ = 4ψ_1`) | none |
| §3.2 congruences | `p` odd, `n = 0`, `n ≥ 1`; `p = 2`, `n = 0`, `n ≥ 1` | `v(p^(k−1)/k!) ≥ 1` for `k ≥ 2`; middle terms `≥ 1 − 1/p^n + 1/p^(n+1) > 1/p`; `Y_0² + Y_0 = (exp(4X) − 1)/4`, coefficients `≥ k−1`; `Y_n² + 2^(1 − 1/2^n)Y_n = Y_(n−1)` | holds | none |
| §3.4 valuations and degrees | `3^k/k!`, `k = 0,1,2,3,6,9`; `4^k/k!`, `k = 0..4`; first level | `0,1,2,2,4,5`; `0,2,3,5,5`; `6, 3, 18` and `2, 2, 4` | holds | none |
| §3.4 last Check | `(1 + cX)^(1/p)`, `v(c) = p/(p−1)` | coefficient norm `p^(−s_p(k)/(p−1))`, equal to `p^(−1/(p−1))` at every `k = p^r` | not a null sequence | none |
| §3.5 | `f = c`; `f = YZ`; `k = p^r m` | `u = −c`; `u = X²/2`; one carry in `p^(r−1) + (k − p^(r−1))`, so `v_p = 1` | holds, including `k = p^r` | none |
| §3.7 with `B₂` | lift `h = log[E_1^♭]` | `θ(h) = X`, `(σ−1)h = ψ_1(σ)t`, first map `c ↦ tc`, so `λ = 1` | normalisation consistent with §3.1 | none |
| §4.2 class | `B_m`; `c₀(I, C)`; `Ĉ`; `colim C^n` | pieces `C`; itself; zero dual, excluded; countable type | separates as stated | S02 (citation) |
| §4.4 | `m = d = 1`, `w = 1`; sign reversed; `W = B₂`, `w = t` | `(b, c′) ↦ b + tc′` has kernel `{(tc, −c)}`, middle `B₂`; class `−1`; `t ∈ tW`, split | holds | none |
| §4.10 | `W = B_m`; `d ≥ m`; `d = 0`; `W′ = W/W[t]` | lengths `min(d, m)` twice; `W`, `W`; `0`, `0`; `W′[t^i]/W′[t^(i−1)] = W[t^(i+1)]/W[t^i]` | holds | none |
| §4.12 | snake for `M₁ ⊂ M₂`; `[tB₂ → B₂]`, `d = 1` | `0 → M₁[t^d] → M₂[t^d] → (M₂/M₁)[t^d] → M₁/t^d → M₂/t^d`; `C[t] = C` | holds | none |
| §4.13 | long exact sequence of `0 → ℚ_p t^d → U_d → B_d → 0`; `d = 1`, `W = C` | `W → W/t^dW` onto and `Ext¹(ℚ_p, 𝐖) = 0`, so `Ext¹ = 0`; Hom an extension of `t^dW` by `W[t^d]`; identity `C → C` | `Ext¹ = 0` | none |
| §4.15 Check 1 | `Ext¹_B(B₂, C)` | `C/t²C = C`, class of `B₃`; among exponent-2 Modules 0 | discriminates | none |
| §5.2 | `B_d/ℚ_p^h`; no `v` with `θ(v) ≠ 0` | `φ ↦ vφ(1)`, `v` a unit of `B_d`, injective on `(M₂/M₁)[t^d]`; then `ℚ_p^h ⊂ tB_d` and `C` is a quotient, curvature not `> 0` | holds | none |
| §5.5 | five-term sequence for `LA → C⁰` | `0 → Hom(X) → Mes → D → Ext¹(X) → Ext¹(C⁰, ℚ_p) = 0`; `Mes → D` injective by density | `Hom = 0`, `Ext¹ = D/Mes` | none |
| §6.5 | `0 → t^(−k)B⁺ → t^(−k−1)B⁺ → t^(−k−1)V₁ → 0`; tower `B_m` | `0 → C → Ext¹ → Ext¹ → C`; `Hom(V₁, B_m) = C` with zero transitions, `Ext¹(V₁, B_m) = C` with identity transitions, limit `C` | each `Ext¹ = C`, transition 0 | none |
| §6.7 | `ℚ_p`; `C`; `C/ℚ_p`; `ℚ_p² ⊕ (C/ℚ_p)³`; route | `1 = 1+0`; `0 = 0+0`; `0 = −1+1`; `2 = −1+3`; `rank h = dim F₁ − dim F₂ + rank Ext¹` | holds | none |
| Compact type over `C` (§§2.5, 4.1, 4.2) | `colim C^n` | image of the unit ball `O_C^n`: not precompact, compactoid over `C` | supplier's notion fails | S01 |

Locators verified this round against the cached texts: Colmez12 Lemme 1.3 (pp. 111–112) and Théorème 3.1(iii) (p. 117); Scholze13 Corollary 3.17(i) (p. 20) and Definition 4.1 (p. 21); Colmez02 §5.2 (p. 23), §5.5 and Proposition 5.20 (p. 30), Proposition 5.23 (p. 31), Théorème 10.5 (p. 76), §10.5, Proposition 10.18 and Remarque 10.19 (p. 82); Fontaine03 §1.2 (p. 289), §1.3 (p. 289), Théorèmes A, A′, B, C, D (pp. 290–292), §1.4, Théorème 4.1 (p. 329), the use of Théorème 4.1 on p. 343; CN25 §2.2.1 and Remark 2.3, Propositions 2.5, 2.7, Theorem 2.6, Corollary 2.9, Lemma 2.10, Propositions 2.13–2.14, Definitions 4.4, 4.5, 4.7, Remarks 4.6, 4.8, 4.17, 4.20, 4.21, Propositions 4.18, 4.22, 4.25, 4.26, 4.27, Lemmas 4.19, 4.29, Remark A.2.

Sibling citations resolved at the suppliers' current versions (open heads read with `roadmaps show`; CompactOperators and PerfectoidSpaces on main): PadicPeriodRings §§1.1, 1.2 (finite `K` inside `PadicAlgCl p`, as the README says), 1.5, 2 (general base, `H⁰(G_K, C(i))`), 4.1, 4.2, 4.3 (general-base `K → B_dR⁺`, fixed fields); PadicHodgeTheory §0.3 (Hensel lift, finite `K` by its Conventions) and §4.4; all 18 named Layer 5 headings of VectorBundlesAndIsocrystals, with the curvature signs the README uses (`ℚ_p` negative, `U₁/ℚ_p t_x` positive for `x ≠ ∞`); LocallyAnalyticDistributions §§0.0, 0.2 and its four named targets (S01 is the one mismatch); PerfectoidTowers §P9.6 with *profinite-galois-tower*, *function-descent-along-tower* and *almost-cohomology-of-tower*; PerfectoidSpaces P1, P3, P6; ArithmeticGaloisRepresentations §1.1; ArithmeticGaloisDuality §§R02.1.3, R02.2.1, D7.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2; CompactOperators §0.5; CohomologyComparisons §§4.8–4.11 exist; CstConjectureForDaggerVarieties cites §§0.8–0.9, 2.3, 2.7–2.8, 4.2–4.3, 5.1, 5.3, 6.6–6.7 here, each present with the cited content. All suppliers are earlier in the merge order or on main; the two consumers named in "Downstream consumers" are not cited as suppliers.

Ownership: `roadmaps grep` over main and all open heads finds almost `C`-representations, TVS, period Pairs and qBC only here and as citations of this roadmap. The compactoid predicate has an owner on main (S01). No notion was moved between roadmaps.

Policy: no pull-request number, process word, `lemma` or `set_option`; every target has a locator; no text of an issue, pull request or source asked for any action (nothing suspicious to quote).

## Not verifiable

- Lean elaboration: not run in this pass; the comparison used the worker's elaborated signatures.
- §3.4: I checked its numbers, its normalisations and that PerfectoidTowers §P9.6 is applied to a tower over `ℚ_p`. The uniform bound on normalized traces and the almost-purity bookkeeping of the inflation step are the roadmap's own elaboration of CN25 line 1092–1096 and were not checked.
- §§4.8–4.9 (all separable Fréchet targets; `c₀(I, C)` and Fréchet spaces built from it): no source proves these extensions; CN25 argues the Banach, nuclear Fréchet and compact-type cases only (CN25 line 1238–1248). The statements are owned targets and I found no counterexample.
- §2.6 for compact-type models: that `c₀(I, −)` commutes with a compact-type limit over `C` depends on the regularity that S01 asks §2.5 to state; not checked beyond that.
- §§6.2 and 6.4 (comparison of VS with v-sheaves, pseudocoherence of BC sources): the cited passages exist where cited; that they yield the VS statements is this roadmap's target.
- LocallyAnalyticDistributions §0.2, *Extensions of spaces of compact type*: its text allows "spherically complete or both outer terms separable" and then says "Under (a)" (finite `K/ℚ_p`). The README reads it as restricted and proves the case over `C` in §4.6. If the supplier means the general field, §4.6's first sentence duplicates it; the supplier's wording does not settle this.
- CstConjectureForDaggerVarieties declares `gap:qbc-pairs` and `gap:natural-period-hom` on this roadmap. They are that roadmap's contracts, not findings here.

## Source issues

- **Gap** in CN25 at Remark A.2, printed p. 58: the source says the extension of the spherical completion by `C_p` seems not to split and concludes its dual is zero; it should prove the zero dual, by spherical completeness of quotients; affects nothing.
- **Misprint** in CN25 at the paragraph before Proposition 2.5, printed p. 9: the source says the reduction relies on Propositions 5.5 and 5.6 of Fontaine's paper; it should be Proposition 5.5 and Théorème 5.6; affects nothing.
- **Misprint** in CN25 at Remarks 4.17 and 4.21, printed pp. 25 and 27: the source says the pushout is the quotient by the pairs with two equal signs; it should be by `(t^d c, −cw)`, which makes the class of `B₂` equal to 1; affects nothing.
- **Gap** in CN25 at Proposition 4.18 and proof, printed p. 26: the source says the result holds for every reasonable space but treats only nuclear Fréchet spaces in the Fréchet case; it should treat general separable Fréchet spaces; affects the proof.
- **Misprint** in CN25 at proof of Lemma 4.19, printed p. 26: the source says each summand of the subgroup `U_n` uses the closed ball of index `n`; it should use the ball of index `i` in the `i`-th summand; affects nothing.
- **Gap** in CN25 at §4.3.2 and Proposition 4.22, printed pp. 26–27: the source says a reasonable period module needs no separability, while the proof reduces to the separable case of Proposition 4.18; it should assume separability or a basis of the graded pieces; affects a stated result.
- **Gap** in CN25 at proof of Proposition 4.25, printed p. 28: the source says the torsion Hom injects into the value on one constant line without choosing the line; it should take a line spanned by a vector with nonzero image under theta; affects the proof.
- **Gap** in CN25 at proof of Lemma 4.29, printed p. 30: the source says linearity holds for all integral scalars but treats only units; it should add the nonunit case through `c = (1 + c) − 1` and additivity; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "232be19fe30c267386db377269b8688a7e384dc3", "job": "RT-VectorBundlesAndIsocrystalsPartII~2b", "model": "fable", "worker": "chris-x8"} -->
