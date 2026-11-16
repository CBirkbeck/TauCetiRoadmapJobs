# FIX-PKG-VirtualFundamentalClassPartII~2

Review settled: `REV-PKG-VirtualFundamentalClassPartII` (two findings). Files changed:
`packages/VirtualFundamentalClassPartII/README.md` (1.3, 3.2, 3.3, 3.5) and
`packages/VirtualFundamentalClassPartII/sources.toml` (entries `stacks-chow-spaces`, `vistoli1989`).
`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied differently

Old → new: 3.2 cited only Vistoli's proof on schemes. It now notes vistoli1989 (7.11) (representable by schemes) and supplies the algebraic-space steps: stacks-chow-spaces Definition 8.1, Lemmas 11.1 and 14.1, and Lemma 16.3 applied to `𝒲 → p(𝒲)`. 3.3 cites Lemma 11.1 for atlas pullbacks that are spaces. Both `*Needs:*` lines add 2.3 on algebraic spaces.

The finding was verified first: vistoli1989 (7.11), lines 2064–2066, makes "representable" mean
representable by schemes, and the proof of (3.7), lines 998–1011, pushes along schemes `U → V`.

Why it differs from the review's suggestion. The review asked for Definition 8.1 and Lemma 16.3 only.
Lemma 16.3 (stacks-chow-spaces lines 917–919) says that `p_*` preserves rational equivalence, a
statement on classes. 3.2 proves an exact equality of cycles
`f_* div(φ) = (e(f𝒱)/e(𝒱))·div(N(φ))` and descends it from an atlas. Descent works only for explicit
cycles and rational functions, because étale pullback is not injective on integral Chow groups
(README 3.1, last Check). So the step for equal dimensions is stacks-chow-spaces Lemma 14.1
(lines 726–730), `p_* div(f) = div(Nm(f))`. For the case where the dimension drops, Lemma 16.3 is
applied to `p : 𝒲 → 𝒲′`. Then `p_* div(φ)` is rationally equivalent to zero on `𝒲′`, which has
dimension `< dim 𝒲` and so has no integral closed subspace of dimension `dim 𝒲`. Hence the only
cycle of dimension `dim 𝒲 − 1` on `𝒲′` that is rationally equivalent to zero is `0`, and
`p_* div(φ) = 0` as a cycle. Pulling cycles back along an étale `V′ → V` is Lemma 11.1 (lines
590–606), and the step for rational functions is the field identity in the proof of Lemma 14.1
(lines 784–787).

The same pattern was repaired in one more place:
- **1.3, degree of a representable morphism.** The definition cited vistoli1989 (1.15) (`ℱ ×_𝒢 V` a
  scheme). A sentence now says that, when `f` is representable by algebraic spaces only,
  `ℱ ×_𝒢 V` is an algebraic space. When it is generically finite over `V`, it is a scheme over a
  dense open `V°`: it has a dense open subscheme (stacks-chow-spaces Remark 7.2, lines 314–315),
  and the complement does not dominate `V`. The rank and Vistoli's arguments are then read over
  `V°`.

Checked and left unchanged, because they already cover algebraic spaces or never meet one:
- 3.1 (flat pullback): its atlases are atlases of `ℱ ×_𝒢 V`, so it needs no representability.
- 3.4: it has no atlas route.
- 3.5: it is already stated for algebraic-space sources.
- 4.1: the proper cover `X` is a scheme, and `X → 𝒢` is representable by schemes because the
  diagonal of `𝒢` is (Convention 1).
- 4.2: its use of vistoli1989 Lemma 5.3 for flat representable morphisms, with `Y″` an algebraic
  space, goes through 3.3 as repaired and 3.5's API ("`f^! q^* = p^* f^!` for `q` flat").
- 5.4: it consumes 3.2, which is now complete.

In `sources.toml`:
- `stacks-chow-spaces`: the locator gains Definition 8.1 (0EP1) and Lemmas 11.1 (0EPD), 14.1 (0EQ4)
  and 16.3 (0EQC). `cited_for` gains an entry for 1.3 and one for 3.2–3.3.
- `vistoli1989`: `cited_for` gains "1.3, 3.2–3.3 … ((7.11), lines 2064–2066)".

## F02 (P3) — applied

Verified at stacks-chow-spaces lines 57–65: `δ : |B| → ℤ`, and `δ_{X/B}` is the induced function. In
README 3.5, "in its Situation 2.1 with `B = Spec k` and `δ = dim`" now reads "with `B = S = Spec k`
and `δ = 0`, as in 2.3, so that the induced `δ_{U/B}` is the dimension of the closure of a point".
These are the only two occurrences of the phrase "Situation 2.1" in the README. The `δ` of 9.5 is a
different symbol (the fibre degree) and is defined there.

## Checks

- **Elaboration.** `lake env lean packages/VirtualFundamentalClassPartII/Suggested.lean`, run from
  the content checkout, exited with code 0 and printed nothing. The file has no declaration and no
  `TauCeti.*` import, so no module had to be built first.
- **Binder check (`#check @name`).** Not applicable: `Suggested.lean` declares nothing, so there is
  no elaborated type to compare. No README target changed its statement. Only routes and `*Needs:*`
  lines changed, and no Lean name was added or removed.
