# FIX-PKG-MordellLawrenceVenkateshPartII~6: repair report

The review `REV-PKG-MordellLawrenceVenkateshPartII~5` has three findings. I checked each one against
ArithmeticGaloisRepresentations and LanglandsParameterStacks (read at the heads of their open pull requests,
which add new roadmap folders), ClassicalArithmeticCompletion on main, LS and LV. All three are correct and
all three are applied.

Files changed:

- `packages/MordellLawrenceVenkateshPartII/README.md`;
- the `eulerian-log-concavity-and-variance` entry in the top-level `gaps` list of
  `packages/MordellLawrenceVenkateshPartII/design/plan.json` (its `needs` text only).

`Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## REV-PKG-MordellLawrenceVenkateshPartII~5/F01 (P2) — applied

§2.3 no longer owns the generic theory. It used to define complete reducibility and prove Levi
semisimplification for disconnected groups. It now imports the R-parabolics, R-Levis, complete reducibility
and Levi semisimplification (unique up to `G°(k̄)`) from LanglandsParameterStacks §§2.3–2.4. Those sections
extend ArithmeticGaloisRepresentations §1.11, *Complete reducibility and closed tuples*.

§2.3 keeps three things, each stated as its own target:

- rational descent: parabolics minimal among those defined over `k`, a `k`-rational representative, and
  agreement with the geometric class;
- finiteness of rational classes over p-adic fields, through §2.11;
- continuity.

Locators: LV §2.4, p. 905, uses parabolics and Levis defined over `K` (LV line 490 onwards), and LS
Definitions 5.34–5.36 and Lemma 5.37 (LS line 2532 onwards). Other places updated: Scope (item 3, the
ReductiveGroups bullet and a new supplier bullet), a new contract section "From
TauCetiRoadmap.ArithmeticGaloisRepresentations and TauCetiRoadmap.LanglandsParameterStacks", the
ReductiveGroups contract, the §2.3 Needs line and Layer 2 Dependencies.

The old §2.3 Checks tested the imported definitions, and one of them (a split extension) was empty. They are
replaced by five Checks on the retained statement:

- the rotation of order 4 over `ℚ`: the minimal parabolic over `ℚ` is `GL₂`, while over `ℚ̄` it is a Borel;
- the `SL₂` unipotent limit;
- the `SL₂² ⋊ C₂` example over `ℚ`, which needs all R-parabolics;
- reflections in `O₂(ℚ₃)`: four rational classes, one `GL₂`-class;
- agreement with the `GL(V)` case.

The verified suppliers (both earlier in the merge order, at positions 59 and 81, against 320 for this
package):

- ArithmeticGaloisRepresentations §1.11 states the target *Complete reducibility and closed tuples*: the
  connected case over an algebraically closed field, with the absolute form over a general field.
- LanglandsParameterStacks §2.3 (third bullet) and §2.4 (second paragraph) extend it to groups whose
  identity component is reductive and whose component group is finite étale. In characteristic zero every
  finite component group is étale, so this covers every group of this roadmap's Conventions.

Neither supplier states the rational form over a non-closed field. I searched main and the open heads for
it by object (`G-completely reducible`, `R-parabolic`, `Levi semisimplification`, `minimal … parabolic`).
GlobalGaloisDeformationsPartII asks ReductiveGroupsPartII for a connected version as a supplier contract,
and ReductiveGroupsPartII on main does not have it. So the rational descent has no other owner and stays
here.

## REV-PKG-MordellLawrenceVenkateshPartII~5/F02 (P3) — applied

In the README contract `gap:eulerian-log-concavity-and-variance` and in its `gaps` entry in `plan.json`, the
support description changed:

- old: "on its contiguous support `0 ≤ q < n`";
- new: "on its contiguous support, which is `0 ≤ q < n` for `n ≥ 1` and `{0}` for `n = 0` (the empty
  permutation gives `A(0, 0) = 1`)".

The slug, the supplier, the convolution and reflection clauses and the `n ≥ 2` variance clause are unchanged.

This matches ClassicalArithmeticCompletion §2.18 on main, which keeps `A(0, 0) = 1` and makes vanishing
outside `0 ≤ q < n` a theorem for `n ≥ 1`. It also matches `eulerian` in `Suggested.lean` and the Layer 8
introduction. The other occurrences of `0 ≤ q < n` (SheafConvolutionOnAbelianVarieties §§3.1/3.3 contract,
§§8.1–8.2) are all under `n ≥ 2` and are correct.

## REV-PKG-MordellLawrenceVenkateshPartII~5/F03 (P3) — applied

The §5.6 Check said "The finite-order condition on `ψ` is essential (see §5.7)". It now says that finite
order is needed for the statement to apply directly, not for its conclusion, and gives the argument:

- `ψ(N) = u⁻¹·N·ψ^r(u)`, so `N = 1` gives `ψ^r(u) = u`;
- then the statement applied on the ψ-stable unipotent subgroup `U^(ψ^r)` gives the conclusion;
- the example `ψ(x, y) = (−x, 2y)` on `𝔾_a²`, `u = (2, 0)`, `v = (−1, 0)`.

The source statement (LS Lemma 8.13, LS line 3661) is kept unchanged, and so is the characteristic-`p`
negative control.

The same pattern appears in the §5.7 Check on `diag(2, 1)`. It now says "does not apply directly". It adds
that the norm equation `(2^r − 1)u = 0` forces `u = 0` and that `Z_U(φ^r) = 0`, in agreement with the
reduction. The Layer 5 Examples and the Source corrections entry for LS Lemma 8.14 already describe the
restriction to `Z_U(φ^r)` correctly; they are unchanged.

## Checks

- **Elaboration.** `lake env lean` on `packages/MordellLawrenceVenkateshPartII/Suggested.lean`, run from the
  content checkout: exit 0. The only output is `declaration uses sorry` at 69:8 and 106:8. The only import
  is `import Mathlib`, so no Tau Ceti module needed building.
- **Signatures.** I put `#check @name` for all six declarations in one scratch file and elaborated it once
  (exit 0):
  - `eulerian : ℕ → ℕ → ℕ`
  - `eulerian_central_mass_le_half : ∀ n, 2 ≤ n → 2 * ∑ q ∈ Finset.range n, eulerian n q ^ 2 ≤ n.factorial ^ 2`
  - `HypersurfaceMonomial : ℕ → ℕ → Type`
  - `IsSmoothHypersurface : {k} → [Field k] → {n} → MvPolynomial (Fin (n + 1)) k → Prop`
  - `HasGoodReductionOutside : {n} → Finset ℕ → MvPolynomial (Fin (n + 1)) ℤ → Prop`
  - `integralHypersurfaces_not_zariskiDense : ∃ n₀, ∀ n ≥ n₀, ∃ D₀, ∀ d ≥ D₀, ∀ S, ∃ G, G ≠ 0 ∧ (∃ e, G.IsHomogeneous e) ∧ ∀ F, F.IsHomogeneous d → HasGoodReductionOutside S F → eval (…) G = 0`

  Each matches its README statement. No binder was lost and nothing changed.
