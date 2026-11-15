# FIX-PKG-LogicAndDefinabilityInNumberTheoryPartII~9

This round repairs the findings of REV-PKG-LogicAndDefinabilityInNumberTheoryPartII~8. There is one review, so the finding ids are plain.

Only `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md` changed. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied

The finding is right. `TauCeti.Place.exists_ne_zero_forall_mem_ord_eq` only prescribes orders, but the inclusion `⊇` needs congruences `b ≡ x` at the places of `D_{fα} ∖ {P}`. The review's witness holds, recomputed below. `pop_eei2 line 709` uses weak approximation at this step.

**What changed.**
- §5.6(c) now proves the identity `(1 + ⋂_{D_{fα}} 𝔪_Q)·(1 + ⋂_{D_{gα}} 𝔪_Q) = 1 + 𝔪_P` with `TauCeti.Place.exists_forall_mem_valuation_sub_le`, and names its targets and bounds.
- The witness is a new §5.6 Check.
- The lemma replaces the order lemma in the §5.6 *Needs:* line.
- The lemma is added to the Layer 5 Dependencies (the order lemma stays there for 5.2) and to `### From Tau Ceti`.

**How the repair differs from the review's text.**
- The condition is `ord_Q(b − x) > ord_Q(1 + x)`. The review's `max(0, ·)` is not needed.
- The argument has an explicit branch `b = x`, because Tau Ceti's `ord` gives `0` the junk value `0`.
- `b ∈ 𝔪_Q` is written as membership, not as `ord_Q(b) ≥ 1`.

**Pattern search.** The other uses of the order lemma need orders only:
- 4.7: `y` of least value in `B_w(a_d)` and very low value elsewhere. `B_w` is defined by values (§4.4).
- 5.2: `w(x) < 0 < w′(x)`.

No other passage of the README builds a product `1 + ⋂ 𝔪`.

## F02 (P3) — applied differently

The finding is right. At a closed point whose residue degree over the constant field is divisible by `n_K`, every constant is an `n_K`-th power.
- In the review's example, `𝔽₉ˣ` is the group of tenth powers in `𝔽₈₁ˣ`, so every constant is a square.
- In characteristic two the same happens: `𝔽₄ˣ` is the group of 21st powers in `𝔽₆₄ˣ` at a point of degree three, so every constant is a cube.

**What changed.**
- **0.6(e).** `q` may now have coefficients in `O_{V,x}` (for instance over `k`), and its reduction to `k_x` must be anisotropic. The text names Poonen's version (`q` over `k`). Two sentences of the proof now speak of the image of `q`.
- **0.8, characteristic `p`.** The model is taken over the constant field. `b` is a unit of the local ring whose residue is not an `n_K`-th power. Such residues exist: the residue field has odd order when `n_K = 2`, and when `n_K = 3` it contains the residue of `ζ₃`.
- **New 0.8 Check.** Over `𝔽₉(t)`, take the point `π = t² − (1 + i)` and `b = t`.

**Why differently.** The review's text applies 0.6(d) along the discrete valuation rings inside the proof of 0.6(e). That would make the route depend on the inside of another target's proof. The proof of 0.6(e) already works for coefficients in `O_{V,x}`, so I stated that generality in the target, and 0.8 now applies a stated target. The consumers 0.12(b), 0.13(b) and 0.14(a) apply 0.6(e) to forms over `k`, which is a special case. The *Needs:* line of 0.8 is unchanged (0.4, 0.5, 0.6).

