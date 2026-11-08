# Repair report: SobolevMapsBetweenManifolds design, round 5

There was one review with one finding (F01, P3). The finding is correct: six theorem targets had
their locator only in `plan.json`. Every one of the six now has a locator at the claim in the
README. For four of them (§1.4, §3.2, §3.3, §4.5) I used the plan's locator, as the review asked.
For the other two I wrote a different locator, because the plan's did not support the claim:

- §4.4: the plan's locator, HeikkilaPankka2025 lines 22–26, says nothing about `C¹` maps.
- §5.3: the plan's locator, Rickman1993 Ch. I §1, cannot be checked and is unlikely to state the
  claim. Hajlasz2009 lines 104–106 does state it, in a cached text that can be read.

`plan.json` and `sources.toml` were changed to match.

Files changed:

- `packages/SobolevMapsBetweenManifolds/design/README.md`
- `packages/SobolevMapsBetweenManifolds/design/plan.json`: only the `locator` of 4.4 and 5.3.
- `packages/SobolevMapsBetweenManifolds/sources.toml`: only `cited_for` lists and one `locator`.

No statement, hypothesis, Check, `*Needs:*` line or target changed. `plan.json` still has 29
targets, 104 tests and no gaps.

## F01 (P3) — applied differently

§1.4 now cites "(Mazya2011 §1.1)", §3.2 "(Lee2012 Ch. 16)", §3.3 "(Lee2012 Ch. 6)" and §4.5
"(Mazya2011 §1.1, locality of weak derivatives)", as asked. §4.4 cites "Ziemer1989 Ch. 2 §2.1"
instead of HeikkilaPankka2025 lines 22–26. §5.3 cites "Hajlasz2009 lines 104–106" instead of
Rickman1993 Ch. I §1.

**Why the finding is right.** I checked every `### k.n` section of the README for a source key.
Before this round, §1.4, §3.2, §3.3, §4.4, §4.5 and §5.3 had none. The other 23 sections each
cited their plan locator's source. All 29 sections do now, and each section's key matches the
`plan.json` locator's `source` (checked by script).

**Why two of the suggested locators were not used.**

- **§4.4** says that a `C¹` map lies in every class and that `mfderiv f` is a weak differential.
  HeikkilaPankka2025 lines 22–26, read in the cached arXiv v2 text, only define the class, `‖Df‖`
  and `J_f` of quasiregular maps:
  - lines 22–23 define the class `W^{1,n}_loc(M, N)`;
  - line 25 gives the distortion inequality;
  - lines 26–27 say what `‖Df‖` and `J_f` are.

  Nothing there is about `C¹` maps. The fact §4.4 extends from charts is the standard one that
  a `C¹` function's classical derivative is its weak derivative, by integration by parts. That is
  part of the definition of weak derivatives in Ziemer1989 Ch. 2 §2.1, which §1.2 already cites.
  That locator is now in the README. The `plan.json` 4.4 locator is now `Ziemer1989`, "Chapter 2,
  §2.1". In `sources.toml`, Ziemer's `cited_for` gains 4.4 and HeikkilaPankka2025's `cited_for`
  drops it (it now reads "4.3 weak differential (lines 22–26)").
- **§5.3** has two parts:
  - The linear bound `(α/b)‖A‖ ≤ ‖A‖' ≤ (β/a)‖A‖` follows from the definition of the operator
    norm, and the README now says so. The proof is two lines: `|Av|'/|v|' ≤ β|Av|/(a|v|)` and
    `|Av|'/|v|' ≥ α|Av|/(b|v|)`, then take suprema.
  - The substantive claim is that two continuous metrics are uniformly comparable on compact sets,
    so T3 does not depend on the metric.

  The review itself says it could not check whether Rickman1993 Ch. I §1 states this, and neither
  can I: the text is paywalled and settled as uncertified. That section covers maps of Euclidean
  domains, so a comparison of Riemannian metrics is unlikely to be there. Hajlasz2009 (certified,
  cached) states in Section 1, lines 102–106, that all Riemannian metrics on its compact smooth
  manifolds are equivalent, so the choice of metric does not matter. That is the compact case of
  §5.3's claim together with its consequence. The README now cites it with its scope ("for
  Riemannian metrics on a compact manifold; the compactness argument uses only continuity"). The
  `plan.json` 5.3 locator is now `Hajlasz2009`, "lines 104–106". In `sources.toml`, Hajlasz2009's
  `locator` and `cited_for` gain lines 104–106 and 5.3, and Rickman1993's `cited_for` drops 5.3.
  Rickman1993 is still cited for 5.1, 5.2, 6.1 and 6.3.

**References section.** The `Hajlasz2009` entry now lists lines 104–106. The `Ziemer1989` entry
now says that Ch. 2 §2.1 covers weak derivatives, including the classical derivative of a `C¹`
function.

**Pattern searched.** I looked for two patterns:

1. A locator recorded only in the plan. There are no others: all 29 sections now cite their
   source.
2. A locator citing a passage that does not state the claim. I checked the other
   HeikkilaPankka2025 and Rickman1993 citations:
   - §4.3 (HeikkilaPankka2025 lines 22–26) is a definition target, and line 26 names the weak
     differential it defines.
   - §5.1 (HeikkilaPankka2025 line 26) and line 26 both say "operator norm of the weak
     differential".
   - §6.2 and §6.4 (HeikkilaPankka2025 lines 25–27) define objects through the `J_f` of line 26.
     The theorem of §6.4 cites Lee2012 Ch. 16.
   - §5.2, §6.1 and §6.3 cite Rickman1993 Ch. I §1 for Euclidean statements: the `Lᵖ` condition
     through `|f'|`, `J(x, f)`, and `|J| ≤ |f'|ⁿ`. §6.1 says "when `V = W = ℝⁿ`".

   None of these needed a change.

