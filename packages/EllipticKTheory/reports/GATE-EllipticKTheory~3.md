# GATE-EllipticKTheory~3: answers to human review

Commit: `fbe4d255` on top of `356badf` ("EllipticKTheory: review repairs (curve Steinberg homology from ArithmeticKTheory §3.2, localisation reduction, Finite k)"). Not pushed.

## H01 (roed-math) — applied

The old contract `gap:function-field-steinberg-homology` (README L159–161, L416–420 at `356badf`) asked ArithmeticKTheory §3.2 for finitely generated Steinberg homology for every smooth affine curve over a finite field. It is replaced by a citation of ArithmeticKTheory §3.2 curveSteinbergHomology_fg, which that roadmap now owns at its head `3f68345` (ArithmeticKTheory README L77–84 and L1193–1236): finite for `i > 0` and finitely generated for `i = 0`, for a curve with exactly **one** closed point at infinity. This is also the scope of Quillen's theorem (quillen-owr-1974 lines 219–233, p. 7). In `TauCetiRoadmap/EllipticKTheory/README.md` §5.5, curveFiniteGeneration now applies the criterion only in the one-point case. Several points at infinity are reached through the open-complement sequence `⊕_j K_n(k(x_j)) → K_n(R₀) → K_n(R) → ⊕_j K_{n−1}(k(x_j))` (SchemeKTheoryOperations §3.5 with Cartan §2.6), whose outer terms are K-groups of finite fields, so no further Steinberg input is needed. Scope (L136–144, L162–166), the ArithmeticKTheory supplier contract (L413–430), §5.5 and the Layer 5 dependencies are rewritten to match.

Details of the repair:

- **README Scope, ArithmeticKTheory bullet (L136–144).** Old: "It does not treat curves over finite fields". New: ArithmeticKTheory owns curveSteinbergHomology_fg for one point at infinity, and §5.5 here owns the K-groups of curves over finite fields, including the reduction from several points at infinity to one. While editing the same clause, ArithmeticKTheory §2.1 is now described as what it is: the localisation sequence of `O_{F,S}` indexed by the places outside `S`. The general Dedekind sequence it consumes is SchemeKTheoryOperations §3.7.
- **README L162–166 (old L159–161).** The gap sentence is replaced. ArithmeticKTheory §3.2 owns the criterion and both Steinberg inputs (number fields, and curves with one point at infinity). §5.5 applies the criterion in the one-point case and localises.
- **README supplier contract (L413–430, old L413–425).** The `gap:` block is deleted and the curveSteinbergHomology_fg contract is stated with its hypotheses:
  - smooth affine integral curve, one closed point outside `Spec R`, finitely generated projective `P` of rank `n ≥ 1`;
  - `St = ℤ` in reduced degree `−1` in rank one;
  - a non-circularity clause: the proof uses neither K-groups nor the cohomology finiteness of `S`-arithmetic groups;
  - a negative control: for `𝔽₂[t, t⁻¹]`, `H₁ = ℤ` is infinite.

  The criterion's quantifier ("for every finitely generated projective `P` of positive rank and every `q ≥ 0`") is now explicit.
- **README §5.5 (L1468–1511).**
  - The Steinberg paragraph cites curveSteinbergHomology_fg with the one-point hypothesis.
  - curveFiniteGeneration is split into a one-point case (criterion) and a general case (localisation from `R₀ = O(X_R − ∞)`). The step for `X` uses the one-point case.
  - The argument for finiteness of `Pic⁰`, previously asserted without a reason, is given: Riemann–Roch over the exact constant field, plus finitely many effective divisors of each degree over a finite field.
  - *Needs:* the gap tag is dropped. Added: SchemeKTheoryOperations §§2.6, 3.5, AlgebraicCurves Layer 12 and the curveSteinbergHomology_fg item. Our §3.1 is removed: its sequence runs to the function field, not to an open complement.
