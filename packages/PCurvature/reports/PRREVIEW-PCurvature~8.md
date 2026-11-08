# Review of PCurvature (pull request #1747 at d070295)

**Verdict:** needs changes

Scope: this is an incremental re-review of the 38 changed lines (27 insertions, 11 deletions) of `TauCetiRoadmap/PCurvature/README.md` since 4bae0b7. All of them are in the "Not a target" paragraph after 4.3, the effective form of Honda's theorem over `ℚ` (Fürnsinn–Pannier). That paragraph now states the result for `u = A/B` with `c = 1`, gives a proof, adds the examples `c/x`, `1/(2x)` and `y′ = y`, and records the `c`-scaling counterexample as a second omission of the printed Theorem 1.3. `Suggested.lean` is unchanged since 7ff8fa7. The pull request changes nothing outside the folder: `git diff --stat origin/main...HEAD` excluding the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`. The pins are unchanged: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9.

## R01 (P3) — "`B` squarefree" is ambiguous now that `A`, `B` need not be primitive, and the README's own `u = c/x` example falls outside the `ℤ[x]` reading

Location: `TauCetiRoadmap/PCurvature/README.md` line 632, "`A, B ∈ ℤ[x]` coprime, `deg A < deg B` and `B` squarefree (so `res(B, B′) ≠ 0`)", and line 643, "`u = c/x` with `c = r/s` in lowest terms is `A = r`, `B = sx`".

Claim: in `ℤ[x]`, "squarefree" means by default that no square of a non-unit divides `B`. That is Mathlib's `Squarefree` (`Mathlib/Algebra/Squarefree/Basic.lean:43`), and under it an integer square factor of the content counts. The paragraph intends "no repeated root": its parenthesis, its proof and its source ("`b` has only simple poles") all mean that. The text at 4bae0b7 also required `A`, `B` primitive, and for a primitive `B` the two readings agree by Gauss's lemma. Dropping "primitive" separated them. The example on line 643 uses `B = sx`, which is non-primitive for every `s > 1`.

Witness: `c = 1/4`: `B = 4x = 2·2·x` is not `Squarefree` in `ℤ[x]`, and `A = 1`, `B = 4x` is the only coprime representation of `1/(4x)` up to sign; yet `res(4x, 4) = 4`, `R = 1 − 4w`, `ψ_3 = ψ_5 = 0`, `y = x^{1/4}`.

Repair: replace "`B` squarefree (so `res(B, B′) ≠ 0`)" with "`B` without repeated roots (equivalently `res(B, B′) ≠ 0`)", or with "`B` squarefree in `ℚ[x]`". Tested on the witness:
- `1/(4x)` becomes an instance, and the conclusion holds. The tested primes are the odd `p` below `σ`, and `ψ_p = ((1/4)^p − 1/4)/x^p = 0` there; this was computed at `p = 3, 5`.
- The witness `B = (x + 1)²` stays excluded (`res = 0`).
- Line 640 ("stays squarefree", in `𝔽_p[x]`) needs no change, since over the perfect field `𝔽_p` the two readings agree.

## R02 (P3) — the References entry for Fürnsinn–Pannier omits Theorem 2.1, which the text now cites

Location: `TauCetiRoadmap/PCurvature/README.md` line 772, "arXiv:2510.00892, Theorems 1.1–1.3, Propositions 2.2–2.4.", against line 638, "the residues of `u` are the roots of `R` (their Theorem 2.1)".

Claim: the diff adds a citation of the source's Theorem 2.1, but the entry's list of locators still omits it. This is the same defect the review of 7ff8fa7 raised for Theorems 1.2–1.3.

Witness: furnsinn-pannier line 187 (printed p. 5): Theorem 2.1 (Rothstein–Trager), the residues are the roots of `res_x(b, a − w b′)`. The README cites it only at line 638; the entry lists 1.1–1.3 and 2.2–2.4.

