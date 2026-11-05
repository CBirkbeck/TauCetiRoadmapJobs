# Review of BanachAlgebras (pull request #1648 at 0fc954c)

**Verdict:** accepted

Incremental re-review of the 90 lines of `TauCetiRoadmap/BanachAlgebras/` changed since `8f807bc` (README.md and Suggested.lean; the three companion `.lean` files are unchanged). The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/BanachAlgebras'` is empty; `PROGRESS.md`, `STATUS.md` and `metadata.toml` are already on main). The gate passes on my run and the worker's, the dependency check reports no problem, and `Suggested.lean` elaborates with only `sorry` warnings. The one blocking finding of the previous review (R01, the two absent statable headlines) is repaired. Three P3 notes remain, two of them carried from the previous review; none blocks.

## R01 (P3) — `SwappedStarTargets.lean` still imports Mathlib submodules

**Location:** `TauCetiRoadmap/BanachAlgebras/SwappedStarTargets.lean:1–3`: `import Mathlib.Analysis.CStarAlgebra.Classes`, `…Unbundled.RingSeminorm`, `…Algebra.NonUnitalHom`.

**Claim:** Every listed `.lean` file begins with the single line `import Mathlib`.

**Witness:** The file is byte-identical to the one the previous review read (`git diff 8f807bc..HEAD` touches only README.md and Suggested.lean); the gate's `mathlib-subimports` check reads `Suggested.lean` only, so it does not see this.

**Repair:** Replace lines 1–3 by `import Mathlib`, or delete the file (R02). Re-raised from the previous review's R02.

## R02 (P3) — The companion files are worked examples, not acceptance tests

**Location:** `ClosestScalarTargets.lean:15–49`, `SwappedStarTargets.lean:14–32`, `ProductDomainTargets.lean:24–32`; linked from `README.md:275`, `:404`, `:1527`.

**Claim:** These files hold the roadmap's acceptance targets.

**Witness:** Unchanged since the previous review: `nearestScalar_witnesses` and `attemptedNorm_triangle_failure` compute the two fixed vectors of the README Check at `:259–261` and `:311`; `nearestScalar` is `Classical.choose` of an admitted theorem; the three `SwappedStar` theorems are the single ℂ² example of `:384–397`; the Cantor and real-power statements are specialisations of `locallyCompact_pi_iff` and a transport of `cantorSetHomeomorphNatToBool`. No companion declaration has a docstring.

**Repair:** Delete the example declarations and the definitions that serve only them (the README keeps every statement as a Check); `locallyCompact_pi_iff` may move into `Suggested.lean`'s Layer 7 section if it is kept as a target. Do not prove anything in place. Re-raised from the previous review's R03.

## R03 (P3) — Rieffel p.38 states less than the two targets that cite it

**Location:** `README.md:1146` (`*Needs:* … Rieffel, p.38`) for the extension `multiplier_extension` at `:1179–1186`, and `:1657` (`Rieffel, pp.38 and 42`) for Wendel's theorem at `:1682–1686`.

**Claim:** The locator supports the statements as written.

**Witness:** `rieffel-cstar-2008` lines 1393–1396 (problem B) extend a nondegenerate *-representation of a *-ideal with an approximate identity of norm one; lines 1412–1419 (problem C.2) make `M(A)` a Banach algebra for a norm-one approximate identity and extend nondegenerate *-representations of a *-Banach algebra; line 1416–1417 say only that `M(L¹(G)) = M(G)` "can be shown". The README's extension is for a bounded Banach-space representation and an approximate identity bounded by any `C > 0`, with bound `C‖π‖‖m‖`; it is true (table row), but its hypotheses are weaker than the source's and the source gives no proof of Wendel's theorem.

**Repair:** In 4.2 say in one clause that the source poses the contractive *-representation case and that the bounded Banach-space case is proved here by the displayed finite-sum route (`π̃(m)y = lim π(S_m(e_λ))y`); in 7.4 cite the primary source for Wendel's theorem (J. G. Wendel, *Left centralizers and isomorphisms of group algebras*, Pacific J. Math. 2 (1952), 251–261, open at the publisher) alongside Runde Appendix A.

## Previous findings

- R01 — repaired: `Suggested.lean:106–112` states `wiener_inversion` on `lp (fun _ : ℤ ↦ ℂ) 1`; `:157–171` states `multiplier_extension` on `DoubleCentralizer ℂ A`; the docstring (`:21–26`) no longer calls them non-statable; `README.md:869` and `:1182` name them.
- R02 — not repaired: `SwappedStarTargets.lean:1–3` unchanged (R01 above).
- R03 — not repaired: the three companion files are unchanged (R02 above).
- R04 — repaired: Rieffel is now the 2008 Berkeley notes at a legal author page, read and checked (below); Conway is cited by publisher and DOI without the link (`README.md:2078–2080`); "Short Assignment4" is replaced by a description of the closest-scalar proposal (`:252–255`). No `sources.toml` was added, and no roadmap folder on main carries one, so I do not re-raise that part.
- R05 — repaired: `README.md:20` links `../../Completed/OneParameterSemigroups/README.md`, which exists on main.