- **README §5.5 Checks (L1540–1547), two new.**
  - `𝔽₂[t, t⁻¹]` through the reduction gives `K_1 ≅ ℤ` (negative control for applying the criterion directly).
  - `ℙ¹_{𝔽₂}` minus the degree-two point `V(t²+t+1)` has `Pic(R) = ℤ/2`: the criterion's hypothesis is finiteness, not triviality.
- **README Layer 5 Dependencies (L1790–1793).** Added SchemeKTheoryOperations §§2.6, 3.5, AlgebraicCurves Layer 12, JacobianChallenge Layers A–B, and the precise ArithmeticKTheory §3.2 items.

The reviewer's first option, settling this with ArithmeticKTheory, was taken; that roadmap's head now carries the function-field case. The fallback was not needed: making the Steinberg finiteness a hypothesis or target here would have duplicated a target ArithmeticKTheory owns. The one-point narrowing is required, not optional: neither the supplier nor Quillen's report states the several-points case.

## Other change (gate repair, not from review)

The first gate run failed `statement-hygiene=1` on a finding already present at `356badf`: "line 71: P3 `[Fintype k]` beside `[Field k]` (theorem `card_twistedFrobeniusKernel`); repair: use `[Finite k]`".

- **What changed.** In `TauCetiRoadmap/EllipticKTheory/Suggested.lean`:
  - `twistedFrobeniusKernel` now takes `[Finite k]` and carries all its binders in its own signature (previously section `variable`s).
  - It builds `letI : Fintype k := Fintype.ofFinite k` inside its body. Mathlib's `FiniteField.frobeniusAlgHom` needs `[Fintype K]` (Mathlib `FieldTheory/Finite/Basic.lean` L250). Tau Ceti's `WeierstrassCurve.frobeniusTrace` uses the same pattern (`TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean` L101–105).
  - `q` is written `Nat.card k`.
  - `card_twistedFrobeniusKernel` takes `[Finite k]` and uses `Nat.card k`.
- **Why the meaning is unchanged.** `Fintype.card k = Nat.card k` for every `Fintype` instance, so the carrier and the stated order are the same.
- **README.** It needed no change: it states the definition and theorem with `q = #k`.

## Build

`lake build TauCetiRoadmap.EllipticKTheory.Suggested` passed: "Build completed successfully (9059 jobs)". The only warnings are six `declaration uses 'sorry'`, at Suggested.lean lines 71, 138, 146, 156, 201 and 213 (the six headline theorems).

## Gate

`gate EllipticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

## Direction check

`depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. ArithmeticKTheory is line 126 of the merge order and EllipticKTheory line 366, so the new citation points to an earlier supplier.

## Signature check

I put `#check @name` for all 14 declarations in one scratch file importing the built module and elaborated it once with `lake env lean`. That is the mechanical check this job's instructions require; it is not one of the two commands they list. Results:

