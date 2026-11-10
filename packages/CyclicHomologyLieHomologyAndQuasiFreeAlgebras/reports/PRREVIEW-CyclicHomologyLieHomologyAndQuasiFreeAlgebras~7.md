# Review of CyclicHomologyLieHomologyAndQuasiFreeAlgebras (pull request #2037 at 90d8ff4)

**Verdict:** accepted

This is an incremental re-review of the 6 lines changed since `44c2b15`. All of them are in `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/README.md`, Research context, lines 1031–1034. `Suggested.lean` and `metadata.toml` are unchanged.

There are no findings. The one finding of the previous report is repaired, and the repair introduced no new problem.

Source id used below: `GFM10` is González-Férez–Marín, *Glasg. Math. J.* 52A (2010), 83–91, the publisher's PDF (9 pages) in the sources cache.

## Previous findings

- R01 — repaired: "González-Férez and Marín (2007) answered no, by a ring with a monomorphism of firm modules that is not a kernel (González-Férez–Marín 2010, p. 83)". The locator now names the 2010 paper, whose p. 83 carries the statement (`GFM10` lines 37–39).

## Verified sound

**The changed passage (README lines 1030–1034), against `GFM10`.** The diff replaces "loc. cit., p. 83" with "González-Férez–Marín 2010, p. 83" and re-wraps the sentence; no other word changes. Each of the paragraph's three locators was read again at this head:

- Quillen's question, "(González-Férez–Marín 2010, p. 83)": `GFM10` lines 30–31, on PDF page 1, whose header (line 5) gives the printed range 83–91, so it is printed p. 83.
- The 2007 negative answer, "(González-Férez–Marín 2010, p. 83)": `GFM10` lines 37–39, same page. The paper's reference [3] reports a ring and a monomorphism of firm modules that is the kernel of no morphism; reference [3] is the 2007 *J. Algebra* 318 paper (`GFM10` lines 404–405), which agrees with the README's References entry at line 1088.
- "abelian if and only if the composite of two kernels is a kernel (González-Férez–Marín 2010, Theorem 3, p. 86)": `GFM10` lines 156–160, conditions (1) ⟺ (4) of Theorem 3, on PDF page 4, whose running head (line 148) prints 86.

No "loc. cit." in the README now follows a work other than the one it means: the remaining eleven (lines 408, 650, 677, 679, 681, 723, 942, 967, 970, 972, 976) are untouched text passed by the earlier reviews. The paragraph names no roadmap, section, target or Lean declaration, so nothing cites or depends on it.

**Gate, dependency check, build.**

- The worker's gate at `90d8ff4` passes every check, including `build=0`.
- My run of the gate against the configured public order differs in one line only: `depcheck: NOT IN ORDER: CyclicHomologyLieHomologyAndQuasiFreeAlgebras (insert it after its last supplier)`. The candidate merge order lists the roadmap at line 331, and "not in the merge order" is not a finding. All text scanners are 0 (`set_option=0 … latex=0 … prnum=0 sorry-data=0 … residue=0 … readme-ids-missing=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0`).
- The dependency check (`--movable`, candidate order, `--pr 2037`) prints `depcheck: 234 roadmaps, 2267 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/CyclicHomologyLieHomologyAndQuasiFreeAlgebras/Suggested.lean` gives no error and exactly five warnings, `declaration uses 'sorry'`, at lines 80, 106, 119, 130 and 135.
- `git diff --quiet 44c2b15 HEAD -- …/Suggested.lean` succeeds: the Lean file is byte-identical to the one the previous reports elaborated, probed for padding and compared with the README (8 entries of `signatures.md`, 0 lost binders). Those results stand.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Citations, overlaps, ownership.**

