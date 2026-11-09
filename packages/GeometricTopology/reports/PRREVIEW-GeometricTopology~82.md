# Review of GeometricTopology (pull request #903 at d3b536e)

**Verdict:** accepted

This is an incremental re-review of the 66 lines changed since `aaa605b` (r81). All of them are in `README.md`; `Suggested.lean` is byte-identical to `a6ba2997`. The one r81 finding is repaired, and the repair introduces no new problem. No finding remains, and the gate passes.

## Previous findings

- **R01 — repaired.** The repair makes all three requested edits:
  - `README.md:6438–6448` (6.2.1 item 5): "Being a direct summand, it reduces mod 2 to a g′-dimensional subspace of `H₁(F′;𝔽₂)` on which 4.3.1's refinement … vanishes … gives `Arf(K)=0` for every smoothly or topologically slice knot K".
  - `:4254–4256` (4.7) now reads "these are Layer 6.2.1's (item 5)".
  - `:8016–8017` (consumers) now reads "Layer 6.2.1's vanishing of the knot Arf invariant on smoothly and topologically slice knots".
  - Scope (`:80–82`) and 6.2.1's *Needs:* (`:6512–6513`, "4.3.1 (the knot Arf invariant and its half-dimensional criterion …)") follow suit.

## Verified sound

**Gate and dependencies.**
- My gate run on `d3b536e` exits 0 and ends with "… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK". The worker's `gate.md` adds `build=0`, and every check passed.
- `--depcheck --movable` prints "depcheck: 238 roadmaps, 2323 edges, 0 problem(s)" and exits 0. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- None of the 15 forbidden supplier names occurs in the README (0 grep hits each).

**Lean** (the file is unchanged, but I re-ran the checks at this head).
- `lake env lean` on `TauCetiRoadmap/GeometricTopology/Suggested.lean` gives 26 `declaration uses 'sorry'` warnings and no other message.
- A scratch copy with `#check @…` for all 26 theorems prints the same types as `signatures.md` and r81. Example: `property_P` quantifies over `K`, `Φ`, `h`, local flatness, `s ≠ ∞` and `F : DehnFilling h s Y`, and concludes `¬SimplyConnectedSpace Y`.
- `signatures.md` counts 27 declarations. The extra one is the tool reading the docstring line 42 ("theorem, Agol's …") as a declaration; there are 26 theorems.
- **Padding probe.** I replaced every `sorry` with `first | rfl | simp | infer_instance | decide | trivial | assumption`. The result is exactly one error per theorem (26 errors at lines 86–333), so no theorem closes in one tactic.
- **Headlines.** The list and the docstring are unchanged and carry over from r80/r81.

**The changed passages, one by one.**

- **Scope, Layer 6** (`:80–84`) and the **Layer 6 introduction** (`:6257–6259`) now name the Arf vanishing and concordance invariance, and place them in 6.2.1. Both agree with item 5.