- `twistedFrobeniusKernel : {k} → [Field k] → [Finite k] → (W : WeierstrassCurve k) → (L) → [Field L] → [DecidableEq L] → [Algebra k L] → ℕ → AddSubgroup (Point (W.baseChange L))`. Changed from `[Fintype k]` via section variables; it agrees with README §5.10.
- `card_twistedFrobeniusKernel : ∀ {k} [Field k] [Finite k] [DecidableEq k] (W) [W.IsElliptic] [DecidableEq (AlgebraicClosure k)] {i}, 1 ≤ i → ↑(Nat.card ↥(twistedFrobeniusKernel W (AlgebraicClosure k) i)) = 1 − W.frobeniusTrace * ↑(Nat.card k) ^ i + ↑(Nat.card k) ^ (2*i+1)`. It agrees with README §5.11 finiteFieldK_orders: finiteness, ellipticity and `i ≥ 1` are all in the signature.
- The other 12 (`RegularProperModel` and its three members, the three model theorems, `tameValue`, `SymbolCandidate`, `SymbolCandidate.tame`, `tame_last_point`, `blochCorrection`) are unchanged and their elaborated binders are as before.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| curveSteinbergHomology_fg as restated (one point at ∞, rank `n ≥ 1`) | rank 1, `R = 𝔽₂[t]`; rank 1, `R = 𝔽₃[t]`; rank 1, `R = 𝔽₂[t,t⁻¹]` (two points); rank 2, `R = 𝔽_q[t]` | `Aut = 𝔽₂^× = 1`: `H_i = 0` (i>0), `H_0 = ℤ`. `Aut = ℤ/2`: `H_odd = ℤ/2`, `H_even>0 = 0`. Two points: `Aut = {t^k} ≅ ℤ`, `H₁ = ℤ`, infinite. Rank 2: finite vertex stabilisers of order `(q−1)²q^{k+1}`, unbounded in `k` (supplier Check). | Holds with the one-point hypothesis; fails without it (two-point case) | Contract narrowed to one point; two-point case kept as a negative control in the contract and Checks |
| Quillen's criterion as restated ("every f.g. projective `P` of positive rank, every `q ≥ 0`") | `P = 0`; rank 1, `m = i = 1` | `St` of the zero space is undefined, so rank 0 is excluded. Relative group `⊕_{Pic(R)} ℤ` (supplier Check). | Holds | Quantifier made explicit |
| One-point case: `Pic(R)` finite | `R = 𝔽_q[t]`; `ℙ¹_{𝔽₂}` minus `V(t²+t+1)`; `E: y²+y=x³+x+1` over `𝔽₂`, `R = O(E − O)` | `Pic = ℤ/⟨1⟩ = 0`; `ℤ/⟨2⟩ = ℤ/2`; `Pic⁰ = E(𝔽₂) = {O}` (no affine solutions: `x=0` or `x=1` both give `y²+y = 1`), so `Pic(R) = Pic⁰ = 0` | Holds; the hypothesis is finiteness, not triviality | New Check (ℤ/2 case) |
| `Pic⁰(X_R)` finite (Riemann–Roch plus finitely many effective divisors) | `ℙ¹` (g=0); 37a1 over `𝔽₂`; `y²+y=x³+x+1` over `𝔽₂` | `Pic⁰ = 0`; 37a1 (`y²+y=x³+x`): affine points `x∈{0,1}`, `y∈{0,1}`, 4 + O = 5, so `ℤ/5`; `{O}`, order 1 | Holds | Argument added |
| Several points at ∞ by localisation | `R = 𝔽₂[t,t⁻¹]`, `R₀ = 𝔽₂[t]`, `x₁ = (t)`, n = 0, 1, 2; `r = 0` | n=0: `ℤ →0→ ℤ → K₀(R) → 0`, so `K₀(R) = ℤ` (PID). n=1: `1 → K₁(R) → ℤ →0`, so `K₁(R) = ℤ = R^×`. n=2: `0 → K₂(R) → K₁(𝔽₂) = 1`, so `K₂(R) = 0`, matching the fundamental theorem `K₂(F)⊕K₁(F) = 0`. `r = 0` is the one-point case. `K_{−1} = 0` at n = 0. | Holds; finitely generated as claimed | New Check (K₁ ≅ ℤ) |
| `i_*[k(x₁)] = 0` in `K₀(𝔽₂[t])` | `x₁ = (t)` | `[R₀/tR₀] = [R₀] − [tR₀] = 0` since `tR₀ ≅ R₀` | Holds | Used in the Check |
| `K_n(X)` f.g. via `K_n(k(x₀)) → K_n(X) → K_n(X − x₀)` | `X = ℙ¹_{𝔽_q}`, `x₀` rational | `K_n(ℙ¹) = K_n(𝔽_q)²`, finitely generated; agrees with §5.4 `K_{2i−1}(ℙ¹) = (ℤ/(q^i−1))²` | Holds | `X − x₀` now explicitly the one-point case |
| `twistedFrobeniusKernel` with `[Finite k]` | `i = 0`; `k = 𝔽₂`, any instance | Carrier at `i = 0`: `π(P) = P`, i.e. prime-to-`p` points of `E(F_q)` (docstring). `Fintype.card k = Nat.card k = 2` for every instance, so the carrier is unchanged. | Holds | Binders in own signature; `Nat.card k` |
| `card_twistedFrobeniusKernel` (`i ≥ 1`) | `y²+y=x³+x+1` over `𝔽₂` (`a = 2`), `i = 1`; 37a1 over `𝔽₂` (`a = −2`), `i = 1` | `1 − 2·2 + 2³ = 5`, equal to the README §5.4 Check `#K₂(E) = 5`. `1 + 4 + 8 = 13`. Both ≡ 1 mod 2, so prime to `p` as §5.11 states. `det(1 − qπ) = 1 − q·a + q²·q` from `X² − aX + q`. | Holds | None |

