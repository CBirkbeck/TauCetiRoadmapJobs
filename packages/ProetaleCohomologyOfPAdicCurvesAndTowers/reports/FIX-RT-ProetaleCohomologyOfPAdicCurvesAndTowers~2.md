# FIX-RT-ProetaleCohomologyOfPAdicCurvesAndTowers~2

Four findings from two red-team reviews: all four verified correct. Three were repaired in the reviewer's sense; two of those (2a/F01, 2b/F02) were repaired in a different form from the one proposed, for the reasons given. None is disputed and none is out of this package's reach.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~2a/F01 (P2) — applied differently

Changed: `Suggested.lean` docstring bullet "multiplicity one not statable" → new theorem `exists_compositionSeries_generalizedSteinberg`. It states that `LC(G/B, A)`, an `A[G]`-module through `Representation.asModule`, has a composition series from `⊥` to `⊤` in which every factor is some `Sp_J(A)` and every `Sp_J(A)` has `TauCeti.compositionMultiplicity` equal to `1`. The import `TauCeti.RingTheory.CompositionSeries.Multiplicity` and README §0.4(a), its route, contracts and Checks were updated to match.

Evidence and why the form differs. The finding is right: the pin has `TauCeti.IsCompositionFactorAt` (line 94) and `TauCeti.compositionMultiplicity` (line 144) in `TauCeti/RingTheory/CompositionSeries/Multiplicity.lean`, `Representation.asModule` (`Mathlib/RepresentationTheory/Basic.lean`, line 142, module structure at line 163, `AddCommGroup` at line 372), and `CompositionSeries` (`Mathlib/Order/JordanHolder.lean`, line 154). The sources are CDN-STEIN line 1918 (Proposition 5.1) and GK14 line 1330 (Corollary 4.4(b)).

The reviewer's form has `s.length = 2 ^ d` plus multiplicity `1` for each `J`. That form excludes extra factors only through the pairwise non-isomorphism theorem together with a count of the simple reflections. The clause `∀ i, ∃ J, IsCompositionFactorAt s i Sp_J` states "the constituents are exactly the `Sp_J`" directly. With non-isomorphism, both forms are equivalent. The count `2^d` is kept as README Checks (`d = 0, 1, 2`).

Route added: GK14 lines 1334–1358, the filtration `F_i = Σ_{|J|=d−i} LC(X_J, A)` with `F_i/F_{i−1} ≅ ⊕ Sp_J(A)`. It uses only irreducibility and non-isomorphism, so it holds for every coefficient field of characteristic `0` or `p`.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~2a/F02 (P3) — applied

Changed (§7.5, last Check): "contains the nonzero étale classes `H¹_ét[M′] = H¹_ét[M]`" → two arguments:

- Multiplying by `c^h` (`c = χ(ϖ)`, `h` the height of a component) carries `[M]`-parts onto `[M′]`-parts compatibly with `exp`. So `coker(exp)[M′] ≅ X^+_st(M) ⊗̂ LL(M)^* ≠ 0`, whereas the diagram predicts `0`.
- `H¹_ét(M_∞, L(1))[M′] = 0`: the central scalar has absolute value `|χ(ϖ)|² ≠ 1`, and étale classes are `G`-bounded.

Evidence. The central element `ϖ ∈ G` acts on `Z[ρ]` by `ω_ρ(ϖ)^{−1}` (README §7.1 Check on sectors). Here `ω_{JL(M′)}(ϖ) = ω_{JL(M)}(ϖ)χ(ϖ²)`, where `ω_{JL(M)}` is unitary at slope `1/2` (CDN20 line 664). `E` has slope `1`, so `|χ(ϖ)| ∈ {q, q^{−1}}`; for `F = ℚ_p` the central scalar changes by `p^{±2}`, as the reviewer computed. A nonzero `f` gives `ϖ^n f(x) = ω(ϖ)^{−n} f(x)`, which is unbounded, while étale classes are the `G`-bounded vectors (CDN20 Proposition 2.12(i), README §7.3).

The reviewer's replacement was strengthened. Their "the actual quotient … is nonzero" is now derived from §7.5 for `M` through the rescaling `T_c`. I checked that `T_c ∘ b = c^{−v(Nrd b)} b ∘ T_c`, hence `T_c f ∈ Hom_Ǧ(JL(M) ⊗ χ∘Nrd, Z)`. The value `X^+_st(M′) = 0` is unchanged. I searched the whole README for the same claim (`M′`, étale): the §7.4 Check makes only the Hyodo–Kato claim, which is correct, so no other place changes.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~2b/F01 (P3) — applied

