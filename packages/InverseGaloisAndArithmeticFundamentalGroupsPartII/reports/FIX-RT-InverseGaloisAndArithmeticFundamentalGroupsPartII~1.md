# FIX-RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1

Repair round for the red-team reviews `RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1a`
(seven findings) and `~1b` (seven findings). Files changed:
`packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/README.md`, `Suggested.lean`,
`sources.toml` (two new certified entries) and `design/plan.json` (top-level `gaps` only: the
`needs` of two entries, the `section` of one). `metadata.toml` is unchanged. Overlapping findings
are settled once: a/F05 with b/F03, and a/F06 with b/F02.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1a/F01 (P3) — applied

Deleted `hurwitzAction_sigma`, `shiftHom_sigma`, `HurwitzFibre.smul_tuple`, `unmarked_smul_mk` and
`unmarkedGlueSum_smul` from `Suggested.lean`; their one-line contents are inlined where the
remaining proofs needed them (`hurwitzAction_iff`, `hurwitzAction_comm`, `hurwitzAction_shift`,
`glue_smul`, `smul_conjFibre`, `unmarkedStabilizer`). README §§0.3, 0.4, 0.7 keep the facts as
prose; the five names are gone. No other roadmap cites them (`roadmaps grep`: no match).

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1a/F02 (P1) — not actionable in this package: re-raised ownership decision (scope and merge order), decided by a human

The finding re-raises REV-PKG-InverseGaloisAndArithmeticFundamentalGroupsPartII/F01, whose
ownership part FIX-PKG~2 left to the board. Under the brief, a re-raised finding is decided by a
human. Owning EVW §§3–7, and reducing this package to citations of §5.16, is a scope and
merge-order decision. The citation check found that §5.16 already has full-monodromy stability
with one `D` and the étale bound for every centreless `G`. Scope and *Downstream consumers* now
describe it accurately. The ownership sentence is unchanged.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1a/F03 (P2) — applied

The witness holds: for `c = {g}`, `U` is one gluing map. Conventions "no single map of spaces
and no algebraic morphism induces it" → a sum of `|c|` gluing maps, one for a singleton class.
Scope's unsupported "is not algebraic" (EVW16 line 274) → "no algebraic form constructed". §4.5
Check "does not exist" → a computed non-descent example.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1a/F04 (P2) — applied

The witness holds: `TauCeti.fatRealization`, `fatRealizationFunctor`, `fatRealization.augment`
and `fatRealization.ι` are pinned (`TauCeti/AlgebraicTopology/FatRealization.lean`). They were
added to *From Tau Ceti*, Scope and §3.2. Gap `algtop-semisimplicial-realization` (README and
`plan.json`) keeps its slug and now asks only for the skeletal filtration and spectral sequence.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1a/F05, RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1b/F03 (P2) — applied

