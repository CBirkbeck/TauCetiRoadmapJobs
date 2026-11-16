# FIX-RT-MordellLawrenceVenkateshPartII~1

This round settles the seven findings of the red-team reviews `RT-MordellLawrenceVenkateshPartII~1a`
(F01–F04) and `RT-MordellLawrenceVenkateshPartII~1b` (F01–F03). Overlapping findings are settled once.
`README.md` means `packages/MordellLawrenceVenkateshPartII/README.md`. `Suggested.lean` and
`metadata.toml` are unchanged; `design/plan.json` changed only in its top-level `gaps` list;
`sources.toml` gained one `cited_for` entry (LS, §7.2).

## RT-MordellLawrenceVenkateshPartII~1a/F01, RT-MordellLawrenceVenkateshPartII~1b/F01 (P2) — applied differently

Old → new: the gap asked for a torus conjugate "inside the group fixing those tensors" to the de Rham
Hodge cocharacter. It now asks for SheafConvolutionOnAbelianVarieties' contract under the same slug: a
cocharacter of the Zariski closure over `C_p` acting by `t^i` on `C_p(i)`-isotypic parts. §7.2's route
derives the similitude conjugacy; its false first Check is replaced.

**Both findings hold.**

- 1a: the old contract compared a torus in `GL(V)` with a cocharacter of `GL(D_dR(V))` and never
  named a map between them.
- 1b: the Weil pairing on `H¹(E)` is not fixed by `ρ`, because `det ρ = χ_cyc⁻¹`. The group fixing it is
  `SL₂`, which does not contain `diag(t, 1)`. So the old contract either did not apply or was false in
  §7.2's own elliptic-curve Check.
- 1b: SheafConvolutionOnAbelianVarieties (its README, "From TauCetiRoadmap.PadicHodgeTheory") asks
  PadicHodgeTheory for a different statement under the same slug.

**Why the suggested repairs were not used as written.**

- 1a's text still conjugates "under the subgroup of `GL(V)` fixing those tensors". That repeats 1b's
  defect.
- 1b's text conjugates "inside `G`" for an arbitrary closed subgroup `G` containing the image. It
  transports "the Hodge cocharacter" by a tensor isomorphism of fibre functors. For general `G`, that
  cocharacter need not lie in `G` unless it is chosen inside the stabilizer of the transported tensors,
  and the text does not say so.
- Both repairs keep a second, stronger request to the same supplier.

**What §7.2 actually needs.** In the full similitude group (Conventions keep `GO` with both components),
two cocharacters with the same weights on `V` are conjugate, by an isometry. The proof:

- Let `w` be the multiplier weight. Weights `k` and `w − k` are dually paired, since
  `⟨λ(t)v, λ(t)u⟩ = t^(k+l)⟨v, u⟩ = t^w⟨v, u⟩`.
- The weight-`w/2` space is nondegenerate.
- Equal weight multisets give equal `w`, because the weights sum to `(dim V)·w/2`.
- Witt's theorem over `ℚ̄_p` then matches the two decompositions.

So the Hodge–Tate cocharacter of the Zariski closure (Serre–Sen) is enough:

- It descends from `C_p` to `ℚ̄_p` through a maximal torus defined over `ℚ̄_p`.
- The closure lies in the similitude group, because the pairing is Galois-equivariant into `ℚ_p(−r)`.
- §7.1 carries the de Rham Hodge cocharacter into that group with the same weights.
- Conventions, Hodge–Tate signs: inverting the Hodge–Tate cocharacter gives the de Rham jumps.

This needs no identification of the two spaces (1a) and no fixed tensors (1b). The slug now names one
contract. The step is the one LS use in the proof of Lemma 3.14 (LS lines 1191–1200, p. 26); that locator
is added to the gap.

**The old first Check of §7.2 was false.** It said: "The similitude-group assertion does not follow from
equality of GL weight multiplicities alone". It does follow, by the argument above. It is replaced by a
true, discriminating Check:

- In connected `GSO₄`, `diag(t,1,t,1)` and `diag(t,t,1,1)` both have weights `{1,1,0,0}` and multiplier
  `t`.
- Their weight-one planes `⟨e₁,e₃⟩` and `⟨e₁,e₂⟩` meet in a line, so they lie in different rulings and the
  cocharacters are not `GSO₄`-conjugate.
