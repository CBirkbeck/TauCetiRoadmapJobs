# FIX-DESIGN-ConstructiveFieldTheoryPhi4~10

Repair of the findings of REV-DESIGN-ConstructiveFieldTheoryPhi4~9 (one review, three P3 findings). Files edited: `packages/ConstructiveFieldTheoryPhi4/design/README.md`, `packages/ConstructiveFieldTheoryPhi4/design/plan.json`, `packages/ConstructiveFieldTheoryPhi4/sources.toml`.

## F01 (P3) — applied

Old → new: every README citation that carried an extraction line number now carries a printed locator (equation, theorem, section, property or paragraph, with the page), and no extraction line number is left in the README. Examples: "Sokal, lines 405–409" → "Sokal, Section 2.2, properties (a)–(b), p. 327"; "Aizenman–Duminil-Copin, lines 1984–1985 and 2020–2022" → "the first paragraph of Section 7, p. 44, and the paragraph after Proposition 7.2, p. 45".

Verification. The finding is right: a line of the worker's extraction cannot be found in a printed copy. Pages were computed from the page markers of the cached texts and checked against the printed page numbers on each page: Aizenman–Duminil-Copin, Peled–Spinka, Simon and Duminil-Copin (arXiv) have printed page = PDF page; Sokal (Numdam) has printed page = PDF page + 315 (`sokal-1982 line 399` carries 327); Fröhlich's preprint pages are the "- n -" headers (`frohlich-1982 line 265` is "- 13 -"). Equation numbers on Sokal pp. 326–329 and 342 were read from rendered page images of the cached PDF ((2.17), footnote 2, (2.18)–(2.30), (2.33), (3.4)–(3.5)), since the extraction drops displays.

Where the suggested table was imprecise I used the exact place: Peled–Spinka 1283–1284 is Section 2.7.1 (not 2.7), p. 27; Aizenman–Duminil-Copin 1996–2002 is the site-splitting paragraph of Section 7.1 on p. 45 (Section 7.1 opens on p. 44); Lebowitz–Ruelle–Speer is cited by "Section 1, the sentence of (1.2)" and "Lemma 2.4", which need no page.

Pattern repaired elsewhere: the References entries now say which version's page numbers are cited (arXiv versions; Sokal's printed pages; the Fröhlich preprint's pages and equations) and list the newly named equations; in `sources.toml` the line-only locators of `frohlich-1982` and `lebowitz-ruelle-speer-2012` were replaced by printed locators (and the "line locators" phrase removed from the latter's version note), and the locators of `sokal-1982` and `aizenman-duminilcopin-2021` now list every equation and page the README cites. The plan's `where` fields keep their line numbers, as the finding allows. For 3.7, the `where` field gives both forms.

## F02 (P3) — applied

Old → new: the volume index of the reachability scheme is k, the mass stays m. README 7.2: `R_{n,m}`, `μ_{n,m}`, `Σ_{n,m}`, `T^{n,m}`, "as m → ∞" → `R_{n,k}`, `μ_{n,k}`, `Σ_{n,k}`, `T^{n,k}`, "as k → ∞"; 7.3: `liminf_m` → `liminf_k`; 7.4: "R_{n,m} → ∞" → "R_{n,k} → ∞ as k → ∞", Check "for every n and m" → "for every n and k". The same changes were made in plan entries 7.2, 7.3 and 7.4.1.

Verification. The clash is real: 7.4 fixes the mass m and the scheme of 7.2 indexes volumes by m in the same formula. k is unused elsewhere in Layer 7. Plan entry 7.4 (the covariance) has no volume index, so only 7.2, 7.3 and 7.4.1 changed. Other uses of m in the README (the exponent in `(1 + Σφ²)^m` in 1.4 and 2.2, the block index in 2.1, the subcurrent in 3.4) never occur in a statement that also involves a mass, so they were left as they are.

## F03 (P3) — applied differently

Old → new: 3.7's Newman bound for t ∈ [0, ∞)^V → for z ∈ ℂ^V, `|⟨exp(Σ_x z_xφ_x)⟩| ≤ exp(½⟨(Σ_x |Re z_x| φ_x)²⟩) = exp(½ Σ_{x,y} |Re z_x||Re z_y|⟨φ_xφ_y⟩)`, with a proof route, a new negative-control Check, and 3.1 added to *Needs*. The plan's 3.7 changed the same way.

Why it differs from the suggested repair: the finding is right that item (j) is stated for complex coefficients. The display, read from a rendered image of `sokal-1982` p. 328 (it is missing from the extraction at `sokal-1982 lines 434–435`), is (2.27). Its right side uses `|Re z_i||Re z_j|`, not `|z_i||z_j|`. The suggested `|z_x|` form is true but strictly weaker. Example: for ρ_I on one site and z = 2i it gives `e²`, while (2.27) gives 1 and the true value is `|cos 2| = 0.416`. I stated the source's sharper form, which the same route proves:
- `|e^w| = e^{Re w}` bounds the left side by `⟨exp(Σ Re z_x φ_x)⟩`;
- Griffiths I (3.1) on the absolutely convergent expansion, where convergence comes from 1.2 integrability, replaces each Re z_x by |Re z_x|;
- the Gaussian inequality of 3.5, summed against `1/(2n)!` with odd moments zero by 1.2, gives the bound.

