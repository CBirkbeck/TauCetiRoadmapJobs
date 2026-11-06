# Review of DGFloerPartII (pull request #1799 at ca56e15)

**Verdict:** needs changes

Incremental re-review of the 58 lines changed since 9c233de (the magnetic-sign Check of 3.4, the
radius-`1` wording of the 1.3 curvature Check, the Lemma 6.35 wording in the Scope, 4.3 and both
docstrings of `Suggested.lean`). The gate passes every check, the dependency check reports no
UPWARD or CYCLE line, and the Lean file elaborates with only its eight `sorry` warnings. Three of
the five previous findings are repaired and the repairs introduce nothing new; two remain, one of
them the blocking ownership finding that only the base roadmap's own revision can discharge.

Source ids: `bdho-cotangent` is the base package's manifest id for the source paper (arXiv:2404.07953v3,
cached; printed page = page marker − 6). This folder has no `sources.toml`; this review records none.

## R01 (P2) — Two owners on main: DGFloer Layer 11 still plans this roadmap's Layer 4

**Location.** `TauCetiRoadmap/DGFloerPartII/README.md` lines 32–39 (the base "owns every other
numbered statement of the source") and Layers 1.3–1.4, 2, 3.1–3.2 and 4.

**Claim.** This roadmap owns abundance, fibered families, covering by diffeomorphisms, Lemma 6.35,
homogeneous and projective spaces, Theorem G, the homogeneous carriers, the explicit degrees, the
projective based-loop energy and the multiple-realization step of Theorem B.

**Witness.** `TauCetiRoadmap/DGFloer/README.md` on main (ffac5139, 2026-11-06): Layer 11 at line
1568 still holds items 1–6 (abundance and Theorem H at 1570, fibered families at 1572, covering by
diffeomorphisms with the seven values and the `n ≥ 17` splitting at 1611–1618, homogeneous spaces
at 1623, projective spaces at 1636, Theorem G at 1638). The base's open revision (DGFloer at
fc27fe2b) reduces Layer 11 to 11.1–11.3 (lines 3050–3091) and says "DGFloerPartII consumes this
roadmap and supplies nothing to it" (line 53); it has not merged.

**Repair.** Nothing to edit in this folder. The pull request lands after the base's revision that
removes Layer 11 items 1–6, Layer 1 items 7–8, Layer 5 item 7 and the Layer 10 item 5 realization
bullet from DGFloer; the pull request's merge-order block already lists that revision first. Until
it lands, main would carry two plans for every target of Layer 4, so the finding stays blocking
and is discharged by the sequencing alone. Every citation this README makes into the base resolves
under both numberings (rechecked for the passages the diff touches: Layer 6 item 3's magnetic
translation is main lines 1083–1086 and, at the revision head, §6.3 lines 1661–1664 and the
witness at 1672, with the same sign `Ψ'^*_σ ω_can = ω_can + π^*dσ`).

## R02 (P3) — GeneralizedCohomology has no section G2.10

**Location.** README line 216 ("G2.10: the mapping-path replacement and raw lifting maps"), line
219, line 281 ("GeneralizedCohomology G2.10's"), line 283 (1.1 *Needs:* "GeneralizedCohomology
G2.10") and line 463 (Layer 1 Dependencies).

**Claim.** G2.10 is a section or target of GeneralizedCohomology.

**Witness.** `TauCetiRoadmap/GeneralizedCohomology/README.md` on main (ffac5139): the G2 section
(heading at line 211) has numbered items 1–7 (lines 213, 240, 260, 271, 302, 396, 405) and no
heading, item or label "G2.10"; the string occurs only inside item 7 ("First complete G2.10",
line 405), inside G4 (line 918) and in two later passages (lines 2584, 2592), as a label
GeneralizedCohomology never defines. Unchanged since the previous review (its R04).

**Repair.** Cite the object by the section that holds it: "GeneralizedCohomology G2 item 7 (the
mapping-path carriers and raw lifting maps it refers to as G2.10)" at the five locations, or cite
G2.1 as the base roadmap does (DGFloer line 147) if the raw lifting maps are the compact-generation
interface. The dependency check is unaffected (it reads the roadmap name).

## Previous findings

- R01 — not repaired: nothing editable in this folder; main's DGFloer (ffac5139) still carries
  Layer 11 items 1–6 at lines 1568–1640, and the base's revision at fc27fe2b has not merged.
  Re-raised above as R01.
- R02 — repaired: 3.4 third Check now reads "`Ψ'^*_σ ω_can = ω_can + π^*dσ`: `Ψ'_σ` is the
  symplectomorphism from `(T*Q, ω_can + π^*dσ)` … to `(T*Q, ω_can)`", with the `T*ℝ²` witness;
  every value recomputed (table).