- The swap `e₂ ↔ e₃` (determinant `−1`) conjugates them in `GO₄`.

**Tested on the witnesses.**

- 1a's `ℚ_p ⊕ ℚ_p(−1)`: closure `{diag(1, s)}`. The Hodge–Tate cocharacter is `diag(1, t⁻¹)`; its inverse
  has weights `0, 1`, which are the de Rham jumps.
- 1b's `H¹(E)`, ordinary: the closure contains `[[1, *], [0, χ⁻¹]]`. The Hodge–Tate cocharacter has
  weights `0, −1`, which is `GL₂ = GSp₂`-conjugate to `diag(t, 1)`.

**Pattern.** The slug occurs four times in `README.md`: the §4.4 contract, the gap line, §7.2's route and
§7.2's `*Needs:*`. The `*Needs:*` line is unchanged (PadicHodgeTheory §4.4 with the gap). There is no
other "fixing tensors" phrasing.

## RT-MordellLawrenceVenkateshPartII~1a/F02, RT-MordellLawrenceVenkateshPartII~1b/F02 (P2) — applied differently

Old → new: gap:eulerian-log-concavity-and-variance and gap:eulerian-central-limit become four gaps to
ClassicalArithmeticCompletion:

| Gap | Section |
|---|---|
| gap:eulerian-row-log-concavity | §2.56 |
| gap:log-concave-convolution | §2.56 |
| gap:eulerian-descent-variance | §2.39 |
| gap:eulerian-central-limit, without the second-moment clause | §2.18 |

§8.3's `*Needs:*` names the first three. §8.8's route takes the uniform bound from §8.3.

**Evidence.** For `n ≥ 2`:

- `E[((des − (n−1)/2)/√n)²] = (n+1)/(12n)`: `1/8` at `n = 2`, `1/9` at `n = 3`, decreasing.
- For the difference law, `E[(D/√n)²] = (n+1)/(6n) ≤ 1/4`. This holds exactly when `4(n+1) ≤ 6n`, that is
  `n ≥ 2`.

So the central-limit gap asked again for what the variance gap supplies. Log-concave convolution is a
statement about arbitrary sequences.

**Applied differently.**

- The variance is asked of §2.39 (*Basic identities of Eulerian numbers*). The reviewers placed it in
  §2.18 and §2.56 respectively; §2.39 is the identities section and fits it better.
- The row gap states positivity on the support explicitly, so the "contiguous" hypothesis of the
  convolution gap is supplied.
- The variance gap also gives the two sums: `Σ_q q·A(n,q) = n!(n−1)/2` and
  `Σ_q (q−(n−1)/2)²·A(n,q) = n!(n+1)/12`.
- §8.8 uses the difference `D`, which is what §8.3 computes, rather than one descent count.

**Pins and ownership.** Tau Ceti `LogConcave` (`TauCeti/Analysis/Convex/LogConcave.lean`) is about
functions on real vector spaces, not integer sequences. No roadmap on main or at an open head states
discrete log-concave convolution or the descent variance (`roadmaps grep`). The new slugs are used by no
other roadmap.

## RT-MordellLawrenceVenkateshPartII~1a/F03 (P3) — applied

Old → new: "the centralizer of a σ-semilinear automorphism of a module over a finite étale algebra" →
the field statement of MordellLawrenceVenkatesh §§0.3–0.4: `E` a field, `σ` of finite order `e`, and
`dim_(E^σ) Z(φ) = dim_E Z(φ^e) ≤ d²`. A clause gives §2.2's reduction: one `σ`-cycle of `k` field
factors, and restriction to one factor `E₁` identifies `Z(φ)` with the centralizer of the
`σ^k`-semilinear map `φ^k`, with `E₁^(σ^k) = E₀`.

**Evidence.** At the open head of MordellLawrenceVenkatesh, §0.3 opens with "Let `σ` be a field
automorphism of `E`" and §0.4 with "an automorphism of the field `E` of finite order `e`".

**Reduction checked.**