Context: the statements changed in README §5.5 carry their standing hypotheses in the sentence (smooth, affine, integral by the Conventions, over a finite field, one point at infinity where needed). In Lean, the `#check` output above shows `[Finite k]`, `[W.IsElliptic]` and `1 ≤ i` in the signatures.

## Ownership and citations

- **Owner of the object.** curveSteinbergHomology_fg belongs to ArithmeticKTheory §3.2, a new-roadmap pull request earlier in the merge order. Its head `3f68345` is the copy checked; `roadmaps list` gives the same head.
  - The target appears there only from `3f68345`. The head the review links, `00f60c5`, excluded curves over finite fields (its L76–78).
  - EllipticKTheory therefore depends on ArithmeticKTheory merging at or after `3f68345`. This is a new roadmap, not a revision, so nothing goes under "only an open revision defines".
  - ArithmeticKTheory's Downstream consumers (L5041–5045) assigns the reduction from several points at infinity to its consumers, which §5.5 here now does. Each object therefore has one owner.
- **Search for other owners.** `roadmaps grep` for `curveSteinbergHomology_fg` finds only ArithmeticKTheory. `roadmaps overlaps` (scratch `overlaps.md`) lists no pull request that changes this roadmap and no dropped ids.
- **Citation resolution.** `roadmaps resolve` on the edited README finds no cross-roadmap citation and no Lean name that resolves nowhere. The earlier lead `RegularProperModel.genericFibreInclusion` is this roadmap's own declaration (Suggested.lean L114).
- **SchemeKTheoryOperations §3.5 contents.** Checked at its open head `393a8f1`: the coherent fibre sequence `G(Z) → G(X) → G(U)` and, for regular `X` with regular `Z`, the identification of supported K-theory with `K(Z)`.

## Sources

- **quillen-owr-1974.** D. Quillen, Oberwolfach Tagungsbericht 26/1974, p. 7. Fetched through the sources service from the Oberwolfach Digital Archive (institutional, open). Lines 219–233 state the Steinberg-homology theorem for a complete nonsingular curve over `𝔽_q` minus one point: finite for `i > 0`, finitely generated for `i = 0`.
  - The README already cites this report in References (L2712–2714), but the package `sources.toml` has no key for it.
  - This job may not edit the manifest. The worker should record it under `quillen-owr-1974` (`locator_scheme = "page"`, `locator = "p. 7, second theorem"`, `cited_for = "5.5"`, `licence_class = "institutional"`).
- **weibel.** Lines 19053–19066 (PDF page 333 = printed p. 325): Quillen's two hypotheses and Theorem IV.6.9. The locator in §5.5 is confirmed.
- **grayson.** Settled as uncertified; cited by its locator only.
- No `needs-references.toml` was written: no text was missing.

## Untrusted text

The review contains a mathematical claim and a suggested repair; no instruction in it asks for anything outside this job.