- R03 — repaired: 1.3 third Check now reads "the radius-`1` normalization, in which `CP¹` is the
  unit sphere and the sectional curvature lies in `[1/4, 1]` (diameter `π`), would give period
  `2π` and area `4π`"; the adopted scale keeps "unit-round Hopf" (lines 357, 370).
- R04 — not repaired: "G2.10" still cited at README lines 216, 219, 281, 283 and 463. Written
  again as R02.
- R05 — repaired: "finite-rank" occurs nowhere in the README or `Suggested.lean`; the Scope says
  "the torsion group `π_(n−1)(SO(n))` of Lemma 6.35", 4.3's bullet is "**The torsion group
  `π_(n−1)(SO(n))` (Lemma 6.35)**" with "the low-rank values and the stable-plus-Stiefel
  splitting", and both docstrings use the same words.

## Verified sound

**Gate and build.** The worker's gate at ca56e15: every scanner zero, `depcheck=0`, `build=0`,
`outside-folder=0`. Rerun of the dependency check:

    depcheck: 241 roadmaps, 2362 edges, 0 problem(s)

`lake env lean` of `TauCetiRoadmap/DGFloerPartII/Suggested.lean` emits exactly eight `declaration
uses sorry` warnings (lines 37, 40, 43, 47, 51, 55, 59, 66) and nothing else, in 3.7 s. No file
outside the folder is changed (`git diff --stat origin/main...HEAD` excluding the folder is empty).
The diff touches no Lean statement: only the module docstring (line 11), the section comment
(line 29) and the docstring of `isOfFinOrder_pi_SO` (line 63).

**Signatures.** A scratch probe importing the built module elaborated `#check @name` for all nine
declarations; the types equal the worker's signature file and the README 4.3 statements (`SO n`
is `Matrix.specialOrthogonalGroup (Fin n) ℝ`; the seven low-rank groups `0`, `ℤ/2`, `0`, `(ℤ/2)²`,
`ℤ/2`, `ℤ/2`, `ℤ/2`; `isOfFinOrder_pi_SO : ∀ k, Odd (k + 3) → ∀ x : π_ (k + 2) (SO (k + 3)) 1,
IsOfFinOrder x` is "for every odd `n ≥ 3`, `π_(n−1)(SO(n))` is torsion" with `n = k + 3`). The
file has no section variables, so no binder can drop; nothing changed.

**Padding probe.** The same scratch file stated each of the eight theorems as an `example` closed
by `first | infer_instance | simp | rfl`; all eight fail (every one falls through to `rfl`), so
none is padding. The headline list of the previous report stands: the statable part of Lemma 6.35
is stated; Theorems B, G, H, I, Propositions 6.29–6.39 and the degree of 1.4 are named in the
module docstring as not statable, for the reasons checked at the pins in the previous report.

**Changed passages against their suppliers and sources.**

- 3.4 third Check against DGFloer on main: `ω_can = −dλ_can` (lines 341, 1078), Layer 6 item 3's
  "the source's magnetic form `ω_src + π^*dσ` is carried by `ν` to `ω_can + π^*dσ`" and
  "`Ψ'_σ(q, p) = (q, p − σ_q)` … symplectomorphism `(T*Q, ω_can + π^*dσ) ≅ (T*Q, ω_can)`" (lines
  1083–1086), the acceptance witness `Ψ'^*_σ ω_can = ω_can + π^*dσ` (line 1693); at the base's
  open head fc27fe2b the same at §6.3 lines 1661–1664, 1672 and 3198. Against `bdho-cotangent`:
  Corollary D's `ω_σ = ω_Q + π^*dσ` and `Ψ(p, q) = (p + σ(q), q)` a symplectomorphism to the
  standard cotangent bundle (lines 265–268, 283–285). The Check's phrase "the magnetic form
  DGFloer Layer 6 item 3 obtains from the source's `ω_Q + π^*dσ`" is exactly what the base says.
- 1.3 third Check against RiemannianGeometry R1 (Hopf quotient of the unit sphere, previous
  report): the adopted scale has `CP¹` of radius `1/2`; the alternative is now named by its
  radius, and its numbers are recomputed in the table.