Repair: line 772 should read "arXiv:2510.00892, Theorems 1.1–1.3 and 2.1, Propositions 2.2–2.4." Proposition 2.4 may stay. It is not cited by number in the text, but its content is the proof step "for `p ∤ res(B, B′)`, `B` keeps its degree modulo `p` and stays squarefree" (furnsinn-pannier lines 241–247, van der Put's observation). Citing it there would be accurate.

## Previous findings

- R01 — repaired: "For `u = A/B` with `A, B ∈ ℤ[x]` coprime, `deg A < deg B` and `B` squarefree … below the bound `σ` of Fürnsinn–Pannier, Theorem 1.2, for `±R` … Theorem 1.3 with `c = 1`" (lines 631–636). Dropping "primitive" introduced this report's R01, and the new Theorem 2.1 citation its R02.

## Verified sound

**Gate, build, elaboration.**
- The gate on the worktree with `--base origin/main --order` on the job's merge-order candidate passes: every check is 0, `OK`.
- Without `--order`, the gate reports only `depcheck: NOT IN ORDER: PCurvature (insert it after its last supplier)`. That is the public order file not listing a roadmap still in a pull request, which is not a defect.
- The worker's gate at this head, build included, has every check at 0.
- `lake env lean TauCetiRoadmap/PCurvature/Suggested.lean` exits 0 with 11 `sorry` warnings (lines 71, 97, 109, 114, 119, 138, 160, 167, 174, 200, 224) and nothing else.
- On a scratch copy with `#check @` for all 19 declarations, every elaborated type is identical to the worker's `signatures.md`. The comparison was mechanical, after whitespace normalisation: 19 of 19. No section binder is lost.
- One-tactic probe on a scratch copy: every `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | (ext; simp; done) | (ext; simp [pPow]; done) | (ext; simp [frobeniusImage]; done) | (intro; simp; done) | (simp [ratFuncPCurvature, ratFuncMod, ratFuncOfInt]; done) | (exact?; done) | sorry`. All 11 theorems still report `sorry`, so there is no padding.
- The file has no `set_option`, no `lemma` and no sorried data. Its imports are `module`, `public import Mathlib` and two Tau Ceti modules.

**Dependency check** (output): `depcheck: 244 roadmaps, 2462 edges, 0 problem(s)`, run with `--order` on the candidate and `--movable`. The candidate lists PCurvature at line 45, after DerivedDeRhamCohomology (23), CrystallineCohomology (24) and FormalConnectionsOpers (44). There is no UPWARD or CYCLE line. The diff adds no `*Needs:*` line, no supplier citation and no Lean statement.

**Citations, overlaps and ownership.**
- The diff adds no cross-roadmap citation and no object of its own: the paragraph is declared not a target.
- `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no closest roadmap.
- `scratch/citations.md` lists four Lean names found nowhere: `Derivation.lie_mulLeft`, `Derivation.mulLeft_mul_mul_mulLeft_inv`, `DerivedDeRham.smoothCartier` and `SchemeFrobenius.schemeFrobeniusTwist`. All four are in the supplier contracts (README lines 119–126), which the diff leaves untouched. They were settled in the reviews of 43fe6b5 and 9cddff5 as names of supplier roadmaps' planned declarations.
- Mathlib `Squarefree` was opened at `Mathlib/Algebra/Squarefree/Basic.lean:43`, for R01.

**Sources in the changed passage.** furnsinn-pannier is arXiv:2510.00892v2, cache cac8df9f, read as OCR; printed pp. 3, 5 and 6 were re-read by pdftotext from the cached PDF.
- **Theorem 1.2** (p. 3; OCR lines 98–104): `R ∈ ℤ[w]` with `r_n > 0`, and `Δ_R = res_w(R_0, R_0′)` (pdftotext; the OCR drops the prime). The theorem defines `δ`, `M`, `N` and `σ = (2M+1)N + 2M`, and says `R` splits over `ℚ` iff it splits mod every `p ∤ r_n` with `p < σ`. The README's "`σ` of … Theorem 1.2, for `±R`" with the sign making the leading coefficient `|res(B, B′)|` matches this: Theorem 1.3 states `Δ_b = |res(b, b′)| = |r_n|`.
- **Theorem 1.3** (p. 3; pdftotext): `u = c·a/b`, with `a, b ∈ ℤ[x]` primitive and `c ∈ ℚ`. `R` and `Δ_b` come from `a, b`, and there is no degree or simple-pole hypothesis. The README's "omits the last two hypotheses and allows `u = c·A/B` with `c ∈ ℚ` free and `σ` computed from `A/B`" is accurate.
- **Proof of 1.3** (lines 259–272): the reduction to `c = 1` via "`y` algebraic iff `y^c` algebraic" is at lines 260–262. The README's "its reduction to `c = 1` keeps algebraicity but changes the primes where `ψ_p` vanishes" describes it correctly.
- **Theorem 2.1** (line 187, p. 5): simple poles and `deg a < deg b` imply that the residues are the roots of `R`. These are the README's hypotheses.
- **Proposition 2.2** (lines 193–202): (1) ⇔ (3), as used.
- **Proposition 2.3** (lines 214–226): (1) `ψ_p = 0` ⇔ (4) degree condition, simple poles and `R̄` splitting over `𝔽_p`, as used.
- **Proposition 2.4** and the paragraph before it (lines 241–247) read the exceptional primes off `|res(b, b′)|`.
- **Katz 1982, §9, as they recall** (lines 84–92): unchanged.

**Seeded sample.** None of the seeded targets (0.1, 0.2, 0.3, 1.2, 1.4, 1.5, 2.1, 2.2, 2.3, 2.4, 3.1, 3.2, 4.1, 4.2, 4.4) lies in the changed passage, and their text is unchanged. Their locators were verified in the reviews of 43fe6b5 and 9cddff5 and were not re-read here.

**The proof sketch in the changed passage**, checked step by step:
- **The leading coefficient of `R`** is `(−1)^m res(B, B′)` with `m = deg B`. It equals `res(B, B′)` (`m = 2`, `B = x² + 1`: `4 = 4`), `−s = −res` (`B = sx`) and `1 = −res` (`B = −(x + 1)`).
- **`p ∤ res(B, B′)` implies `p ∤ lc(B)`**, because `res(B, B′) = ± lc(B)·disc(B)`. Example: `B = 3x² + x + 5` gives `res = 177 = 3·59`.
- **Reduction mod `p`.** Then `deg B̄ = m`, and the Sylvester matrices at formal degrees `(m, m − 1)` reduce entrywise. So `res(B̄, B̄′)` is the reduction of `res(B, B′)` and is nonzero, `B̄` is separable, and `R̄` is the Rothstein–Trager resultant of `ū`. That resultant has degree `m` and roots `Ā(β)/B̄′(β)` (root `0` at a common root), so `ψ_p = 0` iff `R̄` splits over `𝔽_p`.
- **Coprimality is not needed.** A common root adds the root `0` to `R`. Not raised: it was checked at 4bae0b7.

**Adversarial table.** The rows for the changed passage carry values computed in this review with an exact-arithmetic script: Sylvester determinants over `ℚ`, and `p`-curvature numerators `N^p + N_{p−1}` over `𝔽_p` with `N_{k+1} = N_k′ D − (k+1) N_k D′`. The rows for untouched statements are carried from the previous report, with the review that computed them.

| Statement | Instances | Values each side | Result | Source |
| --- | --- | --- | --- | --- |
| Effective Honda, `c = 1` (lines 631–641), on `1/(x²+1)` | `A = 1`, `B = x²+1` | `res(B,B′) = 4`; `R = 4w²+1`; `Δ_R = 64`, `δ = 2`, `M = 1447`, `N = 4396`, `σ = 12 729 314`; `ψ_3, ψ_7, ψ_11 ≠ 0`, `ψ_5, ψ_13, ψ_17 = 0`; residues `∓i/2 ∉ ℚ` | test fails at `3`, no algebraic solution: consistent | this review |
| Same, `u = c/x` example (lines 642–645) | `c = ½, ¾, ⅔, −5/6, ¼` | `R = r − sw` (`1 − 2w`, `3 − 4w`, `2 − 3w`, `−5 − 6w`, `1 − 4w`); `res = s`; `ψ_p = 0` at `p = 3, 5`; `5, 7`; `7`; `5`; `7`; `3, 5`; `y = x^c` | holds | this review |
| Same, `u = 1/(2x)` (line 645) | `A = 1`, `B = 2x` | `res = 2`, `R = 1 − 2w`, `Δ_R = 2`, `M = 181`, `N = 550`, `σ = 200 012`; `ψ_3 = ψ_5 = 0`; `y = x^{1/2}` | holds; agrees with the Checks of 2.4 and 4.3 | this review |
| `y′ = y` "outside the statement" (lines 646–647) | `A = B = 1` | `deg A = deg B = 0`; `ψ_5 = 1 ≠ 0`; with `res(1, 0) = 1` (empty Sylvester matrix), `R = 1`, the test fails, consistent with `e^x` transcendental | not a counterexample either way: accurate | this review |
| "`B` squarefree" read in `ℤ[x]` | `u = 1/(4x)` | `4x = 2·2·x` not `Squarefree`; `res(4x, 4) = 4`, `R = 1 − 4w`; `ψ_3 = ψ_5 = 0`; `y = x^{1/4}` | outside the hypothesis, conclusion holds | R01 |
| Witness 1 (lines 647–649) | `A = 1`, `B = (x+1)²` | `res((x+1)², 2(x+1)) = 0`; `R = 1` (degree-2 coefficient `0`); `ψ_5 ≠ 0`; `exp(−1/(x+1))` | isolates "no repeated root" | this review |
| Witness 2 (lines 649–651) | `A = Nx²+Nx+1`, `B = −(x+1)`, `N = ∏_{p ≤ 137} p` | `R = w + 1` (formal degree 2), `res(B, B′) = −1`; `M = 3`, `N = 19`, `σ = 139`; `ψ_p = 0` at `p = 2, 3, 5, 7, 137`; `ψ_139 ≠ 0`; `u = −Nx − 1/(x+1)` | isolates the degree hypothesis; values as printed | this review |
| Printed Theorem 1.3, `c` free (lines 651–658) | `A = 1`, `B = x²+1`, `c = ∏_{p ≡ 3 (4), p < σ} p`; toy model `c = 21` | `σ(4w²+1) = 12 729 314`; toy: `ψ_3 = ψ_5 = ψ_7 = 0`, `ψ_11, ψ_19 ≠ 0`; residues `∓ci/2` | refutes the print: accurate | this review |
| "written as `A = c` … `R = 4w² + c²` … forces its `σ` past a prime `p ≡ 3 (4)`, `p ∤ c`" | `c = 3`, `21`; general `c` | `R = 4w²+9`, `4w²+441`; `Δ_R = 64c²` (`28224` at `21`); root bound `c/2`, so `σ′ > 3c·M′ > c`; mod `p ∣ c`: `4w²`; mod `p ≡ 1 (4)`: splits; Theorem 1.2 forces `p ≡ 3 (4)`, `p ∤ c`, `p < σ′`, where `ψ_p ≠ 0` | holds | this review |
| References entry vs text | Fürnsinn–Pannier locators | text cites 1.1 (573), 1.2 (634), 1.3 (636, 652), 2.1 (638), 2.2 (636, 639), 2.3 (641); entry: 1.1–1.3, 2.2–2.4 | 2.1 missing | R02 |
| "Katz 1982, §9, as they recall" | FP lines 84–92; Katz lines 751–757 | chain of algebraic Lie subalgebras stabilises (Prop. 9.3); finite set, non-constructive | accurate | review of 7ff8fa7 |
| `pPow` body | `((D : Module.End R A) ^ p) a` | `pow_apply_eq_iterate`, `Derivation.coeFn_coe`, `smul_eq_mul`; `iterate_leibniz` closes | elaborates (exit 0) | review of 7ff8fa7 |
| 3.2 proof: `Spec B → Spec A_f` surjective | `B` finite étale over `A_f`; `A` smooth over the domain `S` | finite ⇒ image closed; ⊇ `Spec A_F`; going-down; closed ⊇ dense | holds | review of 9cddff5 |
| 3.2 Check 3 | `S = ℤ`, `A = ℤ[x, 1/(x²+1)]`, `B_F = A_F[t]/(t² − x² − 1)`; `p = 2`; `p` odd | `(t⁻¹)′ = −a t⁻¹`, `a = x/(x²+1)`; `ψ = 1/(x+1)⁴ ≠ 0` at `2`; residues `½`, `ψ = 0` on `D(2)` | holds | review of 9cddff5 |
| 1.2 Check 2 and its linearity control | `𝔽_2[x,y]`, `∇ = d + x dy`, `a = y`; `a = x` | `x²y² = a² ψ(∂_y)`, `ψ(∂_y) = x²`; `a ψ ≠ a² ψ` | holds; linearity refuted | review of 9cddff5 |
| Docstrings: 2.4 instance of `exists_unit_horizontal_iff`; 4.2 a step of 4.3 | `A = κ(x)`, `D = d/dx`; 4.2's statement | field ⇒ local; `D^p = 0`; `D x = 1`; partial-fraction data `P`-integral for almost all `P` | consistent | review of 9cddff5 |
| Downstream consumers: K3Surfaces §0.2 | K3Surfaces README line 200 | restricted `p`-power of global derivations via `pPow p D` | accurate | review of 9cddff5 |
| 0.1 `jacobsonLie`, `p = 2, 3`; `E₁₂, E₂₁`; `i = p` coefficient | words `x, y`; `(a+b)² = I`; `x…x` | `ba − ab`; `Λ_p(a,b) = a + b ≠ 0`; `ad(x)^{p−1}(x) = 0` | holds | review of 43fe6b5 |
| 0.2 two structures on abelian `R` | `pMap = 0`; `pMap c = c^p` | both satisfy the axioms, differ at `1` | none | review of 43fe6b5 |
| 0.3 `iterate_leibniz` control; `pPow` on `𝔽_p[x]`; `pPow_smul` `p = 2`, odd; `ad_pPow`, `pPow_add`, `pMap_smul` | `ℚ[x]`; `D`, `xD`; `a = x, x²` | `2 ≠ 0`; `pPow D = 0`, `pPow(xD) = xD`; `(xD)² = x²D² + xD`; Katz's print `−xD`; `ad(D^p) = (ad D)^p`; `(c•D)^p = c^p D^p` | holds; print wrong | review of 43fe6b5 |
| 1.1 `A`-linearity; Check 2; 1.2 flatness, infinite coordinates; 1.3 étale, tensor, dual | `d`, `D = xD`; `𝔽_2[x,y]`; `κ = 𝔽_p(x_0, …)`; `𝔽_p[x] ⊂ 𝔽_p[s]`, `s^p = x`; `d ± dx` | `(xD)^p − pPow(xD) = 0`; `ψ(∂_x+∂_y) = 1 + x²`; `Der ≅ κ^ℕ`; `ψ_M = 1`, `dx = 0`; `1 + (−1) = 0`, dual `−1` | hold | review of 43fe6b5 |
| 1.4 `rankOne_pCurvature_eq` `p = 2, 3`; recursion; unipotent; Airy; `c/x` | `a = ωD`; `Γ = [[0,x^{p−1}],[0,0]]`; `[[0,1],[x,0]]`; `𝔽̄_p[x, x⁻¹]` | `a² + D(a) − ω(D²)`; `ψ² = 0`; `Γ_3`, `Γ_5` as computed; `(c^p − c)/x^p` | hold | review of 43fe6b5 |
| 1.5 tensor exponent; comparison with CR.1.3 | `N ⊗ 1 + 1 ⊗ N`, `p` odd; `R[x_1..x_r]` | `ψ² = 2N⊗N ≠ 0`, `ψ³ = 0`; `ψ(∂_i) = θ_i^p` | equivalent | review of 43fe6b5 |
| 2.0 `frobeniusImage`; `ker d`; injectivity; 2.1 `A = R`, `M = 0`, Check 3, locality | `𝔽_p[x]`; `R[ε][t]`; perfect `κ`; `Der = 0`; `d + dx`; invert `f` | `𝔽_p[x^p]`; `R[t^p]`; `κ`; `M^∇ = M`; `0`; `y = 0`; `(M_f)^∇ = (M^∇)_{f^p}` | hold | review of 43fe6b5 |
| 2.3 `⇒`, `⇐`, Checks; 2.4 Checks | unit `y`; `P = Σ_{k<p} (−x)^k/k! (D+a)^k`; `a = 0, 1, −1/(1+x)`; `1/x + 1/(x−1)`, `1/(2x)`, `1/x²` | `(a^p + D^{p−1}a) y = 0`; one summand a unit; `ψ = 0`, `y = 1/(x(x−1))`; `x^{(p−1)/2}`; `x^{−2p} ≠ 0` | hold | review of 43fe6b5 |
| 3.1 Check 2; 4.1 Checks, `L = ℚ`; 4.2 Checks | `t² = x`, `d + ½ dx/x`; `c = i, 3, ½`, `c ∈ ℤ`; `1/(x²−1)`, `1/(x²+1)`, `x + 1/x` | horizontal `t⁻¹`; `i^p = −i`, `3^p ≡ 3`, `(½)^p ≡ ½`; poles merge mod `2`, residues `∓i/2`, `R = x` | hold | review of 43fe6b5 |
| 4.3 `honda` `⇐`, `⇒`, junk, Checks; 4.4 Kummer; Conventions 1, 5, 6 | `n a = f′/f`; residues; `Q̄ = 0`; `a = 0`, `1/(2x)`, `1/(x²+1)`; `t^n = f`; `d(x^p)/dx`; `1/x`; `1/(2x)` at `2` | `ā = (f̄^m)′/f̄^m`; `mc ∈ ℤ`; finitely many `v`; `n = 1, 2`; `ψ ≠ 0` iff `p ≡ 3 (4)`; étale rank `n`; `0`; `x^{−p} + (p−1)! x^{−p} = 0`; `Q̄ = 0` | hold | review of 43fe6b5 |

**Headline theorems** (unchanged by the diff):
- Stated in `Suggested.lean`: Jacobson's formula (0.1); the restricted structure on `Der_R(A)` with Hochschild's formula (0.3); the rank-one formula (1.4); rank one in one variable (2.3, with 2.4 its instance); Kronecker (4.1); Honda (4.3).
- Named in the docstring as not statable: Katz's structure theorem (1.2); nilpotence (1.5); Cartier descent (2.1); the easy direction (3.2); the Kummer trivialisation (4.4).
- The effective form after 4.3 is declared not a target, so it needs no Lean statement.
- No statable headline is absent, and none is forced through a stand-in.

**Declared gaps:** none declared, and none needed.

**Checked and not raised:**
- "under the hypotheses of their Proposition 2.2(3)" points to the degree and simple-pole conditions, which the sentence itself states.
- The edge case `c = 0` of the `c/x` example (`A = 0`, `B = x`, not coprime) is the trivial `u = 0`.
- "The last two hypotheses are needed" pairs each witness with the right hypothesis.
- The new text is timeless and has no LaTeX: gate checks `latex = 0`, `round-labels = 0`.

## Not verifiable

- Honda 1981 (Symposia Mathematica XXIV), Kronecker 1880, Katz 1972, Chudnovsky–Chudnovsky 1985, André 1989 and 2004, Beukers–Peters 1984: no legal copies, as in the previous reviews. None is cited in the changed passage.
- In Proposition 2.3 (3) of furnsinn-pannier (p. 5), both the OCR and pdftotext render the poles' field as `𝔽_p`, where `𝔽̄_p` is meant. Text extraction drops overbars (its Proposition 2.2 (2) reads `ℚ` for the algebraic poles), so whether the print has the bar could not be decided from the text.

## Source issues

- **Error** in furnsinn-pannier at Theorem 1.3, printed p. 3: the source says that for any primitive `a, b ∈ ℤ[x]`, algebraicity is equivalent to vanishing `p`-curvature at all `p ∤ Δ_b`, `p < σ`; it should assume `deg a < deg b` and `b` without repeated roots: `a = Nx² + Nx + 1`, `b = −x − 1` gives `σ = 139` and vanishing tested curvatures without an algebraic solution; affects a stated result.
- **Error** in furnsinn-pannier at Theorem 1.3, printed p. 3, and its proof, printed p. 6: the source says `c ∈ ℚ` may be pulled out, with `R` and `σ` computed from `a, b`, since `y` is algebraic iff `y^c` is; it should take `c = 1`, because the reduction changes where `p`-curvatures vanish (`c/(x² + 1)`, `c` the product of the primes `≡ 3 (mod 4)` below `σ`); affects a stated result.