- **4.5 API bullet** (`:3346–3347`): "`V_K(i) = (−1)^{Arf(K)}` for a knot (Layer 4.5.3)".
  - 4.5.3 states this at `:3521`, and states `V_K(ω)=1` (the same bullet's other value) at `:3546`.
  - The source supports it. In Jones 1985, p. 107, Definition 17 sets `W_K = (1−V_K)/((1−t³)(1−t))` and Theorem 19 makes `W_K(i)` the Arf invariant. `D(i) = (1+i)(1−i) = 2`, so `V_K(i) = 1 − 2W_K(i) = (−1)^Arf`.
  - The repointing from 4.7 is therefore exact.

- **4.7 bullet** (`:4254–4256`) is a pointer to 6.2.1 item 5, not a target. 4.7's *Needs:* rightly does not list Layer 6.

- **6.2 figure-eight Check** (`:6352–6354`). The old version rested on Fox–Milnor, which no layer states (grep: its only occurrence is now the Pyronneau parenthetical at `:6443`). The new version rests on 6.2.1 item 5, which this roadmap owns.
  - Values: `det [[2,1],[1,−2]] = −5`, so the 2×2 form is indefinite and `σ = 0`.
  - `Δ(−1) = 5 ≡ 1 − 4·1 (mod 8)`, so Arf is 1.

- **6.2.1 item 5** (`:6438–6448`).
  - **Route.** Primitivity makes `P ⊗ 𝔽₂ → H₁(F′;𝔽₂)` injective of dimension g′.
    - On P, `q(x) = θ(x,x) = 0` and `q(x+y) − q(x) − q(y) = θ(x,y) + θ(y,x) = 0`.
    - For a knot, `dim R = μ − 1 = 0` (4.3.1, `:2475`), so the polar form is nonsingular on the 2g′-space.
    - 4.3.1's criterion (`:2441–2443`: a q-zero U is its own orthogonal iff finrank U = m) then gives Arf 0.
    - Surface independence (4.3.1, `:2481`) transfers this from F′ to K.
  - **Concordance invariance.** It follows from 6.1's `K # −J̄` (6.1, `:6265–6266`, Livingston Theorem 2.2) with 4.3.1's additivity and its mirror and global-reversal invariance (`:2481–2483`).
  - **Onto `𝔽₂`.** The trefoil has Arf 1 (4.3.1 *Trefoil* Check).
  - **Locator.** Pyronneau Corollary 2.19 is at `pyronneau2024` line 283, p. 6, right after Fox–Milnor (Theorem 2.18, line 281). The parenthetical describes that route correctly.
  - **Manifest.** `pyronneau2024` is now in the package manifest, with `cited_for = ["4.3.1", "6.2.1"]` and locator "…; Corollary 2.19, p. 6". This resolves r81's "Not verifiable" note.

- **6.2.1 Checks** *Arf against signatures* and *Saturation* (`:6494–6504`), recomputed in the table.
  - The *Saturation* Check tests the route's reduction step: the saturation of `2P` is `P`.
  - Its final clause is right about that step (an isotropic lattice of rank g′ that is not saturated can reduce to less than g′ dimensions mod 2). It does not add a hypothesis to the criterion.

- **6.2.1 *Needs:***, **Layer 6 Examples** (`:6659–6661`), **Layer 6 Dependencies** (`:6667–6671`) and **References** (`:8037–8040`) are consistent with item 5.

- **FourManifolds consumer bullet** (`:8012–8018`), resolved at #936 `46ee76a`; the line numbers below are FourManifolds `README.md`'s.
  - Layers 1, 2, 4 and 5 appear at `:13–16` and in the supplier row at `:175`.
  - Layer 3's diffeomorphism-group carriers appear at `:2849`.
  - Layer 4's Seifert surfaces, Seifert matrices and Alexander polynomial appear at `:15–16`.
  - 4.3.1's algebra appears at `:369` (its `gap:finite-quadratic-arf`).
  - The bullet now also lists Layers 3 and 5, so the r81 remark on that clause is settled.

**Ownership and overlaps.**
- `roadmaps grep` over main and all 468 open heads finds one other roadmap that states the knot Arf invariant's vanishing on slice knots: FourManifolds #936 `46ee76a`. It does so at `:574` (smooth, §1.4) and `:1746` (topological, §3.6).
  - This roadmap is on main and supplies FourManifolds (`ORDER.txt` line 134), so 6.2.1 is the right owner.
  - At its unchanged head, FourManifolds still states both targets itself and still declares `gap:finite-quadratic-arf` (`:369`), which 4.3.1 now covers. Those are FourManifolds' defects; r81 already assigned that edit to #936.
- The other Arf mentions are not about knot Arf invariants or slice knots: HomotopySpheres, GeometryOfNumbersAndQuadraticArithmetic, HermitianKTheoryOfPoincareCategories and QuadraticFormsOverABase (0 hits for knot/slice/Seifert/concordance).
- `overlaps.md` lists six items.
  - The conflicts with #1517, #1791 and #1797 were settled in r71 as not actionable in this folder. None of them is newly affected: the diff touches Layer 6, 4.5, 4.7 and the consumers section only.
  - The three dropped anchors are still mapped at `:774–783`.
  - No cited id is dropped, and none is defined only by an open revision.
- Ownership against open pull requests rests on that grep, on #936 (read in full at its head) and on `overlaps.md`.

**Seeded sample.** Three of the 15 targets touch the change: 4.5.3 (cited by the new 4.5 pointer and the consumer bullet), 6.1 (cited by the new item 5 text) and 4.7.5 (inside 4.7).
- **4.5.3.** Its locator "Theorems 14–20 of Jones 1985 (p. 107)" is exact. Theorem 14 (`V_K(e^{2πi/3}) = 1`) is followed by Theorem 15 (`V_L(1)`), Theorem 16 (`V_K′(1)=0`), Definition 17 (`W_K`), Corollary 18 (`Δ_K(−1) ≡ 1, 5 mod 8`), Theorem 19 (`Arf = W_K(i)`) and Corollary 20, all on p. 107.
  - Jones's mirror law `W_(mirror)(t) = t⁻⁴W_K(1/t)` and his connected-sum law match `:3551`.
  - I read it from the AMS open archive into a scratch manifest.
- **6.1.** Livingston Theorem 2.2 is at `livingston2005` line 130, p. 4: the concordance classes form an abelian group under connected sum.
- **4.7.5** and **6.3** contain no Arf or slice text (0 grep hits), so the change does not reach them.
- The other 11 targets lie in untouched text, and I did not reread them.

**Remark (untouched text, no change asked).** In the locally flat case, item 5's "relative transverse levels … in each category" (`:6432–6435`) also needs four-dimensional topological transversality. Layer 2.1 states only normal bundles (`:1338–1345`), and FourManifolds owns that transversality (#936 `:1752`, §3.5). The new Arf sentence inherits this from the signature argument that earlier rounds passed.

**Adversarial table.** New rows are computed this round. Rows marked r81 carry unchanged statements over from the previous report, with their values.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 6.2.1 item 5: slice ⇒ Arf 0 | `T # T̄` | `P = ⟨e₁+e₃, e₂+e₄⟩`; `θ`: `−1+1, 1−1, 0+0, −1+1` all 0; basis `{e₁+e₃, e₂+e₄, e₃, e₄}` has det 1; q-zero plane; Arf `1+1 = 0` | right |
| same | `6₁`, `V = [[−1,1],[0,2]]` | `Δ = −2t²+5t−2` (`det(V−tVᵀ)`); `θ((2,1),(2,1)) = −4+2+2 = 0`; mod 2 gives `(0,1)`, `q = 2 ≡ 0`; Arf 0; `Δ(−1) = 9 ≡ 1 (8)` | right |
| same, degenerate | unknot, g′ = 0 | zero space, `U = 0 = U^⊥`, Arf 0 (4.3.1 *Zero space*) | right |
| same, converse not claimed | granny `T # T` | Arf `1+1 = 0` but `σ = −4`, so not slice; the README states only one direction | right |
| same, TOP | `W₊(T(2,3))` | `Δ = 1`, `Δ(−1) = 1`, so Arf 0, which agrees with TOP sliceness (Freedman) | right |
| 6.2.1 concordance homomorphism | `T`, `T̄`, `T#T`, `−T̄` | `1, 1, 0, 1`; `−1 = 1` in `𝔽₂`; `T` and `T̄` have equal Arf, which concordance invariance allows (`σ = ∓2` separates them) | right |
| 6.2.1 *Arf against signatures* | `4₁`, `V = [[1,1],[0,−1]]` | `q(1,0)=1`, `q(0,1)=−1≡1`, `q(1,1)=1+1+0−1=1`; Arf 1; `Δ = −t+3−t⁻¹`, roots `(3±√5)/2 ∉ S¹`; `Δ(−1) = 5` | right |
| 6.2.1 *Saturation* | `2P` | rank 2, isotropic, mod-2 image 0; its saturation is `P` | right |
| 6.2 *Figure-eight* | `V+Vᵀ` | `[[2,1],[1,−2]]`, det `−5`, `σ = 0`; `5 ≡ 1−4·1 (8)` | right |
| 4.5 bullet → 4.5.3 | `3₁`, `4₁`, unknot at `t = i` | `i + i³ − i⁴ = −1`; `i² − i + 1 − i⁻¹ + i⁻² = −1`; `1`; `D(i) = 2`; Arf `1, 1, 0` | right |
| 4.7 bullet → 6.2.1 | pointer | item 5 at `:6432–6448` states both categories and concordance invariance | right |
| FourManifolds bullet | #936 `46ee76a` | Layers 1, 2, 4, 5 at `:13–16`; Layer 3 at `:2849`; Seifert data at `:15–16`; Arf algebra at `:369` | right |
| 4.3.1 *Orthogonal sum* (r81) | `q₁ ⊥ q₁` | Arf `1+1 = 0`; Gauss `4 = 2²`; zeros `10 = 2³+2¹` | right |
| 4.3.1 *Basis change* (r81) | `q = xy` | `Σq(aᵢ)q(bᵢ)`: 0 in both bases; `Σq(aᵢ)`: 0 vs 1 | right |
| 4.3.1 *Zero space* (r81) | `m = 0` | Arf 0, Gauss 1; ℕ formula gives 2 ≠ 1 | right |
| 4.3.1 *Planes* (r81) | `xy`, `x²+xy+y²` | Arf 0/1, Gauss `2/−2`, zeros 3/1 | right |
| 4.3.1 *Proper link* (r81) | `L_4`, reversed | radical `⟨e₁+e₃⟩`, quotient Arf 1, Gauss `−4`; reversed `[2]`, Arf 0 | right |
| 4.5.3 `T(2,4)` (r81) | `σ₁⁴` at `u = e^(iπ/4)` | `+√2` vs unlink `−√2`; reversal `× i^(−6) = −1` | right |
| `Δ(−1) ≡ 1 − 4Arf (8)` (r81) | `3₁, 4₁, 5₁, 5₂, 6₁` | `Δ(−1) = −3, 5, 5, −7, 9`; `a₂ = 1, −1, 3, 2, −2` | right |
| 4.7 Checks (r81) | trefoil, `4₁`, unknot | 18 six-colourings; 9 three-colourings; 25 five-colourings | right |
| 4.1 complements (r81) | `Φ.final ∘ L i = K i` | `(range L)ᶜ ↦ (range K)ᶜ`, open, homeomorphic | right |
| 4.2.8 pages (r81) | Crossref | pp. 101–126; inline = References | right |
| 3.1 (r80) | `θ + k⁻² sin kθ` | `f′ ≥ ½`; `C¹` distance `→ 0` | right |
| 4.1 Checks (r80) | trefoils; square, granny | `t+t³−t⁴` vs mirror; `σ = 0, −4` | right |
| 4.3.5 (r80) | `σ₀³` | `[[−1,0],[1,−1]]`, `t²−t+1` | right |
| 4.4 (r80) | `T(2,n)`; `3₁, 4₁, T(2,5)` | `Σ(−t)^j` at −1 is n; dets 3, 5, 5 | right |
| 4.4.9 (r80) | trefoil group | `λ₊ ↦ z⁻¹x⁶ = λ₋`; `V(−1) = −3` | right |
| 4.5.1 (r80) | threshold word | `Δ(ζ) = 36 − 13√5 > 6.5` | right |
| 4.7.8 (r80) | `a ∈ [−3,3]^r`, `r ≤ 5` | 0 mismatches over 19,607 lists | right |
| 4.8.2 (r80) | `L_4`, `L_(−4)`, reversed | `V(i) = −√2, −√2, +√2` | right |
| 5.1, 7.1, 7.2, 7.4, 8.4 (r80) | empty link; genus 2; prism; Weeks; `(2,1)` | `⋂ = univ`; `4π`; `k+1` simplices; `0.9427 < 1.0149`; multiplicity 2 | right |
| `property_P`, `property_R`, `cyclic_surgery_theorem` (r80) | unknot `1/q`; `p/q`; trefoil `11/2` | `S³`; `H₁ = ℤ/|p|`; `|11 − 12| = 1` | right |
| `gordon_luecke`, `waldhausen_theorem`, Poincaré, Manolescu (r80) | trefoils; `L(7,1)`, `L(7,2)`; `ℝ³`; `n = 3` | reflection; `2 ∉ {±1}`; non-compact; Moise | right |
| 26 headlines | `#check`; probe | types as r81; 26 of 26 probes fail | right |

## Not verifiable

- **Lickorish**, *An Introduction to Knot Theory* (Chapters 9–10, 8.9 and 8.19), and **Burde–Zieschang**, Chapter 1: neither is in the manifest, and neither was fetched (carried over from r81).
- **Artin**, *Theory of braids*: only the page range was checked, by Crossref (r80).
- **Uncertified** (cited by locator only): `hirsch1976`, `kauffman1987`, `rourke-sanderson1972`, `thurston1986`, `gabai1983`, `htw1998`, `lickorish1962`, `lickorish1964`, `farb-margalit2012`, `haagerup-munkholm1981`, `monod2001`.
- **Image-only**: `kauffman1990` (4.6.1); OCR is not available on this worker.
- **Read into a scratch manifest only**: Jones 1985, *A polynomial invariant for knots via von Neumann algebras*, Bull. AMS 12, from the AMS open archive (`publisher-open`). The README cites it (4.5.3, `:3463`, References), but the package manifest has no entry for it. Recording it is a worker-level manifest fix.

## Source issues

- none