- 4.3 Lemma 6.35 against `bdho-cotangent` line 5073 ("for `n ≥ 3` odd, `π_(n−1)(SO(n))` is
  torsion"), lines 5076–5077 (the seven printed values, with `ℤ₄` at `n = 9`), lines 5078–5079
  (the splitting "for `n ≥ 16`"). The new words "torsion group", "low-rank values" and
  "stable-plus-Stiefel splitting" name the lemma's statement and the two parts of its proof; no
  mathematics changed.

**Adversarial table.** Rows for the changed statements carry values computed in this review; rows
for untouched statements are carried from the previous report (r2, at 9c233de) with its values.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| 3.4 `Ψ'^*_σ λ_can` (changed) | `T*ℝ²`, `σ = q₁ dq₂`, `Ψ'_σ(q₁, q₂, p₁, p₂) = (q₁, q₂, p₁, p₂ − q₁)` | `Ψ'^*_σ(p₁ dq₁ + p₂ dq₂) = p₁ dq₁ + (p₂ − q₁) dq₂ = λ_can − q₁ dq₂ = λ_can − π^*σ` | agrees with the Check and base line 1085 | none |
| 3.4 `Ψ'^*_σ ω_can` under `ω_can = −dλ_can` (changed) | same | `−d(p₁ dq₁) = dq₁ ∧ dp₁`; `−d((p₂ − q₁) dq₂) = dq₂ ∧ dp₂ + dq₁ ∧ dq₂`; sum `ω_can + dq₁ ∧ dq₂`, and `π^*dσ = d(q₁ dq₂) = dq₁ ∧ dq₂` | `ω_can + π^*dσ`, as the Check, base line 1693 and open head line 1672 say | none |
| 3.4 direction of `Ψ'_σ` (changed) | same | pull-back of the target form `ω_can` is the source form `ω_can + π^*dσ`, so `Ψ'_σ : (T*Q, ω_can + π^*dσ) → (T*Q, ω_can)` is symplectic | agrees | none |
| 3.4 translation by `−σ` (changed) | `σ ↦ −σ` in the row above | `Ψ'^*_(−σ) ω_can = ω_can − π^*dσ`; on `T*ℝ²`: `−d(p₁ dq₁ + (p₂ + q₁) dq₂) = ω_can − dq₁ ∧ dq₂` | agrees | none |
| 3.4 push-forward of `ω_can − π^*dσ` along `Ψ'_σ` (changed) | `(Ψ'_σ)⁻¹ = Ψ'_(−σ)` since `(q, p − σ_q) ↦ (q, p − σ_q + σ_q)` | `Ψ'^*_(−σ)(ω_can − π^*dσ) = (ω_can − π^*dσ) − π^*dσ = ω_can − 2π^*dσ` (using `π ∘ Ψ' = π`) | agrees ("not `ω_can`") | none |
| 3.4 wrong convention `ω_can = +dλ_can` (changed) | same witness | `+d(λ_can − π^*σ) = ω_can − π^*dσ`; the two conventions differ by `2π^*dσ = 2 dq₁ ∧ dq₂ ≠ 0` | the witness separates them | none |
| 3.4 one-dimensional base (changed) | `Q = S¹`, `σ = f(q) dq` | `dσ = f′(q) dq ∧ dq = 0` | the Check's "separates nothing" is right | none |
| 1.3 curvature and periods (changed wording) | `CP¹` radius `1/2`; radius `1` | radius `1/2`: great circle `2π·(1/2) = π`, curvature `1/r² = 4`, area `4πr² = π`, diameter `π/2`; radius `1`: period `2π`, curvature `1`, area `4π`, diameter `π`; `CPᵈ` scaled so `CP¹` has radius `1` has curvature in `[1/4, 1]`; energy `∫|γ̇|²` scales by `r²` ratio `4`, cell degrees are topological | agrees; the two scales now have distinct names | none |
| 4.3 Lean torsion statement (docstring changed) | `k = 0`, `k = 1`, `k = 6` | `k = 0`: `Odd 3`, `π₂(SO(3)) = 0`; `k = 1`: `Odd 4` false, excludes `π₃(SO(4)) = ℤ²`; `k = 6`: `Odd 9`, `π₈(SO(9)) = (ℤ/2)²`, every element of order `≤ 2` | hypothesis necessary and sufficient; statement unchanged | none |
| 4.3 "torsion group" wording (changed) | odd `n ≥ 17` | `0 → ℤ/2 = π_n(V_(n+2,2)) → π_(n−1)(SO(n)) → π_(n−1)(O) ∈ {0, ℤ/2}`: order `≤ 4`, rank `0` | "torsion" is the lemma's word (line 5073); "finite-rank" gone | none |
| 1.4 degree of `ev_p ∘ f` (r2) | `n = 1`, `p = e₀` | signed preimages `+1` at `e₁`, `−1·−1` at `−e₁`: total `2 = 1 + (−1)⁰` | agrees | none |
| 1.4 involution degree (r2) | general `n` | antipode `(−1)^n` times `θ ↦ −θ` `(−1)`: `(−1)^(n−1)` | agrees | none |
| 1.4 `H₂(SO(3)) = 0`, `H₃(SO(4)) = ℤ²` (r2) | `ℝP³`, `S³ × ℝP³` | Künneth degree 3: `ℤ²` | agrees | none |
| 1.4 matrix `R(p, u; θ)` (r2) | `p = e₀`, `u = e₁`, `θ = π/2` | `R e₀ = e₁`, `R e₁ = −e₀`, `det = 1`, period `2π` | agrees | none |
| 1.3 dimensions (r2) | `n = 3, 2`; `d = 1` | `dim V_(3,2) = 3`; `V_(2,2) = O(2)` two components; `dim U(n)/U(n−2) = 4n − 4` | agrees | none |
| 1.3 quaternionic fields (r2) | `S³ ⊂ ℍ` | `⟨z, Iz⟩ = 0`, `⟨Iz, Jz⟩ = ⟨z, −Kz⟩ = 0`; `S^(4k+1)` has exactly one field | agrees | none |
| 1.2 ring `H_*(ΩSⁿ)` (r2) | `n = 2, 3` | `ΩS² ≃ S¹ × ΩS³`, `x² ≠ 0` with `|x| = 1`; graded commutativity would force `2x² = 0` | agrees | none |
| 2.1 indices (r2) | `CPᵈ`, `HPᵈ`, `k`-fold circle | `2d(k−1) + 1`; `2(k−1)(2d+1) + 3` | agrees | none |
| 2.2 cell degrees (r2) | `d = 1, 2` | `b_k = 2dk`; `d = 2`: cells `0, 1, 4, 5, 8, 9`; `a₂ − b₁ = 1`, no lacunarity | agrees | none |
| 2.2 Hopf product `π₂` (r2) | `ΩS⁵` vs `ΩS³` | `π₃(S⁵) = 0 = π₃(CP²)`; `π₃(S³) = ℤ` | wrong model excluded | none |
| 2.3 cell degrees (r2) | `d = 1, 2` | `b_k = 2k(2d+1)`; `d = 1`: `ℤ` in degrees `3k` | agrees | none |
| 2.4 `CP¹` total-space sequence (r2) | `E² = H_*(S²) ⊗ H_*(ΩS²)` | `d²: E_(2,q) → E_(0,q+1)` iso for all `q` | agrees | none |
| 2.5 total degrees (r2) | `d = 2` | `E_(2,4)`: `6 → 5`; `E_(4,1)`: `5 → 4`; `H₃(ΩCP²) = 0` | agrees | none |
| 2.6 dimensions (r2) | `CPᵈ`, `HPᵈ` | `(2d − 1) + 1 = 2d = b₁`; `(4d − 1) + 3 = 4d + 2 = b₁` | agrees | none |
| 3.1 torsion class (r2) | `α` of order `N` | `Nα = 0 = f_*[∅]`; Theorem B's `α` has infinite order so `S ≠ ∅` | agrees | none |
| 3.1 clearing denominators (r2) | general | `D = lcm(b_i)`, `N = mD`, negative `c_i` by reversing orientation | route sound | none |
| 3.3 hypotheses (r2) | `T^r`, `ℝP³`, `S²` | `π_ℓ(T^r) = 0`, `ℓ ≥ 2`; `π₃(ℝP³) = ℤ`; `π₂(S²) = ℤ` | agrees | none |
| 4.1 products (r2) | `deg α = dim M` | `deg(α × [N]) = dim M + dim N`; constant spheres have zero reduced shriek | agrees | none |
| 4.2 degrees (r2) | `Sⁿ` even, `S^(4k−1)`, `S²` | `3n − 3`; `2n − 2`; `Σ_p = O(2)`, `α ∈ H₃` | agrees | none |
| 4.2 Serre comparison (r2) | `B` `2n`-connected | differentials into `E_(0,q)`, `q ≤ 2n − 3`, all zero | agrees | none |
| 4.3 `π₂(SO(3))` (r2) | `S³ → SO(3)` | `π₂(S³) = 0` | agrees | none |
| 4.3 `π₈(SO(9)) = (ℤ/2)²` (r2) | `SO(8) → SO(9) → S⁸` | `∂: π₈(S⁸) → π₇(SO(8)) = ℤ²` injective (Euler number `2`), `(ℤ/2)³ ↠ π₈(SO(9))`: exponent `2`; CSS: order `4` | refutes the source's `ℤ₄` | source issue |
| 4.3 Stiefel term (r2) | odd `n` | connecting map `χ(S^(n+1)) = 2`: `ℤ/2` | agrees | none |
| 4.3 splitting below range (r2) | `n = 7, 3` | formula `ℤ/2`, actual `0` (parallelizable spheres) | negative controls right | none |
| 4.3 stable term (r2) | odd `n ≥ 17` | `π_(n−1)(O) = ℤ/2` iff `n ≡ 1 (mod 8)` | agrees | none |
| 4.4 `S² = SO(3)/SO(2)` (r2) | `α ∈ H₀(Ω²S²)` | `j_![SO(3)] = [SO(2)]`, `β_*α′ = x² ≠ 0` | agrees | none |
| 4.4 nonorientable (r2) | `SO(3)/O(2) = ℝP²` | isotropy sign `−1` times coorientation sign `−1` = `+1` | consistent | none |
| 4.6 dimension bounds (r2) | `k` even, odd; `Y` a point | `n − k ≥ 2k − 1`, `n − k ≥ k`; fails for `k = n` | source gap recorded | none |
| 4.6 Example 7.4 (r2) | `Q′ = Tⁿ`, `k ≥ 3` | `π₂(Q) = 0`, `Q` rationally essential | agrees | none |
| 1.1 `k`-products (r2) | Dowker's CW pair | product topology ≠ `k` topology | witness right | none |
| 1.5 collapses (r2) | `N = ∅`; a framed point | degree `0`; `±1` | agrees | none |

**Seeded source sample.** The sampled targets 1.1–1.4, 2.1, 2.2, 2.4–2.6, 3.1–3.3, 4.1, 4.3 and 4.6
were verified in full in the previous report against `bdho-cotangent`, `hatcher-at` and CSS, with
the locators listed there; the diff touches only 1.3's curvature Check, 3.4's sign Check and 4.3's
Lemma 6.35 bullet, re-read above at `bdho-cotangent` lines 262–292 and 5070–5094 and at the base's
Layer 6 item 3. The theorem numbers, pages and hypotheses of the sampled targets are unchanged.

**Cross-roadmap citations the diff touches.** DGFloer Layer 6 item 3 (main lines 1076–1086; open
head §6.3, lines 1654–1672): resolved, same sign. HomotopySpheres 4A–4B (the stable real Bott
computation, cited in the 4.3 bullet): unchanged citation, resolved in the previous report at
52ebd6f8 lines 1204–1435. Crowley–Schick–Steimle, proof of Lemma 2.2: unchanged, CSS lines 221–223.
The worker's citation check finds no cross-roadmap citation and no Lean name unresolved; every
backticked name of the roadmap's own (the eight theorems and `SO`) is declared in `Suggested.lean`.

**Ownership against open pull requests.** Unchanged from the previous report: the objects of
Layer 4 are stated only in this folder and in DGFloer on main (R01); the base's revision at
fc27fe2b names DGFloerPartII as their owner. No other open pull request builds them.

The pull request's description still says "the finite-rank odd-sphere group"; it is not a roadmap
file and no finding is raised on it.

## Not verifiable

- W. Ziller, *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977), Theorems
  3 and 8 (2.1 and the Layer 2 Dependencies): not in the sources cache (Springer, paywalled). The
  index formulas were recomputed from conjugate points (table, row 2.1).
- R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959): not in the
  cache (JSTOR); background for Layer 2 only.
- Milnor–Stasheff, *Characteristic Classes*, Chapter 5, and Steenrod, *The Topology of Fibre
  Bundles*, Part I §7: not in the cache; chapter titles match the use.
- The "[Jap87, Appendix A, Tables 6.VII, 6.VIII]" the source cites for Lemma 6.35: not in the
  cache; the values were checked by exact sequences and CSS (table).

## Source issues

- **Error** in bdho-cotangent at proof of Lemma 6.35, printed page 116: the source says
  `π₈(SO(9)) = ℤ₄`; it should be `ℤ/2 ⊕ ℤ/2` (a quotient of `π₈(SO(8)) = (ℤ/2)³` of order 4 by
  Crowley–Schick–Steimle's split stabilization); affects nothing (the lemma needs only torsion).
- **Gap** in bdho-cotangent at §7 preamble, printed page 123: the source says `ℓ`-connectivity of
  `Y` forces `n − k ≥ 2k − 1` (even `k`) or `n − k ≥ k` (odd `k`); it should add `dim Y > 0`,
  since a point is `ℓ`-connected for every `ℓ` and the bound fails for `k = n`; affects nothing.