New Check, the review's two-site example: J = 1, z = (1, −1) gives the value 1.329. The signed form gives 1.269, so dropping the absolute values is false. The stated right side is 5.822. The one-site z = iy instance shows that only the real parts enter.

## Checks run

Dependency check (gate), output in full:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

The gate shows no UPWARD, CYCLE or `moved:` line.

Other checks:
- **Citation resolve** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found nowhere.
- **Parsing:** `plan.json` parses (36 owned targets); `sources.toml` parses (14 sources).
- **Formatting:** a search for LaTeX delimiters, and for "line N" anywhere in the README, finds nothing.
- **Lean:** the package has no `Suggested.lean` at this design stage, so no `#check` file was elaborated and no Lean command was run.
- **Gate failures:** none were listed for this round.
- **Sources:** no new source was needed, so there is no `needs-references.toml` request.

## Adversarial pass on the changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 3.7 Newman, complex form | ρ_I one site, z = a = 2 | `cosh 2 = 3.762 ≤ e² = 7.389` | holds |
| same | ρ_I one site, z = 0.5 + i | `|cosh(0.5 + i)| = 0.751 ≤ e^{0.125} = 1.133` (the `|z|` form gives 1.868) | holds; Re form sharper |
| same | ρ_I one site, z = 2i | `|cos 2| = 0.416 ≤ 1` (the `|z|` form gives 7.389) | holds |
| same | two Ising sites, J = 1, z = (1, −1) | left 1.32926; signed right side `e^{1−tanh 1}` = 1.26922 (fails); stated right side `e^{1+tanh 1}` = 5.82171 | holds; signed form false, added as Check |
| route, middle step | same | `⟨e^{σ₁−σ₂}⟩ = 1.329 ≤ ⟨e^{σ₁+σ₂}⟩ = 3.433 ≤ 5.822` | each inequality holds |
| degenerate | z = 0; V = ∅; ρ = δ₀ | `1 ≤ 1` in each case | equality |
| J = 0 product | ρ_I, z = (a, b) real | `cosh a cosh b ≤ e^{(a²+b²)/2}` (a = b = 1: 2.381 ≤ 2.718) | holds |
| hypothesis needed | `¾δ₀ + ⅛(δ₁ + δ₋₁)`, z = a = 2 | 1.691 > `e^{1/2}` = 1.649 | fails outside the class (existing Check) |
| Gaussian boundary (outside the class) | `gaussianReal 0 v`, z = a + iy | `e^{(a²−y²)v/2} ≤ e^{a²v/2}` | consistent |
| consequence `⟨e^{a|φ_x|}⟩ ≤ 2e^{a²⟨φ_x²⟩/2}` | ρ_I, a = 1 and a = −1 | `2.718 ≤ 3.297`; `0.368 ≤ 3.297` | holds |
| series identity | n = 2 | `(2n − 1)!!/(2n)! = 3/24 = 1/8 = 1/(2²·2!)` | correct |
| 7.2–7.4 renaming | 7.4 sentence at fixed m = 0, d = 3 | `b_n = −3`, limit variable k for `R_{n,k}`, no free index | clash removed |
| 7.4 Checks after renaming | d = 1, m = 1 | `C_1(1_Q, 1_Q) = 2 − (1 − e^{−2}) = 1.1353 = 1 + e^{−2}`; `⟨(T^{n,k}_{1_Q})²⟩ = 1` | unchanged |
| locators (F01) | a sample of 49 new locators against the cached texts | e.g. `sokal-1982` (2.27) on p. 328; `peled-spinka-2017` (52) on p. 35; `aizenman-duminilcopin-2021` (5.10) on p. 24; `frohlich-1982` (13) on p. 5; `simon-2020-twelve-tales` (5.21) on p. 37 | all match |

## For the maintainer

- **Section ids:** no section, layer or target id changed, and no name that other roadmaps cite changed.
- **Variable rename:** the volume index of the reachability scheme is now k (`R_{n,k}`, `μ_{n,k}`, `Σ_{n,k}`, `T^{n,k}`). ConstructiveFieldTheoryPhi4PartII, which consumes 7.2, should use the same letters.
- **Newman's bound:** 3.7 now states the complex form of Sokal (2.27). The inherited bound in the 4.2 API ("Newman's exponential bound" for `μ_{J,ρ}`) refers to it unchanged.
- **Ownership:** no new construction was introduced, so ownership is unchanged. The citation resolver checked against main and the open heads of the index.
- **Untrusted text:** the review contained no suspicious instructions.
