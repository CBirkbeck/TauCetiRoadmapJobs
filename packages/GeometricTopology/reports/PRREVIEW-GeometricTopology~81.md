# Review of GeometricTopology (pull request #903 at aaa605b)

**Verdict:** needs changes

This is an incremental re-review of the 36 lines changed since `a6ba299` (r80), all in `README.md`; `Suggested.lean` is byte-identical. All five r80 findings are repaired in this folder. The new FourManifolds consumer sentence conflicts with 4.7, which gives one new finding (R01).

## R01 (P2) — The Arf invariant's vanishing on slice knots is claimed both by 4.7 and, in the new consumer sentence, by FourManifolds

**Location.**
- `README.md:4252` (4.7, unchanged): "The Arf invariant is a concordance invariant and vanishes for slice knots (Layer 6)."
- `:7989` (the repaired FourManifolds bullet): "and adds their vanishing on smoothly and topologically slice knots (its §§1.4 and 3.6)".

**Claim.** The vanishing of the knot Arf invariant on slice knots has a single owner.

**Witness.** Layer 6 (`README.md:6247–6646`) never mentions Arf, so 4.7's bullet is a target of this roadmap that no layer states. The new clause gives the same theorem to FourManifolds, which proves it at its head (#936 `46ee76a`, `README.md:32–34`, `:574`, `:1746`).

**Repair.** This roadmap should own it: it comes before FourManifolds in the merge order, and 6.2.1 item 5 already builds the needed object in both categories.
1. In 6.2.1 item 5, after "…gives a primitive rank-g′ isotropic summand of the size-2g′ presentation." (`:6433`), add: "Reduced mod 2, this summand is a g′-dimensional subspace of `H₁(F′;𝔽₂)` on which 4.3.1's refinement `q(x) = θ(x,x) mod 2` and its polar form vanish. So 4.3.1's criterion gives `Arf(K) = 0` for every smoothly or topologically slice knot. With 4.3.1's additivity and its invariance under mirror and reversal, Arf is a homomorphism from both concordance groups onto `𝔽₂`." Add "4.3.1" to 6.2.1's *Needs:* (`:6488`, "4.3, 4.3.1, 4.4 and 6.1").
2. At `:4252`, replace "(Layer 6)" with "(Layer 6.2.1, item 5)".
3. At `:7989`, replace "and adds their vanishing on smoothly and topologically slice knots (its §§1.4 and 3.6)" with "and Layer 6.2.1's vanishing of the knot Arf invariant on smoothly and topologically slice knots".

FourManifolds §§1.4 and 3.6 then cite 6.2.1 for the vanishing; that edit belongs to #936.

The other way round also works: delete the bullet at `:4252` and name FourManifolds §§1.4 and 3.6 in Scope. But then FourManifolds' Lagrangian `U = ker(H₁(F̂;F₂) → H₁(W;F₂))` (#936 `README.md:588–591`) re-plans item 5's half-lives-half-dies summand.

**Tested.**
- **The route is sound.** Let P be the summand, primitive of rank g′, with `θ(P, P) = 0`.
  - On P, `q(x) = θ(x,x) = 0` and `x·y = θ(y,x) − θ(x,y) = 0`.
  - P reduces to a g′-dimensional subspace of the 2g′-dimensional `H₁(F′;𝔽₂)`.
  - For a knot the radical is 0, so 4.3.1's criterion (a q-zero subspace of finrank m) gives Arf 0.
- **The figure-eight knot.** It has `V = [[−1,1],[0,1]]`, so `q = x² + xy + y²` has no nonzero zero and Arf is 1 (`Δ(−1) = 5`). Meanwhile `σ([[−2,1],[1,2]]) = 0`. So the repaired statement shows `4₁` is not slice, which 6.2's signature cannot.
- **Agreement with 4.7's Checks.** The trefoil has Arf 1 and `σ = −2`. The slice knot `T # T̄` has Arf `1 + 1 = 0`. The slice knot `6₁` has `Δ(−1) = 9 ≡ 1 (mod 8)` and Arf 0. All three agree with 4.7's Checks.