- `E^σ ≅ E₁^(σ^k)` holds exactly when there is one cycle.
- `f ↦ f|V₁` is an isomorphism onto `Z(φ^k|V₁)`. The inverse is `f_(σ^j(1)) = φ^j f₁ φ^(−j)`, which is
  consistent because `f₁` commutes with `φ^k`.
- §2.2's third Check, `E₀ × E₀` with the swap: `k = 2` and `φ²|V₁ = ab`, as stated there.

No other place describes these sections; line 67 of the Scope is neutral.

## RT-MordellLawrenceVenkateshPartII~1a/F04, RT-MordellLawrenceVenkateshPartII~1b/F03 (P3) — applied

Old → new: a bullet **LS, Lemma 6.5, p. 67** was added to "Source corrections", after the §5.8.2 bullet.
It says the lemma needs finite centre and simple adjoint quotient, gives both witnesses (`SO₂`: `{(a,b,ab)}`;
`SO₄`: the image of `SL₂³`) and notes that §4.3 has `N = n!·d ≥ 6`. §4.1's locator now reads "with the
restriction of Source corrections".

**Evidence.** LS line 3082 states the lemma for `SO_N` with no condition. The proof uses a finite centre
(LS line 3095).

**`SO₂` witness.**

- Every pair projection of `{(a, b, ab)}` is onto, so there are three singleton classes.
- The dimension is `2 < 3`, so part (2) fails.

**`SO₄` witness.** Take the image of `(x, y, z) ↦ ([x, y], [x, z])`.

- Both projections are onto.
- The dimension is `9 < 12`, so there is one class.
- `ker π₁ = {(1, [±1, z])}` has dimension 3.

§4.3 assumes dimension `n > 2`, which gives `N ≥ 6`.

## Checks run

- **Elaboration.** Running `lake env lean packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the
  content checkout gives two warnings, `declaration uses 'sorry'`, at lines 69 and 109, and no errors.
  The file is unchanged and imports only `Mathlib`, so nothing had to be built first.
- **Binder check.** A scratch copy of `Suggested.lean` with `#check @name` appended for all six
  declarations was elaborated once. The types are identical to the earlier signature transcript:
  - `eulerian : ℕ → ℕ → ℕ`
  - `eulerian_central_mass_le_half : ∀ n, 2 ≤ n → 2 * ∑ q ∈ range n, eulerian n q ^ 2 ≤ n ! ^ 2`
  - `@IsSmoothHypersurface : {k} → [Field k] → {n} → MvPolynomial (Fin (n+1)) k → Prop`
  - `@HasGoodReductionOutside : {n} → Finset ℕ → MvPolynomial (Fin (n+1)) ℤ → Prop`
  - `HypersurfaceMonomial : ℕ → ℕ → Type`
  - `integralHypersurfaces_not_zariskiDense` with the quantifier order `n₀, n, D₀, d, S, G`

  No binder was lost and nothing changed. The transcript's "structure," entry is the docstring word,
  not a declaration.