Both witnesses hold. Our arcs share `∗` and end at interior points, so §1.7.2's proper-arc
cutting does not cover them (a/F05's repair alone is incomplete). Gap section `Layer 1` → `§3.3`.
`needs` (README and plan) → isotopy extension for such arc systems relative to `∂F ∪ Λ`, plus cut
surfaces. *Needs:* of §§2.2, 2.5, 2.6 → §3.3, §1.7.2.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1a/F06, RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1b/F02 (P1) — applied

a/F06 is P1 and b/F02 is P2. The witness holds (HW10 lines 1654–1663). §2.2 now defines
`F(S; Δ, Λ) ⊇ A(S; Δ, Λ)` for discs with nonempty finite `Δ`; the layer's complex is
`A(D; {∗}, P)`. §2.6 proves contractibility, `(|Λ|−2)`-connectivity and Cohen–Macaulay in this
family, which cutting preserves. Checks were added. Why discs only: *Source issues*.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1a/F07 (P1) — applied

The witness holds: AlgebraicTopology §5.3 compares with coinvariants only for regular covers. The
contract now says so. §4.4 proves the non-free case by permutation modules, and `X//G → X/G` by
Cartan–Leray on the free `EG × X`. Pattern: §0.5 relied on the same finite-cover item, so it is
restricted to finite `B_n`-sets; its universal-cover Check became `X = S_n`.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1b/F01 (P1) — applied

Verified by computation (table, first rows). Preamble: points numbered clockwise from `∗ = −i`.
§2.2: counterclockwise → clockwise order. §2.5: `v_q` ordered `P_1, …, P_(q+1)`, with the reason
for `∂_i v_q = s_(q,i) v_(q−1)`. New Checks in §2.2, §2.5 (both base points) and §2.1 (monodromy
witness). Note added on EVW16 lines 1151–1153, 1203–1205, 360–368.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1b/F04 (P2) — applied

The witness holds. §2.1 takes local sections from GeometricTopology §3.3 (`N = P`,
`M = int D`), with fixed compact supports, extended by the identity. Local triviality follows from
the pinned `Diffeomorph.isTopologicalGroup`. PAL60 is kept as attribution. §3.3 was added to
*Needs:*, the supplier contract and Layer 2 *Dependencies*.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1b/F05 (P3) — applied

The witness holds. §4.2 sketch "§4.1 gives `b = A2 + 3 A0 p`" → `b = A2 + 3A0p` (§4.1) for
`p > 0` and `b = A2 + 1` (§1.15) for `p = 0`; both give `n ≥ b + A0` when
`n > 3A0p + A2 + A0 + 2`. §1.15 was added to *Needs:*. Constants unchanged.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1b/F06 (P3) — applied

The Layer 0 heading "the Hurwitz action and the stabilization operator" became "the Hurwitz
representation and the component ring", the README's title. Pattern: the Layer 5 heading
"finite-cell models" became "finite cell models", as in the README. The Layer 4 heading already
agreed.

## RT-InverseGaloisAndArithmeticFundamentalGroupsPartII~1b/F07 (P3) — applied

The witness holds (HW10 lines 1632–1634). Certified fetches: HAT91 (Hatcher 1991, author's
revised version; proof of the Theorem, line 101) and WAH08 (Wahl 2008, arXiv v2; Lemma 2.5, lines
302–303). §2.6 now credits the surgery flow to HAT91 in WAH08's form, and HW10 Lemma 7.1 for the
statement. Both are in `sources.toml` and *References*.

## Other change found by the adversarial pass

The §2.2 Check "Pairwise disjointness of representatives chosen separately does not give a
simplex" was deleted. Review a listed it as uncertified. It is false: isotopy classes of arcs that
are disjoint in pairs can be put in minimal position all at once, so they are disjoint all at
once, and the complex is a flag complex. No consumer used it.

## Checks

- **Elaboration.** `lake env lean packages/InverseGaloisAndArithmeticFundamentalGroupsPartII/Suggested.lean`,
  run from the content checkout, exits 0. The only output is `declaration uses 'sorry'` at
  `Suggested.lean:472:8` (`hurwitz_homological_stability`) and `:489:8` (`uniform_betti_bound`).
  No `TauCeti.*` module had to be built.
- **Signatures.** A scratch copy of the file with `#check @name` for all 35 remaining declarations
  was elaborated once (exit 0). Each elaborated type was compared with its README statement; none
  changed. Both headlines still carry `{G : Type} [Group G] [Fintype G]`, the nonsplitting
  hypothesis, `∀ (k : Type) [Field k]` and `↑(Fintype.card G) ≠ 0`. Every Lean name appears in the
  README, and the README has no backticked own name the file lacks (`roadmaps resolve`: none
  found nowhere).
- **Dependency check.** Output: `depcheck: 237 roadmaps, 2141 edges, 0 problem(s)`. There is no
  UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name
  missing everywhere. GeometricTopology §§1.7.2, 3.3, 3.4 and AlgebraicTopology §5.3 (Stage 5,
  item 3, via its Stage/Layer table) were read on main. ArithmeticStatisticsPartVIII §5.16 was
  read at its open head.
- **Sources.** HAT91 and WAH08 were added, both certified. No text was missing, and no
  `needs-references.toml` was written.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Arc order with the CCW half twist (b/F01) | `∗` below, `P_1=(−1,0)`, `P_2=(1,0)`; collar twist `θ ↦ θ+f(r)`, `f=π` for `r≤1.5`, `0` at `r=2`, `a_0` from `(0,−5)` | `a_0` enters radius 2 at `(−0.62,−1.90)`. `h(a_0)` sweeps CCW through the bottom and reaches `P_2` from above-right. The loop `a_1·h(a_0)⁻¹` has every point with `x<0` at `y≤−1.9`, so it misses `(−1,0)` and `h(a_0)≃a_1`. With `∗` above, `h(a_0)` passes below `P_1` and the loop encloses it, so `h(a_0)≄a_1` and `h(a_1)≃a_0` | Clockwise order needed with `∗=−i`; repaired |
| Directions from `∗=−i` | `P_1=1/√2`, `P_2=2/√5` | args `arccot 0.707 = 0.955`, `arccot 0.894 = 0.841` rad, decreasing | `P_1` first clockwise ✓ |
| `∂_i v_q = s_(q,i) v_(q−1)` | `q=1,i=0`; `q=2,i=0` | `σ_1 a_0=a_1`. For `q=2`: `σ_2` sends `(a_0,a_1)` to `(a_0,a_2)`, then `σ_1` sends that to `(a_1,a_2)=∂_0 v_2` | ✓, matches §2.4 vertex list |
| Monodromy witness (§2.1) | `h_*γ_1=γ_2`, `h_*γ_2=γ_2⁻¹γ_1γ_2` (Mathlib order) | `h_*⁻¹γ_2=γ_1`, `h_*⁻¹γ_1=γ_1γ_2γ_1⁻¹`. `f∘h_*⁻¹ ↦ (aba⁻¹,a)`; `f∘h_* ↦ (b,b⁻¹ab)`. Boundary `γ_1γ_2` is fixed by `h_*`: `γ_2·γ_2⁻¹γ_1γ_2=γ_1γ_2` | Positive move ✓; product `ab` ✓ |
| `F(S;Δ,Λ)`, `A(S;Δ,Λ)` | `|Δ|=1,|Λ|=1`; `|Δ|=2,|Λ|=1`; `|Δ|=1,|Λ|=2`; `Λ=∅`; `Δ=∅` | `F=A=` one vertex; `F=` edge, `A=` two points; `A=ℝ` (vertices `σ_1^k a_0`); empty; empty | Contractible; `(−1)`-connected; `0`-connected; `(−2)`; `Δ≠∅` needed ✓ |
| §2.6 induction arithmetic | bad `p`-simplex with `p+1` arcs, each endpoint used twice | `d≤(p+1)/2≤p` for `p≥1`. `conn J ≥ Σ(n_i−2)+2(c−1) = |Λ|−d−2 ≥ |Λ|−p−2 ≥ k−p` | Extension possible ✓ |
| Cohen–Macaulay | link of a `q`-simplex | `dim A = |Λ|−1`; link `A(S';Δ',Λ')` with `|Λ'|=|Λ|−q−1`, `(|Λ|−q−3)`-connected = `dim−q−2` | ✓ (HW10 Def. 3.4) |
| Cutting two arcs `∗→p` | sectors A, B, C at `∗` | disc: outer piece `{∗_A,∗_C}`, inner `{∗_B}`. Orientable genus 1, non-separating loop: two-sidedness pairs A↔C and B↔B at `p`, so one piece with `∗_A,∗_C` and `∗_B` on different boundary circles (`χ=0`, annulus) | Disc family closed; general family not ✓ |
| §2.1 bundle | `e(ψφ)=ψ e(φ)`; section `s` over `V` | `φ ↦ (e(φ), s(e(φ))⁻¹φ)` has inverse `(x,ψ) ↦ s(x)ψ`; `s(e φ)⁻¹φ` fixes `P` | Locally trivial ✓ |
| §4.2 at `p=0` | polynomial case `A2=2`, `A0=7` | `n>11 ⇒ n≥12 ≥ b+A0 = 3+7 = 10`. For `p=1`: `n>32 ⇒ n≥33 ≥ 2+21+7 = 30` | ✓ |
| §4.4 route | `C₂` trivial action; `S₃`, `n=2` | `H_*(BC₂×X;k)=H_*(X)`. `H_0(X)=k⁵`, `H_0(X)_G=k²`, `π_0(X/G)` has 2 elements, `H_0(X//G)=k²` | ✓ |
| §4.5 non-descent Check | `S₃`, `m=2`, `n=1`, `s=(a),(b)` | `glue_a`: `(a,a,a)` vs `(a,a,b)`, different classes. The sum is `[ttt]+2[tt t']` for both, since `C(a)={1,a}` and `aba=z` give `(b,b,a)∼(z,z,a)` | ✓ |
| Conventions (`U`) | `G=1`; `C₂`; `S₃` | one summand `t^D`; `r_s^{2D}`; three summands. A class with `|c|≥2` is never central | ✓ |
| §0.5 finite-set Check | `X=S_2` via `permHom` | `B_2=ℤ` acts by swapping. `H_0=` coinvariants `=k`; `H_1=` invariants `=k(e+τ)`; `P_2≅ℤ`, `H_*=k,k`. Trivial action: `H_0=k²` | ✓ |
| Scope/Downstream facts | ArithmeticStatisticsPartVIII §5.16 at its head | *Stability of the component ring* (a) is for every `H` meeting `c`; *Uniform Betti numbers of Hurwitz schemes* is for every centre-free `G`; the field bound is for `CHur/G` with `G` centre-free | Description corrected |
| Fat realization contract | pinned file | `fatRealization` l.89, `ι` l.95, functor l.193, `augment` l.204; no filtration or spectral sequence | Gap narrowed ✓ |

## Ownership and open work

- The disc arc complexes `F(S; Δ, Λ)` and `A(S; Δ, Λ)` are new here. `roadmaps grep` (main and
  open heads) and a grep of the board's packages for "arc complex", "Hatcher–Wahl" and
  "Cohen–Macaulay" find no other owner. ArithmeticStatisticsPartVIII §5.16 cites only the
  `Δ = {∗}` case of HW10, and the overlap with it is the human decision above. HomologicalStabilityOfGeneralLinearGroups
  mentions the Hatcher–Wahl framework only as out of scope. No declaration of `Suggested.lean`
  received a new name.
- The 200 sibling checkouts were not read file by file. Ownership was checked through
  `roadmaps grep` / `roadmaps show`, which cover all 440 open heads.

## Source issues

- **Gap** in HW10, Lemma 7.1 and Proposition 7.2, preprint pp. 34–35 (HW10 lines 1625–1644). The
  source says only that `Δ_0` is finite. It should also be nonempty: for `Δ_0 = ∅` there are no
  arcs. This affects a stated result.
- **Gap** in HW10, proof of Proposition 7.2, p. 35 (HW10 lines 1659–1663). The source cuts along a
  bad simplex and applies induction to the pieces. On an orientable surface of positive genus, two
  arcs from one point of `Δ_0` can form a non-separating loop. One piece then carries copies of
  that point on two boundary circles, outside the stated family (`Δ_0` on one boundary circle).
  This affects the proof for surfaces other than discs; the README states both results for discs.
- **Under-specification** in EVW16 §5.5 and the proof of Proposition 5.6, p. 25 (EVW16 lines
  1151–1153, 1203–1205, with 360–368). Arcs are ordered counterclockwise, but the direction of the
  half twist is left open. With the counterclockwise half twist, the face identity needs the
  clockwise order. This affects the proof.

## For the maintainer

- Names removed from `Suggested.lean`: `hurwitzAction_sigma`, `shiftHom_sigma`,
  `HurwitzFibre.smul_tuple`, `unmarked_smul_mk`, `unmarkedGlueSum_smul`. No other roadmap cites
  them.
- Supplier requests changed for two roadmaps on main:
  - GeometricTopology: gap `geomtop-arc-isotopy-extension` now sits at §3.3 with a new
    description.
  - AlgebraicTopology: gap `algtop-semisimplicial-realization` now asks only for the filtration
    and the spectral sequence of the pinned `TauCeti.fatRealization`.
- Layer 2's statements now carry an explicit orientation convention: `∗ = −i`, clockwise arc order,
  counterclockwise `σ_i`. ArithmeticStatisticsPartVIII §5.16 (ii), *The arc spectral sequence*,
  uses the same coset model with "straight arcs to `P₁, …, P_{q+1}`" and no stated orientation. It
  has the same ambiguity, and this roadmap cannot change it.
- The ownership overlap with ArithmeticStatisticsPartVIII §5.16 (a/F02) awaits a human decision.
- No suspicious instructions were found in the reviews or the fetched texts.