## Previous findings

- **R01 — repaired.**
  - `README.md:7986–7988` now reads: "FourManifolds consumes Layers 1, 2 and 6, Layer 4.3.1's finite quadratic Arf algebra and its knot and proper-link Arf invariant (independence of the surface, additivity and the determinant–Arf criterion, with 4.5.3's signed congruence …)".
  - At #936's unchanged head `46ee76a`:
    - §1.4 still defines the invariant (`README.md:538–572`);
    - its Scope (`:26–29`) still says that no GeometricTopology layer states the finite Arf algebra.
  - Those are defects of FourManifolds, the later consumer, for its own review. The new clause on slice vanishing is R01 above.
- **R02 — repaired; no change was asked of this folder.**
  - `README.md:56–63` and `:7992–7996` still make 4.5.3 the owner of the `δ = √2` finite model, consumed by TemperleyLiebOperatorAlgebras §1.7.
  - #867 at `7cf3fee` (unchanged) still lists the model as its own target (`README.md:853–857`). That is #867's defect.
- **R03 — repaired.** `:2186` reads "(1947), 101–126, Theorems 8–16", which agrees with References `:8084`.
- **R04 — repaired.** `:1637–1642` reads: "homeomorphic complements (`…nonempty_complementHomeomorph`) and diffeomorphic ones: the final diffeomorphism (`TauCeti.Diffeotopy.final`) … restricts to a diffeomorphism of the open complements". I checked this at the pin (below).
- **R05 — repaired.**
  - The finite algebra now has four Checks: Planes, Orthogonal sum, Basis change and Zero space (`:2447–2458`).
  - The Seifert dictionary now has three: Trefoil, Hopf, and Proper link and orientation (`:2487–2499`).
  - Every value was recomputed (table).

## Verified sound