Changed (§3.2 Check): "Closed unit disc: `H¹_HK(Y)^sep = 0` (CDN-CURVES line 160)" → computed from (d) with the triangulation of §2.2: `H¹(Γ_int) = 0`; both `Y_s^sp` are `ℙ¹` (CDN-CURVES lines 270–277), so the middle piece is `0` (`H¹_rig(ℙ¹) = 0`, line 389); `H¹_c(Γ)^* = 0`. The annulus gives `0, 0, C̆(−1)`.

Evidence. CDN-CURVES lines 156–164 concern the non-separatedness of `H¹_HK(Y)` and the map `exp` on the disc; they state no value of `H¹_HK(Y)^sep`.

The reviewer's phrase "both components are projective lines" is right in the source's convention: `Y^sp_s` are the proper smooth components of `Y^sp_S` (line 276), and the non-proper points are marked points of multiplicity `0+`. The Check now cites that convention. It agrees with README §2.5, which states `Y_s^sp = ℙ¹` for `s ∉ Σ(Y)`.

Pattern check: every other single-line CDN-CURVES locator in the README was reread against the cached text (lines 92, 108, 124, 129, 130, 387, 436, 586, 2093, 2109, and 160–164 for the `exp` Check of §3.5). All carry their statements.

## RT-ProetaleCohomologyOfPAdicCurvesAndTowers~2b/F02 (P3) — applied differently

Changed: §0.4(a) and the three Lean headlines now hold for every non-Archimedean local field `K` of residue characteristic `p`. The old hypothesis "`K/ℚ_p` finite" becomes `[IsNonarchimedeanLocalField K] [CharP 𝓀[K] p]`, and `[Fact p.Prime]` is dropped (it is implied). §0.4(b) is stated for the same `K`; §0.4(c) and §0.5 stay at `K/ℚ_p`. A Check for `𝔽_p((t))` was added, and a negative control for `ℚ_ℓ`.

Evidence. GK14's standing hypothesis (lines 9, 26) is any non-Archimedean locally compact `F`. Its section 4 assumes `char L = char k_F` (line 1241), and Corollaries 4.3–4.5 (lines 1300, 1328, 1362) carry no further hypothesis on `F`. Casselman's characteristic-`0` theorem is recalled for such `F` at GK14 lines 42–44.

Why the form differs. The proposed repair keeps the Lean at `K/ℚ_p` and adds a sentence. That keeps a statement knowingly narrower than its sources, which the binding rule ("never narrow a statement below what the sources support; special cases are Checks") forbids. So the statement was generalized instead.

Two places followed from the generalization:

- The old reason for `Nontrivial K^×` ("characteristic `0`, so `−1 ≠ 1`") fails for `𝔽_2((t))`. It now reads "a uniformizer is a unit ≠ 1", in the docstrings, §0.4(a) and the Tau Ceti contract.
- The other occurrences of the narrowing were reviewed. §0.4(c) (CDN-STEIN Corollary 5.4) and §0.5 (CDN-STEIN Proposition 5.6; SS91 is uncertified and was not read) have no readable source beyond `K/ℚ_p`, so they stay there and say so.

## Checks run

- **Elaboration** (`lake env lean packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean`, run from the content checkout): no errors. Four `declaration uses 'sorry'` warnings, at lines 136, 151, 169 and 250: the irreducibility, non-isomorphism, multiplicity and presentation headlines. The new import's object file was already built.
- **Signatures.** I put `#check @name` for all 11 declarations into one scratch copy and elaborated it once. Each type was compared with its README statement:
  - The three §0.4 theorems carry `(p : ℕ) (K) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharP (IsLocalRing.ResidueField ↥(valuation K).integer) p] [Nontrivial Kˣ] (A) [Field A] (hA : CharZero A ∨ CharP A p) (d)`.
  - `IsTopologicalRing K`, which the definitions need, is found from `IsNonarchimedeanLocalField`.
  - No binder was lost. The other eight types are unchanged from the job's `signatures.md`.
- **Dependency check**:

