# Review of CompressibleEulerEquationsPartII (pull request #3010 at bcc8535)

**Verdict:** accepted

**Summary.** Accepted. All four findings of the previous review are repaired, and I recomputed each repair:

- the Chaplygin counterexample that is now §2.3's Check;
- the Riccati coefficient `ρ⁻¹(ρc)′` of §3.4 and its compressive sign;
- the integer rescalings of §4.1 with their chart;
- the failure of injectivity of `Ψ_t` at every positive time.

None of these repairs introduces an error. Three small corrections remain, none blocking:

- Rendall 1990 is still cited without locators;
- the eikonal statement of §2.3 drops the restriction below the top of the slab that its Lean form carries;
- the time orientation `[B]` is cited to LorentzianGeometry §7.3, which hands it to its §8.1.

One merge-order fact is left to the human reviewers.

## C01 — Rendall 1990 is still cited six times without a locator

The reduction to the Cauchy problem, on which the transport equations of §3.1 and the routes of §§3.4–3.5 rest, cannot be traced. The citations are §3.1 (lines 344, 357), §3.4 (lines 445, 474–475) and §3.5 (lines 487, 497). Each says "by locator" or "the case treated there". The References entry (lines 704–705) gives only the article's page range, 221–239. Give the theorem or section, with its page, at each citation.

## C02 — §2.3 states `𝒞 = {u = 0} ∩ {t₀ < t < t₁}` without the restriction below the top of the slab

The heading and §2.2 make `𝒞` the characteristic boundary `𝒞(D) = frontier D ∩ {t > t₀}`, with the frontier taken in `𝔐`. Read that way, the equality at line 285 fails at the top face. Take `n = 1`, `c = 1`, `v = 0`, `t₀ = 0`, `t₁ = 1` and `u = t − x`. Then `D = {x > t, 0 ≤ t < 1}`, and `𝒞(D) = {x = t, 0 < t ≤ 1} ∪ {t = 1, x ≥ 1}`, not `{x = t, 0 < t < 1}`.

The Lean statement (`characteristicBoundary t₀ … ∩ {p | p.1 < t₁}`) and the Summary ("below the top of the slab") already have it right. Writing `𝒞(D) ∩ {t < t₁} = {u = 0} ∩ {t₀ < t < t₁}` would bring line 285 into line with them.

## C03 — The time orientation `[B]` is cited to LorentzianGeometry §7.3, which hands it to its §8.1

§1.1 (lines 86–87) says the reflected field defines, "by LorentzianGeometry §7.3, a `C^k` Lorentzian metric time-oriented by `B̃`". The contracts (lines 675–676) list "the time orientation `[B]`" under §7.3. At LorentzianGeometry's head, §7.3 proves that `B` is a continuous timelike field and then says that §8.1 orients time by `[B]`; §8.1 is where time orientations are defined. CompressibleEulerEquations at its current head now cites §8.1 for this. Adding LorentzianGeometry §8.1 at these two places, and to the *Needs:* line of §1.1, would make the citation exact.

## Previous findings