- `overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id that only an open revision defines. The change adds no citation.
- The one lead in `citations.md`, `IsQuasiFree.exists_lift_of_nilpotent`, is declared at `Suggested.lean` line 106 (the warning at 106 above is its `sorry`).
- The pull-request description does not quote the changed sentence; its Layer 5 and Sources paragraphs still agree with the head (firm and unitary modules, Kato–Ohtake, González-Férez–Marín 2007 and 2010 listed).

**Sample.** The seeded targets (1.1, 1.2, 1.4, 2.1, 2.5, 3.1, 3.2, 4.2, 4.4, 4.5, 4.6, 5.1, 5.2, 5.3, 5.6) lie outside the changed passage; none falls in Research context. They were verified in the earlier rounds and are carried in the table. The README flags no locator as unverified.

**Remarks on untouched text (no change requested).**

- The Mathlib contract (line 173) lists `TwoSidedIdeal`, which no *Needs* line names; the ideals of 3.2, 4.4–4.6 and 5.6 are its natural consumers.
- In 5.4's valuation-ring Check, `x` is both the indeterminate and "a nonzero `x ∈ m`"; the argument is valid for either reading.

**Adversarial table.** The first row is the changed passage, with values read this round. The others are carried from report ~6 (and through it from reports ~1–~5) for statements the diff leaves untouched.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Research context, lines 1030–1034 | `GFM10` lines 5, 30–31, 37–39, 148, 156–160, 404–405 | PDF page 1 = printed p. 83 (range 83–91); question at 30–31; [3] = *J. Algebra* 318 (2007), 377–392, so p. 83 can only be the 2010 paper; mono not a kernel at 37–39; Theorem 3 (1) ⟺ (4) on PDF page 4 = p. 86 | holds; all three locators name the 2010 paper | — |
| 5.4 Check: unitary, not firm (field `k`) | `V = ⋃ k[x^(1/2ⁿ)]_(x^(1/2ⁿ))`, `A = m`, `M = m/xV`; `k = ℤ/6`; `k = ℤ` | value group `ℤ[1/2]`; `m = m²`; `AM = M`; `A ⊗_A M = m/xm`; kernel `≅ V/m = k ≠ 0`; over `ℤ/6`, `2·3 = 0`; over `ℤ`, `(t)` prime, not maximal | holds (report ~6) | — |
| 5.4 *Needs* | the three bullets | `A ⊗_A M` via `Unitization ℤ A`, `AM`, `e aᵢ = aᵢ` from 5.1 | holds (report ~6) | — |
| Out of scope (Marín 1998, González-Férez–Marín 2007) | zbMATH reviews; 5.5's Checks; `⊕_(n∈ℕ) ℤ` | `(ℤ, 0, …)`: `1 ∉ im φ = 0`, not acceptable; `εℤ[ε]`: `a₁a₂ = 0 ∈ im φ`; xst ⟺ unitary is firm; `⊕ℤ` has local units | agrees with 5.4, 5.5 (report ~6) | — |
| 3.1 (coefficient complex) | `W = k[u, u⁻¹]/uk[u]`; `𝔽_p[x]`, `D = x d/dx` | `u·u⁻ʲc = u⁻ʲ⁺¹c`, `u·c = 0`; `L_D = m = 0` on `x^(m−1)dx` with `p ∣ m` | holds (report ~6) | — |
| 5.4 definitions | `A = 2ℤ`, `M = ℤ/2`; unital `A` | `A ⊗_A M = ℤ/2`, `AM = 0`, multiplication `0`; firm ⟺ unital | holds (report ~6) | — |
| 5.4: local units ⇒ firm | `A = ⊕ℤ`, `M = A/⊕_(n≥1)ℤ` | `e₀·1 = 1`; `Σ aᵢ ⊗ mᵢ = e ⊗ Σ aᵢmᵢ = 0` | holds (report ~6) | — |
| 5.5 statement and Checks | `(ℤ, M₂(ℤ), ℤ², ℤ²)`; `(ℤ, 0, 0, 0)`; `εℤ[ε]` | `φ(e₁ ⊗ e₁) = 1`, `ψ(eᵢ ⊗ eⱼ) = Eᵢⱼ`; `0` against all abelian groups; both categories `0` | holds (report ~6) | — |
| 1.1 | `X = k♮`; `k → M₂(k)` | `Tor_n = k` for even `n`, `0` for odd; `1 ↦ tr I₂ = 2` | holds (report ~6) | — |
| 1.2 | `Ext⁰`; ground ring ℤ | `Hom(k♮, k♮) = k`; `ℤ[σ]`, `|σ| = 2` | holds (report ~6) | — |
| 1.3 | Δ against Λ | `|Λ([n], [0])| = n + 1`; `BΛ ≃ K(ℤ, 2)` | holds (report ~6) | — |
| 2.1 | `𝔰𝔩₂(ℚ)` | `d(e∧f∧h) = 0`; the unsigned formula gives `4h` | holds (report ~6) | — |
| 2.2 headline | `r = p = 2`; `p = 0` | `[gA E₁₂, gA E₂₁] = gA(E₁₁ − E₂₂)`; range all of `End K` | holds (report ~6) | — |
| 2.3 | `[x, y] = y` | coinvariant `H₂ = k`, `H₂(𝔤′) = 0` | holds (report ~6) | — |
| 2.4 | `k`; `k × k`; `k[ε]` | exterior algebra on degrees 1, 3, 5, …; primitives double; `dim HC₀(k[ε]) = 2 = dim H₁` | holds (report ~6) | — |
| 2.5 | `𝔽_p[x]`; `M₂(k)` | `[x^(p−1)dx] ≠ 0`; `tr[E₁₂, E₂₁] = 0` in `A/[A, A]` | holds (report ~6) | — |
| 2.6 | `A = k`, `n = 2`, `i = 0, 1, 2` | `H₁(𝔤𝔩₁) = k → H₁(𝔤𝔩₂) = k`; `H₂ = 0` on both sides | holds (report ~6) | — |
| 4.1 headlines | `n = 0, 1`; `A = 0, K, K[x], K[ε], K[x, y]` | `[].prod = 1` forces `R = 0`; projective dimensions `−∞, 0, 1, ∞, 2` against quasi-free yes, yes, yes, no, no | holds (report ~6) | — |
| 4.2 headlines | `FreeAlgebra k Empty`; `ℤ/2` over ℤ | `π 1 = 1`; `g(1 + 1) = 2 ≠ 0` in `ℤ/4` | holds (report ~6) | — |
| 4.4 | `k[x]`; `k[x, y]` | `H_*(X) = (k, 0)`; `[x dy] ≠ 0` against `HP₁ = 0` | holds (report ~6) | — |
| 4.6 | `J = A`; `k[x, y]/(xy) ⊃ (x)` | identity; `[x dy] ≠ 0` in bidegree `(1, 1)` | holds (report ~6) | — |
| 5.6 | `A = R`; `[[1,1],[0,0]]` against `diag(1,0)` | Euler characteristic onto `K₀(R)`; `(P − Q)³ = 0`, trace `0` | holds (report ~6) | — |
| 1.4, 3.2, 4.3, 4.5, 5.1–5.3, Conventions | as in reports ~3 and ~4 | e.g. `H_n(ℤ/2, 𝔽₂) = 𝔽₂`; `a ∘ 1 = a`; `A/A² = k` for zero multiplication | holds (report ~6) | — |

## Not verifiable

- González-Férez–Marín 2007 (*J. Algebra* 318) is paywalled (DOI prefix 10.1016), and no open copy was found in the earlier rounds. The changed sentence attributes the negative answer to it only through the 2010 paper's p. 83, which was read; no locator into the 2007 paper remains in Research context.
- The Wodzicki 1989 pages are unchanged text, as in the previous reviews.

## Source issues

- none