## Verified sound

**Build and gate.** `lake env lean` on `TauCetiRoadmap/BanachAlgebras/Suggested.lean` from the worktree: exit 0, 21 warnings, all `declaration uses sorry` (lines 49, 58, 77, 86, 97, 108, 134, 160, 174, 201, 212, 218, 224, 234, 244, 253, 261, 273, 287, 296, 309), nothing else. My gate run printed `gate BanachAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's run adds `build=0`. The dependency check returned exactly

```text
depcheck: 205 roadmaps, 1553 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. A scratch copy of `Suggested.lean` with `#check @wiener_inversion` and `#check @multiplier_extension` appended elaborates; both types agree with `signatures.md` and with the README statements (`:866–873`, `:1179–1186`); the `multiplier_extension` type keeps `[CompleteSpace A]`, `[CompleteSpace E]`, `[l.NeBot]` and `0 < C`. One-tactic probes on both new theorems: `simp` and `simp_all` make no progress (`wiener_inversion`) or fail (`multiplier_extension`); `exact ⟨f⁻¹, …⟩` fails because `lp … 1` has no `Inv` instance. Neither is padding; both are the headlines the previous review asked for. No principle violation in the changed lines: no shortcut, no re-planning, no `set_option`, no sorry'd data, no algorithm, no copied passage (the README's Rieffel descriptions are its own words), no edit outside the folder.