- **Dependency direction.** Output of the prescribed `gate --depcheck` command, run after the final edit:

  ```text
  depcheck: 245 roadmaps, 2253 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or moved line. The two new supplier edges, to ArithmeticGaloisRepresentations
  and LanglandsParameterStacks, both point to earlier roadmaps.
- **Citations.** `roadmaps resolve` on the edited README found no cross-roadmap citations found nowhere,
  including the new citations of ArithmeticGaloisRepresentations §1.11 and LanglandsParameterStacks
  §§2.3–2.4. This run did not check Lean names outside TauCetiRoadmap ("no pinned Lake packages on this
  host"). The worker's earlier lead `VanishingCycles.lisseDirectImageTransport` is untouched text. It names a
  target planned in EtaleCohomologyFoundations §F.3, not a pinned declaration.
- **Gate failures.** None were listed for this round.

## Adversarial pass

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| §2.3 rational descent, `k` versus `k̄` | `w = ((0,−1),(1,0)) ∈ GL₂(ℚ)` | char poly `t² + 1`, no rational eigenline, so no ℚ-Borel contains `⟨w⟩` and the minimal ℚ-parabolic is `GL₂`; over `ℚ̄` the Borels of the eigenlines of `±i` contain it and the eigenbasis Levi contains `w = diag(i, −i)` | Both give `⟨w⟩` up to `GL₂(ℚ̄)`; the minimal parabolic over `k` is not minimal over `k̄`. Check added |
| §2.3, unipotent | `⟨U⟩ ⊂ SL₂(ℚ)` | `diag(t,t⁻¹)·U·diag(t⁻¹,t) = ((1,t²),(0,1)) → I`; char poly `(t−1)²` on both sides; closure `𝔾_a` not reductive, so not completely reducible | Semisimplification trivial. Check kept, made sharper |
| §2.3, nonconnected | `J = SL₂² ⋊ C₂`, generators `(U,D)`, `(1,W)`, `λ = (diag(t,t⁻¹),1)` | swap component: `(λ₁a, bλ₁⁻¹)s` needs row 2 of `a` to be 0, impossible, so `P_λ = B × SL₂`; image `⟨(1,D),(1,W)⟩`; `W e₁ = e₂`, so no common eigenline; the only component-surjective R-parabolic containing the subgroup is `J` | Rational, completely reducible; a component-surjective test fails. Check added |
| §2.3 finiteness, homomorphisms | `ℤ/2 → O(xy)(ℚ₃)`, generator to a reflection `r_b` | `diag(a,a⁻¹) r_b diag(a,a⁻¹)⁻¹ = r_(a²b)`; `r_c r_b r_c = r_(c²/b)`; `c²/b ≡ b` mod squares; classes are `ℚ₃^×/ℚ₃^(×2)`, 4 of them; each `r_b` has trace 0 and det −1, so the four are `GL₂(ℚ₃)`-conjugate; centralizer `μ₂ × ℤ/2` | Finite (§2.11) and finer than the `GL`-classes. Check added |
| §2.3 degenerate cases | `Γ = 1`; `G` a torus; `G` finite (`G° = 1`); `k = k̄` | `Γ = 1`: the image is 1. Torus: every `P_λ = G`, image `Γ`. Finite `G`: only the trivial cocharacter, `P = G`, image `Γ`, finite so completely reducible. `k = k̄`: the statement is LanglandsParameterStacks §2.4 | Pass |
| §2.3 continuity | `ℤ_p → GL₂(ℚ_p)`, `x ↦ ((1,x),(0,1))`; `x ↦ ((χ(x), b(x)),(0,1))` | Semisimplifications `1 ⊕ 1` and `χ ⊕ 1`; the diagonal entries of a continuous matrix function are continuous | Pass |
| §2.3 route, Levi conjugacy | Semisimple `s ∈ P_λ` in disconnected `G` | Closure of `⟨s⟩` diagonalizable, hence reductive; Levi complements of `P_λ` in characteristic zero are `U_λ`-conjugates `L_(uλu⁻¹)` of `L_λ` | Pass (LV Lemma 2.4, ReductiveGroups Layer 6A) |
| F02 support | `n = 0, 1, 2, 3` | Supports `{0}`, `{0}`, `{0,1}`, `{0,1,2}`; rows `(1)`, `(1)`, `(1,1)`, `(1,4,1)`; `4² ≥ 1·1`; `{q : 0 ≤ q < 0} = ∅ ≠ {0}` | Old wording false at `n = 0`; fixed in README and plan |
| F03 reduction | `𝔾_a²/ℚ`, `ψ(x,y) = (−x,2y)`, `r = 2`; `u = (2,0)`, `u = (0,1)`; `r = 1` | `u + ψu = (0,0)`; `ψ(−1,0) − (−1,0) = (2,0)`; `ψ²(x,y) = (x,4y)`, fixed iff `y = 0`; `(0,1) + ψ(0,1) = (0,3) ≠ 0`, consistent with `(0,1) ∉ U^(ψ²)`; `r = 1`: norm `u = 1`, `v = 1` | Conclusion holds without finite order. Check replaced |
| F03, `ψ(N)` identity | Any group, `N = uψ(u)⋯ψ^(r−1)(u)` | `u⁻¹Nψ^r(u) = ψ(u)⋯ψ^r(u) = ψ(N)` symbolically (no commutativity used) | Valid for nonabelian `U` |
| F03, characteristic `p` | `𝔾_a/𝔽_p`, `ψ = id`, `r = p`, `u = 1` | Norm `p·1 = 0`, coboundaries all 0, `1 ≠ 0` | Characteristic-zero control kept |
| §5.7 `diag(2,1)` Check | Upper root group, `ψ = ×2` | `(2^r − 1)u = 0 ⇒ u = 0`; `2^r x = x ⇒ x = 0` | Consistent with the §5.6 reduction; Check sharpened |

## Ownership and suppliers

- **Complete reducibility.** Searched by object in main and in the open heads. Main has only the
  representation-level notion (ReductiveGroups, ClassicalGroups, CompactGroups, LieHighestWeight), not
  Serre's G-complete reducibility. The open owners are ArithmeticGaloisRepresentations §1.11 (connected
  case) and LanglandsParameterStacks §§2.3–2.4 (nonconnected case). Both are now cited.
- **Rational descent.** It has no owner elsewhere (see F01), so this roadmap owns it in characteristic zero
  for groups with reductive identity component.
- **Overlaps.** The overlap file lists no head that changes this roadmap and no dropped id. The cited
  sections exist at the heads read: ArithmeticGaloisRepresentations §1.11 with the paragraph *Complete
  reducibility and closed tuples*; LanglandsParameterStacks headings "2.3 Complete reducibility and strong
  reductivity" and "2.4 Closed tuples and Levi semisimplification".
- **Sources.** No new source was needed. LV footnote 1 on p. 905 and LS Definitions 5.34–5.36 and
  Lemma 5.37 are in the cached texts. `sources.toml` is unchanged and no `needs-references.toml` was
  written.
- **Untrusted text.** The review text contained no instruction aimed at the worker beyond its findings.

## For the maintainer

- **New dependencies.** This package now consumes ArithmeticGaloisRepresentations and
  LanglandsParameterStacks. Both are open pull requests that add new roadmap folders, at merge-order
  positions 59 and 81. Neither consumes this package.
- **No changed names or ids.** No Lean name changed, and no section id or heading changed (§2.3 keeps its
  title). Roadmaps citing this one are unaffected.
- **Possible future citation.** GlobalGaloisDeformationsPartII asks ReductiveGroupsPartII for a
  semisimplification over `k`-parabolics for connected groups. If ReductiveGroupsPartII comes to supply it,
  §2.3 could cite that for the connected case and keep only the nonconnected, characteristic-zero
  extension.