**Pattern search.** 0.12(b) uses a constant `c` at a point of degree `1` or `ℓ > 3`, which is prime to `n_K`, so `c` stays a non-`n_K`-th power. 0.14(a) uses a unit `b` with prescribed residue. 0.13(b) uses a form over `ℚ` that is anisotropic at a split prime. None of them has the defect.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 5.6(c), `⊆` | `a ∈ ⋂_{D_{fα}} 𝔪_Q`, `b ∈ ⋂_{D_{gα}} 𝔪_Q`, with `P` in both sets | `(1 + a)(1 + b) − 1 = a + b + ab ∈ 𝔪_P` | holds | none |
| 5.6(c), `⊇`, the review's witness | `𝔽₅(s)`, `P : s = 0`, `Q : s = 1`, `D = {P, Q}`, `D′ = {P}`, `x = s` | `b = s`: `a = 0`. `b′ = 2s`: orders `(1, 0)` as for `b`, `a = −s/(1 + 2s)`, `a(Q) = −1/3 = 3 ≠ 0` | orders do not suffice | Check added |
| 5.6(c), pole of `x` at `Q` | same places, `x = s/(s − 1)` | `ord_Q(1 + x) = −1`; `b = s²/(s − 1)` gives `b − x = s` (order `0 > −1`) and `ord_P b = 2`; `a = −s(s − 1)/(s² + s − 1)` with `ord_Q a = 1`, `ord_P a = 1`; `(1 + a)(1 + b) = (2s − 1)/(s − 1) = 1 + x` | holds | none |
| 5.6(c), zero of `1 + x` at `Q`, so the strict bound matters | `x = −s` | `ord_Q(1 + x) = 1`. `b = −s + s(s − 1)²`: `a = s(s − 1)/(1 + s − s²)`, `ord_Q a = 1`, good. `b = s² − 2s` (`ord_Q(b − x) = 1`, not `> 1`): `1 + b = (s − 1)²`, `a = −s/(s − 1)`, `ord_Q a = −1` | the condition `> ord_Q(1 + x)` is needed and sufficient | none |
| 5.6(c), junk value | `b = x` returned by the lemma | `v_Q(0) = 0 ≤ exp(r)` holds, `a = 0` | explicit branch kept | wording |
| 0.6(e), coefficients in `O_{V,x}` | `h = 0`: `V` a point, `K = k_x` | the reduction is `q` itself; the hypothesis gives the conclusion | holds | none |
| 0.6(e), induction | `q ⊗ ⟨⟨t₁, …, t_{j−1}⟩⟩` over `(A_j)_{(t_j)}` | the coefficients are units of `A` times monomials in `t₁, …, t_{j−1}`; the reduction is the image in `A_{j−1} ⊆ F_{j−1}` | (d) applies at every step | wording |
| 0.6(e), plausible wrong model | a coefficient that is a nonunit | if some `ā_i = 0`, the reduction has the nontrivial zero `e_i`, so the hypothesis already forces unit coefficients | excluded by the hypothesis | none |
| 0.6(e), existing Check | `X³ + sY³` over `𝔽₂(s)`, point `u² + s` | a form over `k ⊆ O_{V,x}`; values `0, 1, 2 mod 3` | special case | none |
| 0.8, char 3 | `K = 𝔽₃(t)`, `K′ = 𝔽₉(t)`, `π = t² − (1 + i)` | `(1 + i)² = 2i`, `(1 + i)⁴ = −1`, order 8, nonsquare, so `π` is irreducible; `𝔽₉ˣ = ⟨g¹⁰⟩` in `𝔽₈₁ˣ`; `t̄⁴⁰ = (1 + i)²⁰ = −1`; `π(0) = −(1 + i) ≠ 0`, so `t` is a unit | constants fail, the unit `t` works; `⟨1, −t, π, −tπ⟩` is anisotropic | Check added |
| 0.8, char 2 | `K′ = 𝔽₄(t)`, `π = t³ + t + 1` (irreducible over `𝔽₄`, degree 3) | `𝔽₄ˣ = ⟨g²¹⟩` in `𝔽₆₄ˣ`, all cubes; `3 ∣ 63`, so non-cubes exist; `t̄ ∈ 𝔽₈`, `t̄²¹ = 1`, a cube | a unit with non-cube residue is required; `b = t` would also fail here | route requires a non-cube residue |
| 0.8, `δ = 0` | `K′` finite | the point is `Spec K′`; `⟨1, −b⟩` is anisotropic for a non-`n_K`-th power `b` | agrees with the `σ₀` Check | none |
| 0.8, existence of the point | model over the finite constant field `κ′` | `κ′` is perfect, so `K′/κ′` is separably generated and the smooth locus is a nonempty open; closed points have finite residue fields | holds | wording |

## Checks run

- **Elaboration.** `lake env lean packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean`, run from the content checkout, exits 0. The only output is eight "declaration uses `sorry`" warnings, at lines 54, 62, 73, 81, 93, 113, 128 and 139. The file is unchanged.
- **Signatures.** `#check @name` was run for all ten declarations in one scratch copy, elaborated once, exit 0. Every type is identical to the worker's signatures, up to the display of the opened `FirstOrder` namespace. Each agrees with its README statement (§§0.1, 0.2, 0.8, 0.10(e), 0.13, 0.14(b), 5.7, 6.9, 8.4, 8.5). No binder was lost and nothing changed.
- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name of a roadmap that resolves nowhere. Names outside TauCetiRoadmap are not checked by that host. The worker's five leads are supplier-planned names, unchanged and resolved by earlier rounds. The new Tau Ceti name `TauCeti.Place.exists_forall_mem_valuation_sub_le` is declared at `TauCeti/FieldTheory/FunctionField/Place/Approximation.lean:130`, in `namespace TauCeti.Place`, at the pinned Tau Ceti. It needs only `[Field k] [Field F] [Algebra k F]`.
- **Dependency check:**

```text
depcheck: 238 roadmaps, 2267 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## For the maintainer

- No name of this roadmap changed, and no supplier was added or moved. The new citation is a pinned Tau Ceti declaration.
- 0.6(e) is now stated for forms with coefficients in the local ring at the point. Its consumers inside this roadmap (0.8, 0.12(b), 0.13(b), 0.14(a)) are covered. No other roadmap cites 0.6(e).
- Ownership against open pull requests was not re-checked this round. No new construction was introduced.
- **Suspicious text.** None was found in the review.