**Pinned declarations opened** (file:line at the pins). `Mathlib/Analysis/CStarAlgebra/Multiplier.lean:67–71` (`DoubleCentralizer` extends `(A →L[𝕜] A) × (A →L[𝕜] A)` with `central : snd x * y = x * fst y`, so `fst` is the left component `L` and `m.toProd.1 a` is the README's `S_m(a)`); `:179` (`(a * b).fst = a.fst.comp b.fst`, confirmed by `rfl` in the probe, so `S_{mn} = S_m ∘ S_n` and `Φ(m)Φ(n)π(a)x = π(S_m S_n a)x = π(S_{mn} a)x`); `(1 : 𝓜(ℂ,A)).fst a = a` by `rfl`; `:492–498` (`NormedRing`, `‖m‖ = max ‖fst‖ ‖snd‖`, confirmed by `rw [norm_def]; rfl`); `:510` (`NormedSpace 𝕜 𝓜(𝕜, A)`); `:521` (`CompleteSpace` under `[CompleteSpace A]`). `lp (fun _ : ℤ ↦ ℂ) 1` coerces to `ℤ → ℂ` and `(z : ℂ) ^ (n : ℤ)` is `zpow`, as the elaborated type shows.

**Source sample (changed locators).** `rieffel-cstar-2008` (Johnson-Freyd's notes of Rieffel's Spring 2008 Math 208, author page; printed page = PDF page): lines 320–323 define positive functionals and give ℂ² with `(α,β)* = (β̄,ᾱ)` as having no nonzero positive functional (README 1.4, `:386`); lines 339–346 give the Gaussian functional on polynomials with unbounded left multiplication (1.3 counterexample, `:370–372`); lines 363–385 prove `‖µ‖ = µ(1)` for a complete unital *-normed algebra with isometric star through the binomial square root of `1 − a` and Cauchy–Schwarz (1.3 `positive_continuous`; see *Source issues* for the tacit `‖1‖ = 1`); lines 420–442 the GNS quotient, left ideal and boundedness `‖L_a‖ ≤ ‖a‖` through `ν(c) = µ(b*cb)` (1.3 `exists_gns`); lines 445–462 the cyclic vector and vector state; lines 529–541 and 551–597 the approximate-identity and unitization variants (References `pp.16–18`); lines 1393–1419 double centralizers with the three laws, `M(A)`, automatic continuity, the Banach algebra for a norm-one approximate identity, the isometric essential embedding, the *-extension and `M(L¹(G)) = M(G)` (4.2, 7.4; R03 on what exceeds it); lines 1571–1575 the norm-one approximate identity of `L¹(G)` (7.4, `p.42`). Every page cited in `README.md:2044–2052` contains what the entry says it does. Sampled targets whose locators the diff did not change (1.1, 1.2 Dales, 2.1, 2.2, 3.1 Dales/Pedersen, 4.3, 6.1, 6.2, 7.5, 7.6, 8.1, 8.2) stand as in the previous report.

**Adversarial table.** Rows for untouched statements are carried from the previous report (`PRREVIEW-BanachAlgebras~2`, table rows as listed there, all "pass"); the rows below are computed at this head.

| Statement / locator | Instances | Values on each side | Result |
|---|---|---|---|
| `wiener_inversion`, Suggested:106–112; README:866–873 | f = δ₀ − δ₁/2 | series 1 − z/2, modulus ≥ 1/2 on the circle; g(n) = 2⁻ⁿ (n ≥ 0), 0 (n < 0): Σ\|g\| = 2, series 1/(1 − z/2); product 1 | pass |
| same, hypothesis needed | f = δ₀ − δ₁ | series 1 − z = 0 at z = 1; any g ∈ ℓ¹ has a continuous series, so (1 − z)ĝ(z) = 1 fails at z = 1 | pass, hypothesis not droppable |
| same, degenerate | f = 0 | series 0 at every z, hypothesis false, statement vacuous; f = δ₀ gives g = δ₀ | pass |
| same, generality | README vs Lean | both: f ∈ ℓ¹(ℤ), nonvanishing series ⇒ g ∈ ℓ¹(ℤ) with product 1; `∑'` is the honest sum since Σ\|f(n)\|\|z\|ⁿ = ‖f‖₁ < ∞ | pass |
| Wiener Check, README:957 | as above | 1 − z/2, Σ 2⁻ⁿ = 2, f * g = δ₀: (f*g)(0) = 1·1 = 1, (f*g)(k) = 2⁻ᵏ − 2⁻ᵏ = 0 for k ≥ 1 | pass |
| `multiplier_extension`, Suggested:157–171; README:1179–1186 | A = E = ℂ, π = multiplication, l = pure 1, C = 1 | ‖π‖ = 1; m = (L_z, R_z), ‖m‖ = \|z\|; Φ(m) = multiplication by z, ‖Φ m‖ = \|z\| = 1·1·\|z\| | pass |
| same, non-normalised unit | A = ℂ with norm 2\|z\|, E = ℂ, C = 2 | ‖π‖ = 1/2, ‖m_z‖ = sup{2\|za\| : 2\|a\| ≤ 1} = \|z\|, ‖Φ m_z‖ = \|z\| = 2·(1/2)·\|z\| | pass, bound attained |
| same, bound route | general m, y = Σ π(a_i)x_i | π(S_m e)π(a_i)x_i = π(S_m(e a_i))x_i → π(S_m a_i)x_i by `hl`; ‖π(S_m e)‖ ≤ ‖π‖‖S_m‖‖e‖ ≤ ‖π‖‖m‖C eventually | pass, well-defined on the dense span |
| same, multiplicativity and unit | Multiplier.lean:179, probe `rfl` | (mn).fst = m.fst ∘ n.fst; 1.fst = id; Φ(mn)π(a)x = π(S_m S_n a)x = Φ(m)Φ(n)π(a)x | pass, order matches |
| same, wrong model | zero map | Φ(1) = 0 ≠ 1, and Φ(1)π(1)1 = 0 ≠ π(1)1 = 1 (README Check `:1201`) | excluded |
| same, degenerate | A = 0 | 𝓜 = {0}, hess forces E = 0, Φ = 0 unique, bound 0 ≤ C·0·0 for every C; `hC` unused here (P3 note only) | pass |
| same, filter | l = ⊥ | every `Tendsto` vacuous; `[l.NeBot]` excludes it | pass |
| 4.2 Check, README:1201 | as row 6 | \|z\| = C‖π‖‖(L_z,R_z)‖ with C = ‖π‖ = 1 | pass |
| Closest-scalar wording, README:252–270 | a = (−1,1,i), b = (1,1,i) | centres 0, (1+i)/2, 1+i; q = 2, 3√2/2, 3√2; 2 + 3√2/2 ≈ 4.121 < 4.243 | pass, values unchanged |
| `positive_continuous` vs source, README:322–325, `rieffel-cstar-2008` 363–385 | ℂ with norm 2\|z\|, φ = id | ‖φ‖ = 1/2, φ(1) = 1: README keeps φ(1)/‖1‖ ≤ ‖φ‖ ≤ φ(1); source's equality needs ‖1‖ = 1 | pass for the README |
| Docstring inventory, Suggested:13–35 | stated vs named | Wiener and multiplier extension now stated; nonunital Gelfand comparison, convolution algebra, balanced tensors, Arens, Hochschild, diagonals, Johnson, Wendel, regular action, measure uniqueness named as non-statable | pass |

**Cross-roadmap citations resolved.** `Completed/OneParameterSemigroups/README.md` exists on main (`fa41b37`). No other citation changed; `roadmaps resolve` finds nothing unresolved. Ownership against open pull requests whose files the brief does not give was not checked; the two new statements are the objects the previous report already searched (Wiener: no hit; double centralizers: CStarAlgebras C1 owns only the C*-multiplier targets).

## Not verifiable

- **Dales, Runde, Pedersen, Conway**: paywalled or unlinked, as in the previous report; none of the changed lines cites them anew except the Conway reference entry (now by DOI). Not re-read.
- **Schwenninger, Lomonosov**: untouched by the diff; the previous report's checks stand.

## Source issues

- **Gap** in rieffel-cstar-2008 at the proposition of §6.1, printed p.11 (lines 363–368): the source says the norm of a positive functional on a complete unital *-normed algebra equals its value at the unit; it should assume the unit has norm one, since ℂ with norm 2|z| and the identity functional gives norm 1/2 and value 1; affects a stated result (the README keeps the two-sided bound).
- **Misprint** in rieffel-cstar-2008 at §7.1, printed p.13 (line 428): the source's Cauchy–Schwarz display for the left-ideal property squares the form at b alone and trails off; it should bound by the product of the forms at b and at a*ab; affects nothing.