## Checks run

**Dependency check** (the brief's command), complete output:

```
candidate: SobolevMapsBetweenManifolds is not in the merge order yet; checked as if placed after GlaubermanZStar (the intake inserts it when its design is accepted)
depcheck: 230 roadmaps, 2241 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Being outside the merge order is expected at the design stage.

**Citations.** `roadmaps resolve` on the README was checked against main `f2eaf12` and 463 open
heads. It found no cross-roadmap citation and no Lean name that exists nowhere. No cross-roadmap
citation changed this round.

**Formatting.** I reflowed the edited paragraphs to at most 100 characters per line. Line 222 was
already 101 characters before this round and is untouched. There are no LaTeX delimiters and no
process words in the new text.

**`Suggested.lean` and `#check`.** The design stage has no `Suggested.lean`, so there was nothing
to elaborate and no `#check` comparison to make. No Lean name was added or removed.

**Ownership.** The repair adds no object, carrier or construction, so ownership against main and
the open pull requests is as the round-4 review recorded it. I ran no new object greps.

**Sources.** No text was fetched. Hajlasz2009 and HeikkilaPankka2025 were read from the cached
certified texts, at the lines cited. Ziemer1989, Mazya2011, Lee2012 and Rickman1993 are settled
as uncertified and are cited only by locator. Nothing was added to `needs-references.toml`.

**Adversarial pass on the changed text.** Statements are unchanged, so each row re-computes the
target at its new locator and checks that the locator's setting fits the README's generality.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.4 (Mazya2011 §1.1) | `u = x₁` on `ℝ²`, `V = B(0, 1/2)`; `u = log|x|`, `p = 2` | gradient `e₁`, `Du = ⟨e₁, ·⟩`; `∫_V |x|^{−2} = 2π∫_0^{1/2} r^{−1} dr = ∞` | local space on relatively compact `V`, as the locator's local spaces | locator added |
| §3.2 (Lee2012 Ch. 16) | `g = 1/x` on `(0, ∞)`; `0`-manifold | `sup_{[a,b]} 1/x = 1/a`, `∫_0^1 dx/x = ∞`; compact sets finite, counting measure | integration in charts; class local, not global | locator added |
| §3.3 (Lee2012 Ch. 6) | `M' = ℝ × D`, `f(x, d) = d`, `s = {0} × D`; `D = ℤ` | `f(s) = ℝ`, not null; `f(s) = ℤ`, null | Lee's manifolds are second countable. The README's countable-cover hypothesis is the general form, and the Check covers it | locator added |
| §4.4 (Ziemer1989 Ch. 2 §2.1) | `f(t) = t|t|`; `n = 0`; `p = ∞` | `∫ t|t| φ' = −∫ 2|t| φ`, so `Df = 2|t| = mfderiv f`; zero tangent space, `Df = 0`; `2|t|` bounded on compacts | integration by parts is the locator's fact; chart representatives are `C¹` on open `Ω_{x₀y₀}(f)` | locator replaced |
| §4.4, old locator | HeikkilaPankka2025 lines 22–26 | the lines name `W^{1,n}_loc(M, N)`, (1.1), `‖Df‖`, `J_f`; no `C¹` statement | does not support the claim | not used |
| §4.5 (Mazya2011 §1.1) | `sign(x₁)` on half-planes; `tanh` into `(−1, 1)` | half-planes miss `{x₁ = 0}`, no class on `ℝ²`; `Df = 1 − tanh²` both ways | restriction and gluing are locality of weak derivatives | locator added |
| §5.3 linear bound | `g'_N = 4g_N` (`α = β = 2`, `a = b = 1`), `A = id` on `ℝ`; `|w|' = √(w₁² + 4w₂²)`, `A = id` on `ℝ²` | `‖A‖' = 2 = β/a = α/b`; `‖id‖' = 2 = β/a ≥ α/b = 1` | both bounds attained or respected | "read off the definition" added |
| §5.3 compact comparability (Hajlasz2009 lines 104–106) | `e^{2x}dx²` against `dx²` on `ℝ`; `K = [−R, R]` | ratio `e^x`, unbounded on `ℝ`, in `[e^{−R}, e^{R}]` on `K` | locator states the compact case; the README states its scope | locator replaced |
| §5.3 degenerate | `n = 0`; `A = 0` | empty unit sphere, any constants; `0 ≤ 0 ≤ 0` | holds | none |
| §5.3, T3 independence | metrics `g`, `g'` on compact `K` | `‖Df‖'` and `‖Df‖` within the constants on `K`; volumes comparable (§3.2) | the same `L^p_loc` condition | none |

## For the maintainer

- No name that other roadmaps cite changed. The section numbering is unchanged. No `plan.json`
  target name changed.
- Intake note, repeated from the review: QuasiregularMaps consumes this roadmap through six
  declared gaps, so this roadmap goes before it in the merge order. The review also asks that the
  merge-order paragraph name RiemannianGeometry's open revision that carries the R4.6 transfer for
  smooth metrics. R4.6 itself is on main, and this roadmap uses it only in the agreement Check of
  §3.1.
- The review contains no suspicious instruction. Its text was treated as data.