- R01 — repaired: lines 282–284 now read "with `c` and `|v|` bounded on `[t₀, t₂] × E` for every `t₂ < t₁`". The Chaplygin counterexample is now a Check (lines 305–309), and I recomputed it.
- R02 — repaired: lines 531–533 now read "the rescalings `(t, x) ↦ (t/k, x/k)` … `k` a positive integer, with `t*` replaced by `t*/k` and the chart `(t, u, ϑ) ↦ k⁻¹X(kt, u, kϑ)` on lifts to `𝔐`".
- R03 — repaired: lines 466–471 now read "`dα/dt = ρ⁻¹(d(ρc)/dρ)α²` … Data with `α₀ > 0` at the edge (compressive) blow up at `t − t₀ = 2/(3α₀)` … `α₀ < 0` (expansive) decays".
- R04 — repaired: lines 302–304 now read "`Ψ_t` is injective for no `s > 0`, since `Ψ_t(ae) = Ψ_t(−(2c₀s − a)e)` for a unit vector `e` and `0 < a < c₀s`".
- C01 — not repaired: "Rendall 1990, by locator" remains at lines 344, 357, 445, 474–475 and 497, and "the case treated there" at line 487. It is raised again as C01.
- C02 — repaired: lines 274–276 now read "outside the hypotheses as stated, since `v = x/(1 + t)` is unbounded on every slab, but the generators are still the two curves".
- C03 — repaired: the description now reads "part of neither this roadmap nor CompressibleEulerEquations", and it pins that supplier at `4ae1090`, its current head.
- N01 — repaired: lines 706–707 now read "2nd ed., Grundlehren der mathematischen Wissenschaften 256, Springer, 1990, Theorem 1.2.6 (Borel's lemma)".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §2.2 third Check (expanding flow) | `v = x/(1+t)` on `[0,T] × ℝ`; boundary curve | `sup \|v\| = ∞`; `y = x/(1+t)`, `ẏ = −(1+t)^{−3/2}`, so `x = 2√(1+t) − (1+t)`; `x = 0` at `t = 3` | holds; now marked outside hypotheses | none |
| §2.3 statement with the bound | constant state; route | `{u<0} = {x¹ > (v¹+c)(t−t₀)}`; `\|L\| ≤ \|v\| + c ≤ C`, so the past `L`-curve reaches `Σ_{t₀}`; `Lu = 0` | holds | none |
| §2.3 Chaplygin Check | `P = A − 1/ρ`, `ρ = 1/(1+x²)`, `v = −(1+x²)`, `u = −x` | `∂ₓ(ρv) = 0`; `v∂ₓv = 2x(1+x²) = −ρ⁻¹∂ₓP`; `∂ₜu + v∂ₓu = 1+x² = c`; `v + c = 0`, so `L = ∂ₜ` | holds | none |
| same, past curve | `ẋ = −2(1+x²)` through `(1/2, 1)` | `arctan x = π/4 + 1 − 2t`; `x → ∞` at `t = (1−π/4)/2 ≈ 0.107 > 0`; `u(1/2,1) = −1` | point not in `D⁺`: bound needed | none |
| §2.3 second Check (`Ψ_t`) | `s > 0`, `0 < a < c₀s`; `\|y\| = R` | `Ψ_t(ae) = sv₀ + (a − c₀s)e = Ψ_t(−(2c₀s−a)e)`; at `s = R/c₀`, `Ψ_t(y) = sv₀` | holds | none |
| §2.3 `𝒞 = {u=0} ∩ {t₀<t<t₁}` | `n=1`, `c=1`, `v=0`, `t₀=0`, `t₁=1`, `u=t−x` | `𝒞(D) = {x=t, 0<t≤1} ∪ {t=1, x≥1}` against `{x=t, 0<t<1}` | false at the top face; Lean correct | C02 |
| Lean `futureDomainOfDependence_eq_setOf_neg` | Chaplygin data without the bound; constant state | Chaplygin: `(1/2,1)` lies in `{u<0}`, not in `D⁺`; with the bound both sides are `{x¹ > (v¹+c)(t−t₀)}`; `𝒞 ∩ {t<t₁} = {u=0}` | bound needed and present | none |
| §3.4 Riccati coefficient | `n=1`, Riemann invariants `w± = v ± h`, `h′ = c/ρ`; `w₋` constant near `C` | `α = −∂ₓρ`, `β = ∂ₓw₊ = −2(c/ρ)α`; `dλ₊/dw₊ = (ρc)′/(2c)`; `β′ = −(dλ₊/dw₊)β²` gives `α′ = ρ⁻¹(ρc)′α²` | holds | none |
| §3.4 values and sign | `p = ρ²/2`, `Ū_C = (1,0)`; Chaplygin | `c = √ρ`, `(ρc)′ = 3/2`; `α = α₀/(1 − 3α₀s/2)` blows up at `2/(3α₀)`; `α > 0` means `λ₊` decreasing in x; Chaplygin `ρc = 1` | holds | none |
| §4.1 integer rescalings | `k = 2`, `n = 2`; lifted chart | `U(2t,2x)` is still `2π`-periodic in `x²`; `½X(0,u,2ϑ) = (0,0,ϑ)`; `X̃(·,ϑ+2πm) = X̃ + 2πm` descends; `κ′_k/t = κ′(kt)/(kt) → 1` | conditions 1–4 hold | none |
| §4.1 non-integer factor | `λ = 2/3` | `U(3y/2)` has periods `(4π/3)ℤ`, which do not contain `2π` | parenthetical correct | none |
| §1.1 time orientation | LorentzianGeometry §7.3 and §8.1 at `6e0c85c` | §7.3: `B` continuous timelike, and §8.1 orients time by `[B]`; §8.1 defines time orientations | §7.3 alone incomplete | C03 |

The rows for statements this diff does not touch stand as in the previous review, of `084ef25`.

- Source locators checked against the text: 3 (in changed passages only).
  - LuoYu2025a §2, p. 24, `𝒟₀` and `C₀` (LuoYu2025a line 969).
  - LuoYu2025b Definition 2.13 and Remark 2.14, p. 24 (LuoYu2025b lines 910–927).