```text
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name found nowhere.
- **Ownership.** I ran `roadmaps grep` for generalized Steinberg, `compositionMultiplicity` and `Sp_J(` on main and at the open heads.
  - No other roadmap states the composition factors of `LC(G/B, A)`.
  - SmoothRepresentationsOfLocalGroups *principal-series-constituents* (main) gives only length `≤ |W|` over `ℂ`, and its SR.3.4/SR.5.2 are the complex Steinberg and segment representations, already cited.
  - No roadmap other than this one's own open copy cites `generalizedSteinberg_*`.
- **Sources.** No new source. `sources.toml`: the GK14 locator now also records the proof of Corollary 4.4(b) and the Introduction, and the CDN-CURVES locator records §0.2.1. No `needs-references.toml` was written.

## Adversarial pass on changed and new statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_compositionSeries_generalizedSteinberg` | `d = 0` | `G/B` a point; series `0 ⊂ A`, length `1`; factor `A = Sp_∅(A)` (relations an empty sup `= 0`); multiplicity `1` | holds | none |
| same | `d = 1`, `A` char `0` or `p` | `0 ⊂ A ⊂ LC(ℙ¹(K),A)`, length `2`; factors `A = Sp_{{s}}`, `LC/A = Sp_∅`; multiplicities `(1,1)` | holds | README Check |
| same | `d = 2` | `F_0 = A`, `F_1 = LC(ℙ²)+LC(𝓗)` with intersection `A` (chain of flags alternately moving line and plane), `F_1/F_0 ≅ Sp_{{2}} ⊕ Sp_{{1}}`, `F_2/F_1 = Sp_∅`; length `4` | holds | README Check |
| same, negative | `K = ℚ_ℓ`, `A = 𝔽_p`, `p ≠ ℓ` | `CharP 𝓀[K] p` is false (residue field `𝔽_ℓ`), so excluded; CDN-STEIN Remarque 5.2: multiplicity one fails | excluded as required | README Check |
| same, form | `LC(G/B,A) ⊕ A′` (hypothetical) | count condition `= 1` for every `J` still holds; `∀ i ∃ J` fails at the `A′` factor | clause needed | kept `∀ i ∃ J` |
| `generalizedSteinberg_isIrreducible` (generalized `K`) | `K = 𝔽_2((t))`, `A = 𝔽_2`, `d = 1` | residue char `2 = char A`; `LC(ℙ¹)/𝔽_2` irreducible (GK14 Cor. 4.3); `−1 = 1` in `K` but `t ∈ Kˣ`, `t ≠ 1` | holds; old `Nontrivial Kˣ` argument false here | docstrings and README fixed |
| same | junk `p = 0`, `p = 1` | `CharP 𝓀[K] 0` false (finite field); `CharP 𝓀[K] 1` false (field nontrivial) | vacuous, harmless | `[Fact p.Prime]` dropped |
| same | `K = ℚ_p` (old case) | `𝓀[ℚ_p] = 𝔽_p`, char `p` | special case kept | none |
| `generalizedSteinberg_nonempty_equiv_iff` | `J = J′`; `d = 1`, `J ≠ J′`; `d = 0` | identity; dimensions `∞` vs `1`; single index | holds | binders as above |
| §0.4(b) lattice uniqueness, general `K` | `O = 𝔽_p[[u]]` | residue char `p = char k_F`; GK14 Cor. 4.5 has no further hypothesis | holds | text only |
| §7.5 Check, `M′` | `F = ℚ_p`, `φe = pe` | `X^+_st(M′)`: `φ²(b) = p^{−1}b` ⇒ `0`; central scalar changes by `p^{±2}`; `T_c ∘ b = c^{−v(Nrd b)} b ∘ T_c` | étale part `0`; coker(`exp`)`[M′] ≅ X^+_st(M) ⊗̂ LL(M)^* ≠ 0` | Check rewritten |
| §3.2 disc Check | closed disc, `S = {s₁, s₂}` | pieces `H¹(Γ_int) = 0`, `H¹_rig(ℙ¹) = 0`, `H¹_c(Γ)^* = 0`; annulus `0, 0, C̆(−1)`, of dimension `1` | `0`, agrees with the next Check | locator replaced by computation |

## For the maintainer

- **Changed Lean signatures.** `generalizedSteinberg_isIrreducible` and `generalizedSteinberg_nonempty_equiv_iff` now take `[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharP 𝓀[K] p]` in place of the normed `K/ℚ_p` binders and `[Fact p.Prime]`.
- **New Lean name.** `exists_compositionSeries_generalizedSteinberg`.
- **New import.** `TauCeti.RingTheory.CompositionSeries.Multiplicity`.
- **Other roadmaps.** No other roadmap cites these names. The other open version of this roadmap, the roadmap-repository pull request that carries this folder, needs the same changes when the two are reconciled.
- **`plan.json`.** No supplier gap was added; the `gaps` list is unchanged.