**Gate and dependencies.**
- My gate run on `aaa605b` exits 0 and ends with "… depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK". The worker's gate adds `build=0`.
- `--depcheck --movable` prints "depcheck: 238 roadmaps, 2322 edges, 0 problem(s)" and exits 0. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- No forbidden supplier name (the brief's list of 15) occurs in the README.

**Lean.**
- `git diff --quiet a6ba2997 HEAD -- …/Suggested.lean` succeeds, so the file is unchanged.
- **Elaboration.** A scratch copy with `#check @…` for all 26 theorems elaborates with 26 `declaration uses sorry` warnings and no error. The printed types are those of `signatures.md` and r80.
- **Padding probe.** Replacing every `sorry` by `first | rfl | simp | infer_instance | decide | trivial | assumption` gives 26 errors on the 26 tactic lines.
- **Headlines.** The list and the docstring are unchanged and carry over from r80.

**Pinned declarations opened** (Tau Ceti `2fd255d9`):
- `TauCeti.Diffeotopy.final`, at `Geometry/Diffeomorphism/Diffeotopy/Basic.lean:186`, is the time-one slice (`final_apply`, `:195`).
- `SmoothLinkEmbedding.SmoothAmbientIsotopic`, at `KnotTheory/SmoothLink/Isotopy.lean:39`, is `∃ Φ : Diffeotopy I ∞ M, ∀ i x, Φ.final (L i x) = K i x`.
- `…SmoothAmbientIsotopic.nonempty_complementHomeomorph`, at `KnotTheory/SmoothLink/AmbientIsotopy.lean:279`, gives `Nonempty (↑(L.range)ᶜ ≃ₜ ↑(K.range)ᶜ)`.
- So the R04 text is exact: `Φ.final` carries `range L` onto `range K`, the ranges are compact in a Hausdorff space, and their complements are open.

**Cross-roadmap citations resolved.**
- **FourManifolds** (#936 `46ee76a`):
  - §1.4 is at `README.md:488` and §3.6 at `:1579`.
  - The Arf definition is at `:538`, smooth-slice vanishing at `:574` and topological-slice vanishing at `:1746`.
  - Levine's congruence (`:555–557`, "≡1 mod 8" / "≡5 mod 8") is 4.5.3's signed congruence. `gap:finite-quadratic-arf` is at `:369`.
  - So "(its §§1.4 and 3.6)" points correctly.
- **TemperleyLiebOperatorAlgebras** (#867 `7cf3fee`): `:849–857` and its contract at `:365–367`.
- **Internal targets** the new text cites:
  - 4.5.3's reversal law `Arf(L_reversed) = Arf(L) + ℓ/2` (`:3519–3521`);
  - its signed congruence (`:3549–3552`);
  - its `T(2,4)` Check, `+√2`, Arf 1;
  - 4.4.7's `L_n` with linking number `n/2` and the two-disc/n-band surface (`:3118–3120`, `:3163–3166`);
  - 4.8.2's Check, "reversing one component of L₄ (Arf 1) gives … Arf 0" (`:4814`).

**Ownership and overlaps.**
- The diff adds no object; the one ownership sentence it adds is R01.
- 4.3.1 and 4.5.3 belong here: this roadmap is on main, ahead of FourManifolds (`ORDER.txt` line 134) and TemperleyLiebOperatorAlgebras (line 243), and 4.5.3 consumes 4.3.1.
- `overlaps.md` lists six items:
  - The conflicts with #1517, #1791 and #1797 were settled as not actionable in this folder (r71).
  - The three anchors cited elsewhere are mapped at `:770–779`.
  - No cited id is dropped, and none is defined only by an open revision.
- I read the heads of #936 and #867. Ownership against the other open pull requests rests on `overlaps.md` and the previous rounds.

**Seeded sample.** Of the 15 targets, only 4.7 depends on a changed passage: it consumes 4.3.1's knot Arf invariant.
- The determinant and colouring statements are standard.
- "Compare Kolay §4, Proposition 4" is right: §4 begins at `kolay2019` line 115, Proposition 4 (equal cofactors under zero row and column sums) is at line 171, p. 4, and the ±1-weighted version is Exercise 7 at line 189.
- The Checks are recomputed in the table. The slice bullet is R01.
- The other 14 targets lie in text this diff leaves untouched, and I did not reread them.

**Source behind 4.3.1's route.** Pyronneau, read from the UT Austin institutional copy into a scratch manifest:
- §2.1 begins at line 127.
- Definition 2.9 (`Arf = Σ q(aᵢ)q(bᵢ)`) is at line 184, p. 4, and Lemma 2.11 at line 196, p. 4.
- Lemmas 2.12 and 2.13 are at lines 206 and 217, Corollary 2.14 at line 226 and Theorem 2.15 at line 230, all on p. 5.
- This matches "§2.1, Lemmas 2.11–2.13, Corollary 2.14 and Theorem 2.15, pp. 4–5". The step `r(φ + q₀) = 2r(φ)` is the README's "multiply over orthogonal sums" (misprint below).

**Remark (untouched clause, no change asked).** The FourManifolds bullet's "Layers 1, 2 and 6" omits Layers 3 and 5, which FourManifolds' own contract cites (#936 `README.md:175`, `:688`, `:2849`).

**Adversarial table.** New rows were computed this round; rows marked r80 carry over unchanged statements from the previous report.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 4.1 complements (R04) | `Φ.final ∘ L i = K i` | `Φ.final '' range L = range K`; bijective, so `(range L)ᶜ ↦ (range K)ᶜ`; `S¹` compact, `S³` T2, complements open | right |
| 4.2.8 pages (R03) | Crossref | first page 101, next article 127; inline `:2186` = References `:8084`; p. 103 inside | right |
| 4.3.1 *Orthogonal sum* | `q₁ ⊥ q₁` on `F₂⁴` | Arf `1+1 = 0`; Gauss `(−2)(−2) = 4 = 2²`; zeros `1·1 + 3·3 = 10 = 2³ + 2¹`; `q₀ ⊥ q₀`: `3·3 + 1·1 = 10`; `Π q(aᵢ)q(bᵢ) = 1 ≠ 0` | right |
| 4.3.1 *Basis change* | `q = xy` | `polar((1,1),(0,1)) = q(1,0) − q(1,1) − q(0,1) = −1 ≡ 1`; `Σq(aᵢ)q(bᵢ)`: `0·0 = 0`, `1·0 = 0`; `Σq(aᵢ)`: 0 vs 1 | right |
| 4.3.1 *Zero space* | `m = 0` | Arf 0, Gauss 1, one zero; ℕ: `2^(0−1) = 2⁰`, so `1 + 1 = 2 ≠ 1` | right |
| 4.3.1 *Planes* (r80) | `xy`, `x²+xy+y²` | Arf 0/1, Gauss `2/−2`, zeros 3/1 | right |
| 4.3.1 *Proper link* | `L_4`, reversed | `q = x₁+x₂+x₃+x₁x₂+x₂x₃`; polar kernel `⟨e₁+e₃⟩`, `q = 0` there; quotient `q(e₁) = q(e₂) = 1`, Arf 1; 8 signs `+−−−−−+−` sum `−4 = −2^(1+2−1)`; reversed `[2]`, `q ≡ 0`, Arf 0 | right |
| same, by Jones | `σ₁⁴` | `V = −t^(3/2) − t^(7/2) + t^(9/2) − t^(11/2)`; at `u = e^(iπ/4)`: `+√2` vs unlink `−√2` (Arf 1); reversal `× i^(−6) = −1` (Arf 0) | right |
| consumer: `Δ(−1) ≡ 1 − 4Arf (8)` | `3₁, 4₁, 5₁, 5₂, 6₁` | `∇(2i) ≡ 1 − 4a₂`; `Δ(−1) = −3, 5, 5, −7, 9`; `a₂ = 1, −1, 3, 2, −2` | right |
| 4.7 slice vanishing | `4₁`, `3₁`, `T#T̄`, `6₁`; Layer 6 | Arf `1, 1, 0, 0`; `σ(4₁) = 0`; 0 occurrences of "Arf" in `:6247–6646` | R01 |
| 4.7 Checks | trefoil, `4₁`, unknot | 6-colourings `6·1·3 = 18`; `(0,2,4)`: `0 ≡ 6`, `4 ≡ 4`, `8 ≡ 2`; `5·5 = 25`; 3-colourings 9, 6 non-constant | right |
| 3.1 (r80) | `θ + k⁻² sin kθ`; `S⁰` | `f′ ≥ ½`; `C¹` distance `≤ k⁻² + k⁻¹ → 0`; `sup |f″| = 1`; 2 of 4 maps | right |
| 4.1 Checks (r80) | trefoils; square, granny | `t+t³−t⁴` vs `t⁻¹+t⁻³−t⁻⁴`; `σ = 0, −4`; `Δ = (t−1+t⁻¹)²` | right |
| 4.2.7 (r80) | `f_t = t·a(s/t)` | `‖f_t − e‖ ≤ 2t`; `∂_s f_t(tu₀) = a′(u₀)` | right |
| 4.2.8 action (r80) | `A_0`; inverse; `σ₀²` | `x_a x_b ↦ x_a x_b`; `A(x_b⁻¹x_ax_b) = x_b`; `x₀ ↦ x₀x₁x₀x₁⁻¹x₀⁻¹` | right |
| 4.3.5 (r80) | `σ₀³`; empty; one letter | `[[−1,0],[1,−1]]`, `t²−t+1`; `2+2 = 3+1`, `0+2 = 1+1` | right |
| 4.4 (r80) | `T(2,n)`; `3₁, 4₁, T(2,5)` | `Σ(−t)^j` at −1 is n; dets 3, 5, 5 | right |
| 4.4.4 (r80) | `V` | `Δ(1) = 1`, `Δ(−1) = 1089`; `σ = 0`; `(8t−17+8t⁻¹)²` | right |
| 4.4.9 (r80) | trefoil group | `λ₊ ↦ z⁻¹x⁶ = λ₋`; `V(1) = 1`, `V(−1) = −3` | right |
| 4.5.5 (r80) | b41; `σ₁⁻⁹` | `F(±1) = 1, 49`; `E(−1) = 9`; `G(−1) = −7` | right |
| 4.5.1 (r80) | threshold word | `Δ(ζ) = 36 − 13√5 > 6.5` | right; source error |
| 4.5.2 (r80) | `σ₁², σ₁³` | `[1,7]`, `−u−u⁵`; `[2,10]`, `u²+u⁶−u⁸` | right |
| 4.6.5 (r80) | skein products | `D(ST) = (a+μb)(c+μd)`; det `l⁻²(1−μ²)` | right |
| 4.7.8 (r80) | `a ∈ [−3,3]^r`, `r ≤ 5` | 0 mismatches over 19,607 lists | right |
| 4.8.2 (r80) | `L_4`, `L_(−4)`, reversed | `V(i) = −√2, −√2, +√2` (r80's root): Arf 1, 1, 0 | right |
| 5.1 (r80) | empty link; Hopf | `⋂ = univ`; exterior `T²×I` | right |
| 7.1 (r80) | genus 2; cusp | `4π`; `A/2` | right |
| 7.2 (r80) | prism; smoothing | `k+1` simplices; `‖s(c)‖₁ ≤ ‖c‖₁` | right |
| 7.4 (r80) | Weeks | `H₁ = ℤ/5 ⊕ ℤ/5`; `0.9427 < 1.0149` | right |
| 8.4 (r80) | `(2,1)` vs `2/1` | multiplicity 2 vs regular | right |
| `property_P`, `property_R` (r80) | unknot `1/q`; `p/q` | `S³`; `H₁ = ℤ/|p|` | right |
| `cyclic_surgery_theorem` (r80) | trefoil `11/2` | `|11 − 12| = 1` | right |
| `gordon_luecke`, knot group (r80) | trefoils | reflection; onto `S₃` | right |
| `waldhausen_theorem`, Poincaré, Manolescu (r80) | `L(7,1)`, `L(7,2)`; `ℝ³`; `n = 3` | `2 ∉ {±1}`; non-compact; Moise | right |
| 26 headlines | `#check`; probe | types as r80; 26 of 26 fail | right |

## Not verifiable

- **Lickorish**, *An Introduction to Knot Theory*, Chapters 9–10 (4.7), and **Burde–Zieschang**, Chapter 1: neither is in the manifest, and neither was fetched.
- **Artin**, *Theory of braids*: the link is a copy with no licence class. Only the page range was checked, by Crossref (r80).
- **Uncertified** (cited by locator only): `hirsch1976`, `kauffman1987`, `rourke-sanderson1972`, `thurston1986`, `gabai1983`, `htw1998`, `lickorish1962`, `lickorish1964`, `farb-margalit2012`, `haagerup-munkholm1981`, `monod2001`.
- **Image-only**: `kauffman1990` (4.6.1). OCR is not available on this worker.
- **Read into a scratch manifest only**: Pyronneau (institutional). The package manifest has no entry for it, though the README cites it; recording it is a worker-level manifest fix.

## Source issues

- **Misprint** in Pyronneau 2024, *The Arf and Rohklin's invariant* (no manifest key), at Lemma 2.13, proof, p. 5: the source says that adding the hyperbolic plane q₀ gives `p(φ+q₀) = 3p(φ) + q₀(v)`, and likewise for n; it should be `p(φ+q₀) = 3p(φ) + n(φ)` and `n(φ+q₀) = 3n(φ) + p(φ)`; affects nothing.