- **Dependency check** (the brief's command):

      depcheck: 260 roadmaps, 2510 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve`): there are no cross-roadmap citations and no Lean names found
  nowhere. The earlier lead `VanishingCycles.lisseDirectImageTransport` no longer appears.
- **Gaps.** The README and the `gaps` list of `design/plan.json` carry the same nine slugs with identical
  `needs` text, checked by script.

No gate failures were listed for this round.

## Adversarial pass on new and changed text

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| gap:hodge-tate-image-cocharacter | `V = 0`; `ℚ_p(1)`; `ℚ_p ⊕ ℚ_p(−1)`; unramified finite image; `logχ` extension | trivial; `t ↦ t` on `𝔾_m`; `diag(1,t⁻¹)` in `{diag(1,s)}`; weights `0`, trivial cocharacter of a finite group; not Hodge–Tate (Sen nilpotent), excluded | holds; sign pinned by `t^i` on `C_p(i)` |
| §7.2 route, weights determine class | `GSp₂ = GL₂`, weights `{0,1}`; `GO₃`, `w = 2`, weights `{0,1,2}`; `GO₄` vs `GSO₄` | `w` from the sum: `(0+1) = 2·w/2 ⇒ w = 1`; `V₁` nondegenerate of dimension 1; weight sets equal but `GSO₄` classes differ | holds in the full similitude group only, as the new Check records |
| §7.2 new Check | `diag(t,1,t,1)`, `diag(t,t,1,1)` | multipliers `t·1 = 1·t = t` and `t·1 = t·1 = t`; `det = t² = c²`; `dim(⟨e₁,e₃⟩∩⟨e₁,e₂⟩) = 1`, odd, so the rulings differ; swap of `e₂, e₃` has `det −1` | true |
| §7.2 elliptic and Tate-twist Checks, recomputed | `H¹(E)` ordinary; `ℚ_p(−1)` | HT weights `{0,−1}`, inverse `{0,1}` = de Rham jumps; HT `t⁻¹`, Hodge `t`, same image | unchanged, consistent |
| gap:eulerian-row-log-concavity | rows `n = 0,1,4,5`; `q ≥ n` | `n=0, q=1`: `0 ≥ 1·0`; `n=1, q=1`: `0 ≥ 1·0`; `121 ≥ 11`, `121 ≥ 11`; `676 ≥ 66`, `4356 ≥ 676`; `q = n−1`: `1 ≥ A(n,n−2)·0` | true |
| gap:log-concave-convolution | `(1,1)∗(1,1)`; `(1,1,0,0,1,1)∗(1,1)` | `(1,2,1)`: `4 ≥ 1`; `(1,2,1,0,1,2,1)`: at the zero `0 ≥ 1·1` fails | interval-support hypothesis needed and present |
| gap:eulerian-descent-variance | `n = 1,2,3,4` | `n=1`: variance `0 ≠ 1/6` (excluded); `n=2`: `Σ qA = 1 = 2·1/2`, `Σ(q−½)²A = ½ = 2·3/12`; `n=3`: `6 = 6`, `2 = 6·4/12`; `n=4`: `36 = 24·3/2`, `10 = 24·5/12` | true for `n ≥ 2` |
| gap:eulerian-central-limit | variance check | `(n+1)/(12n) → 1/12` | consistent |
| §8.8 route bound | `n = 2, 3, 10` | `(n+1)/(6n)`: `1/4`, `2/9`, `11/60`, all `≤ 1/4` | true |
| §8.3 route and Checks, recomputed | `n = 2, 3` | `β` is `α` convolved with its reflection; second moments `1/2 = 3/6`, `2/3 = 4/6` | consistent with the new gaps |
| MordellLawrenceVenkatesh contract | `σ = id`, `k = 1`; `E₀×E₀` swap; `ℚ_(p²)`, `φ = σ⊕σ` | `Z(φ) = Z(φ)`, the bound is `d²`; `Z ≅ Z(ab)`; `dim_(ℚ_p) = 4 = dim_E Z(φ²)` | true |
| LS Lemma 6.5 correction | `SO₂`, `SO₄`, `SO₃`, `SL₁` | `dim 2 < 3`; kernel dimension 3; `SO₃ ≅ PGL₂` is simple; trivial `H` makes `∼` non-reflexive (excluded by `N ≥ 2`) | true |

## Ownership and suppliers

- **Hodge–Tate cocharacter.** The slug and statement now coincide with the request that
  SheafConvolutionOnAbelianVarieties (earlier in the merge order) makes of PadicHodgeTheory, so one slug
  names one contract with one owner, PadicHodgeTheory §4.4.
- **New Eulerian gaps.** These ask ClassicalArithmeticCompletion, on main, for statements no other roadmap
  owns. No notion moved down and no new supplier was added.
- **Open pull requests.** Ownership against the open roadmap pull requests was checked with
  `roadmaps grep` and `roadmaps show` (PadicHodgeTheory, SheafConvolutionOnAbelianVarieties and
  MordellLawrenceVenkatesh at their open heads).

## Notes for the maintainer

- PadicHodgeTheory receives one fewer distinct request. gap:hodge-tate-image-cocharacter is the same
  statement from this roadmap and from SheafConvolutionOnAbelianVarieties.
- ClassicalArithmeticCompletion now has four Layer 8 gaps from this roadmap instead of two.
  gap:eulerian-log-concavity-and-variance no longer exists; no other roadmap cited it.
- `design/plan.json` nodes were not edited, as the brief requires. Its node text for §7.2 may still
  describe the tensor-splitting route.
- No suspicious instructions were found in the reviews.