- **Dependency check.** Output of the gate:

      depcheck: 244 roadmaps, 2272 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolve** (`roadmaps resolve` on the README): "Lean names found nowhere: None."
- **Style scan of the added lines:** no LaTeX delimiters, process words or machine paths.
- **Sources.** Every locator added was opened in the cached texts:
  - stacks-chow-spaces lines 57–65, 314–315, 347–353, 590–606, 726–730, 784–787, 917–919 and
    952–978;
  - vistoli1989 lines 356–376, 974–1074 and 2064–2070, plus 1598–1657 for the 4.2 check.

  No new source was needed, and `scratch/needs-references.toml` was not written. `sources.toml`
  parses (14 entries).
- **Gate failures.** None were listed for this round.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.2 route: the atlas pullback can be a non-scheme space | `f : P → Spec k`, `P` a proper algebraic space that is not a scheme; `V = Spec k` | `ℱ ×_𝒢 V = P`. For a closed point `x`, `f_*[x] = [κ(x):k]·[Spec k]` from 3.2 (`e = 1`) and also from Definition 8.1 (`deg(x/Spec k) = [κ(x):k]`). | agree | route added |
| 3.2, case where the dimension drops (Lemma 16.3 on `𝒲 → 𝒲′`) | integral curve `C ⊆ P`, `φ ∈ k(C)^×`, `𝒲′ = Spec k` | `Z_0(Spec k) = ℤ`. `Spec k` has no subspace of dimension `1`, so the only `0`-cycle ≃ 0 is `0`: `f_* div(φ) = 0`, which is also the degree of a principal divisor on a proper curve | holds | none |
| 3.2, case of equal dimension (Lemma 14.1) | `p : P → ℙ³` proper birational, `P` not a scheme, `φ ∈ k(ℙ³)^×` | `N = id`, `e`-ratio `1`, so `p_* div(φ) = div(φ)` on both sides | holds | none |
| 3.2, stabiliser factor unaffected | `𝔸¹ → 𝔸¹ × BG` (existing Check), atlas `V = 𝔸¹` | `ℱ ×_𝒢 V = 𝔸¹ × G` is a scheme; the factor `|G|` is unchanged | holds | none |
| 3.2, class-level descent is insufficient | `π : E′ → E` étale isogeny of degree `2` (3.1 Check) | `π^*([P] − [O]) = 0` in `A_0(E′)` while `[P] − [O] ≠ 0`, so vanishing on the atlas does not descend | the explicit formula is needed | Lemma 14.1 added |
| 3.3 push–pull with a source that is a space | `f : P → Spec k`, `ψ : 𝔸¹ → Spec k` (flat, `d = 1`); `x` a closed point, `S ⊆ P` a surface | `ψ^*f_*[x] = [κ(x):k][𝔸¹] = f′_*[x × 𝔸¹]`; `ψ^*f_*[S] = 0 = f′_*[S × 𝔸¹]` (dimension `3 → 1`) | holds | route added |
| 1.3 degree through a space | `P → Spec k` with `dim P = n ≥ 2`; `p : P → ℙ³` birational | not generically finite, so `deg = 0`, and `dim P ≠ 0` ✓. Birational: `V°` is where `p` is an isomorphism, rank `1 = (1/1)·[k(P):k(ℙ³)]` | holds | sentence added |
| 1.3 dense open subscheme | `W` separated of finite type over affine `V`, generically finite | Dominant components have `dim = dim V`. The complement of the dense open subscheme contains no generic point of a component, so it has `dim < dim V` on dominant components and is not dense on the others, hence does not dominate `V` | holds | none |
| 3.5 `δ` on `B = Spec k` | `X = 𝔸¹`; `U = Spec k`, `N = 𝔸^c` | `δ_{X/B}`: `1` at the generic point and `0` at closed points (= dimension of the closure). `A_0(Spec k) = ℤ ≅ A_c(𝔸^c) = ℤ`. Taking `δ ≡ 1` on `B` would shift every grading by `1` | `δ = 0` correct | wording fixed |

## For the maintainer

- No Lean name changed, no section was renumbered, and no target was added or removed, so the
  citations other roadmaps make into this one are unaffected.
- No supplier, `*Needs:*` roadmap or gap changed; the two declared gaps stand as before.
- Ownership: the repair adds no construction. It cites the Stacks Project for steps of existing
  targets, so ownership is unchanged; the review's ownership record stands.
- The review's "For the human reviewers" items (the scope of 6.2 and 8.1–8.4, the stopped
  `packages/VirtualFundamentalClasses`, and the OCR text of vistoli1989) are left to the humans, as
  that section asks; nothing was changed because of them.