- Library declarations: none new; `Suggested.lean` is unchanged since `084ef25`.
- Cross-roadmap citations resolved:
  - CompressibleEulerEquations at `4ae1090`: since `a16a9e6` it changed only Conventions, §3.1 prose, the *Needs:* of §3.2 and its LorentzianGeometry §8.1 references. The cited §§3.3, 6.1–6.2, 7.1, 7.3 and 8.1–8.4 are unchanged, and so are all 25 declaration names. Its §3.3 slab statement and its boundedness Check are confirmed.
  - LorentzianGeometry at `6e0c85c`: §7.3 and §8.1.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no change outside the folder.
- Automatic checks: all passed in the worker's run at this head. My own gate run passes every check except the merge-order line, which is set aside below.
- Elaboration: `lake env lean` of `Suggested.lean` gives `sorry` as the only warning, on the six theorems. The elaborated type of `futureDomainOfDependence_eq_setOf_neg` carries the bound on `c` and `|v|` and the restriction `t < t₁`, as §2.3 now does.
- One-tactic probe: not rerun, since the Lean file is unchanged; the previous probe (none closes) stands.
- Ownership against the open heads and main: searched by object for the Chaplygin law, centered rarefaction waves and characteristic initial data. CompressibleEulerEquations assigns characteristic data to this roadmap in its Scope, and no other roadmap owns these objects.

Overlap check: read CompressibleEulerEquations (at `4ae1090`), LorentzianGeometry (at `6e0c85c`) and HamiltonJacobiAndConservationLaws. Ownership is unchanged from the previous review:

- CompressibleEulerEquations owns domains of dependence, developments and their regular boundary; it is cited.
- LorentzianGeometry owns geodesics, optical functions, horizons and time orientations; it is cited.
- HamiltonJacobiAndConservationLaws treats scalar conservation laws and the Riemannian eikonal equation, and shares nothing with this roadmap.

Source independence: changed passages only. Six passages were compared with 2 sources: the §2.3 statement, its new and rewritten Checks, the §3.4 Check, the §4.1 rescaling sentence and the §2.2 Check, against LuoYu2025a p. 24 and LuoYu2025b Definition 2.13 and Remark 2.14, p. 24. None is shared beyond defined names. The largest share is LuoYu2025a's, 9 of 32 citations, as before. The arrangement was not compared again, since no layer was added, removed or reordered.

Research link: Layers 1–4 build the carriers on which Luo–Yu (Ann. of Math. 202, 2025) state the stability of multi-dimensional rarefaction waves: acoustical coordinates and the `κ` equation, `𝒟₀` and `C₀`, compatible characteristic data, the Goursat step and centered rarefaction waves. They also build the acoustical functions of Christodoulou–Miao 2014. This rests on the README and on LuoYu2025a §2, LuoYu2025b Definition 2.13 and §5.4.

## Not verifiable

- Rendall 1990 (§§3.1, 3.4, 3.5): it is paywalled at the publisher, and the sources service holds no open copy.
- Hörmander, *The Analysis of Linear Partial Differential Operators I*, 2nd ed., Theorem 1.2.6: a book with no legal open copy. The edition and series details now given are consistent with the Grundlehren volume.
- Hawking–Ellis 1973, Ch. 6, and Christodoulou 2007 and 2019: books with no legal open copy.
- The numbering of the Annals versions of Luo–Yu I and II: only the arXiv texts were read, and the README cites arXiv v2.

Automatic checks set aside as false positives: the check that every roadmap has a place in the merge order, so that its suppliers are merged before it, said in my own run that this roadmap has none. The candidate merge order lists it directly after its supplier CompressibleEulerEquations, and a roadmap not yet listed is placed after its last supplier, so no supplier comes after it.

## Source issues

- **Misprint** in LuoYu2025b at Definition 2.13, p. 24: the source asks for an open set W′ disjoint from 𝒟₀ that contains C₀, which is impossible since C₀ lies in the closure of 𝒟₀; it should be the union of the leaves C′ for u′ in [0, u*], as the definition then writes; affects nothing.
- **Gap** in LuoYu2025b at Remark 2.14, p. 24: the source says positive bounds on κ′/t suffice because a rescaled foliation is then canonical; it should assume the limit depends on u′ alone, since relabelling u′ normalises it only then; affects nothing.

## For the human reviewers

- Supplier order: both suppliers are open pull requests. LorentzianGeometry, which this roadmap and CompressibleEulerEquations both cite, is still not in the merge-order file, although the dependency check reports no problem.
