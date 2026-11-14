# FIX-RT-KloostermanMomentsAndPotentialAutomorphy~2

Repair of red-team round 2 (reviews `~2a` and `~2b`) on `packages/KloostermanMomentsAndPotentialAutomorphy/`.
Files changed: `README.md` only. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json`
are unchanged (no new source, no new supplier gap).

## RT-KloostermanMomentsAndPotentialAutomorphy~2a/F01 (P3) — applied

§6.3, `k = 1` Check: "Newton polygon has vertices `(1, 0)`, `(−1, 1)`" → the polytope
`conv({0} ∪ supp)` of MixedHodgeModulesAndIrregularHodgeTheory §10.4 is the triangle `(0, 0), (1, 0), (−1, 1)`,
whose only face avoiding `0` is the edge on `2α₀ + α₁ = 1`; area `1/2`, so `2!·vol = 1 = dim H¹_dR(𝔾_m, Kl₂)`
(§§3.5, 5.5; §10.6 there); the bare segment has area `0`.

Verified: MHM §10.4 at its head defines `Δ(φ) = conv({0} ∪ supp φ)`; §10.6 there gives `dim Hⁿ = n!·vol(Δ)` for
full-dimensional nondegenerate `φ`; `x + z/x` is nondegenerate (edge face: `θ_z(z/x) = z/x ≠ 0`); §5.5 gives
`dim H¹_dR(𝔾_m, Kl₂) = ⌊2/2⌋ = 1`.

## RT-KloostermanMomentsAndPotentialAutomorphy~2a/F02 (P1) — applied

New contract "From TauCetiRoadmap.McKaySkewGroup" (§0.1 models; §0.2 classification, conjugacy, `SO(3)` list,
odd-order cyclicity), a Scope bullet, §1.6 Needs and Layer 1 Dependencies. §1.6 proof: implicit case list →
McKaySkewGroup §0.2 transported to `ℚ̄_ℓ` by embedding the finitely generated field of entries into `ℂ`;
`S₄`, `A₅` lack normal Sylow `2`; normalizer `= 2.S₄` argued.

Verified: McKaySkewGroup is on main (`TauCetiRoadmap/McKaySkewGroup/README.md`, §0.1 "Concrete models",
§0.2 "Classification and conjugacy"; `finite_subgroup_SL2_classification` and
`finite_subgroup_SL2_conjugate_of_mulEquiv` in its `Suggested.lean`); no open pull request revises it. The
normalizer step: `N_{SL₂}(2.A₄)` is finite (centralizer `{±1}` by Schur), contains the model `2.S₄`; cyclic and
binary dihedral groups have abelian subgroups of index `≤ 2` (`2.S₄` has none) and `48 ∤ 120`, so `N = 2.S₄`.
Pattern: the odd-`p` step "`ρ(P_∞)` cyclic in a torus" used the same classification (odd-order case) and now
cites it too. `Ḡ = V₄` (preimage `Q₈`) is excluded: `Sym²` splits into three nontrivial characters of `I_∞`,
each of integral break `≥ 1`, so `Sw ≥ 3 > 1 = deg Z₂`.

## RT-KloostermanMomentsAndPotentialAutomorphy~2a/F03 (P3) — applied

§3.6: deleted "ΠM rank `k + 1`, M rank `k`" and "`M^H` has weight `nk`" (covered by the `k = 1, 2, 3` Checks).
§6.2: restatement → `k = 2` Morse chart at `(1, −1)`: `t·g = s(X² − Y²)`, order `+1` on `E₁`; `g = c ≠ 0` gives
`c/s`. §6.3: restatement → `k = 5, j = 2`: degrees `4, 2`, classes in `F⁶, F⁴, F²`; degree-one `z` loses `(2, 4)`.

Verified: Hessian of `g` at `(1, −1)` is `diag(2/y₁³, 2/y₂³) = diag(2, −2)`, `g = 0` there; `(s²X² − s²Y²)/s =
s(X² − Y²)`. §6.5 at `k = 5`: `F⁶ = F⁵ = ⟨j=0⟩`, `F⁴ = F³ = ⟨0, 1⟩`, `F² = ⟨0, 1, 2⟩`, so types `(6,6), (4,2), (2,4)`
as in §6.6; with `deg z = 1` the bounds `6, 5, 4` put all three in `F⁴`. Each touched definition keeps `≥ 3`
Checks (§3.6: 6; §6.2: 3; §6.3: 3). Pattern: a scan of every Check bullet found one more restatement
of the same kind, §10.3 "the monodromy term is essential", replaced by the computed `k = 6`, `p = 3` instance
(`det(−3^{−s}·(−81)) = 3^{4−s}`; without `N`, factor `1`, conductor `0` instead of `1`).

## RT-KloostermanMomentsAndPotentialAutomorphy~2a/F04 (P1) — applied

§10.3: "at `∞` it is `i^{(k²−1)/8}`" → `(−i)^{(k²−1)/8}`; proof sketch adds the transport from `exp(2πix)`
(Hodge recipe `i^A`) by `det V(−1) = (−1)^A`, the even-`k` invariance, and global invariance. Check
"`k = 3`: `i`" → `−i`, with `w₃ = i` and product sign `+1`. New Corrections entry for FSY §5.3.1, pp. 53–55.

Verified: FSY line 2415 fixes `ψ_∞(α) = exp(−2πiα)` (p. 53) and lines 2476–2480 print `i^{(k²−1)/8}` (p. 55).
ArithmeticGaloisRepresentations §2.7 (at its head) gives `sgn` the constant `i` for the trace character of
AnalyticNumberTheoryPartII §5.3g, whose real component is `exp(2πix)`, and multiplies by `χ(−1)` under
`ψ ↦ ψ(−x)`. Independently: the transform of `x·exp(−πx²)` under `exp(−2πixy)` is `−iy·exp(−πy²)` (computed
numerically at `y = 1`: `−0.0432139i = −i·e^{−π}`), so `ε(sgn, exp(−2πix)) = −i`. Global witness at `k = 3`:
`Σ_{y=1,2}(y/3)exp(2πiy/3) = i√3` gives `w₃ = i` (`w₃² = (−1, −3)₃ = −1`); `i·(−i) = +1`, the root number of
`L(s, χ_{−3})`, whereas the printed `i` gives `−1`. `A = Σ_{p<q}(q−p+1) + h_−` recomputed from the §6.6 table
equals `(k²−1)/8` for every odd `k ≤ 25`, and `A` is odd exactly for `k ≡ 3, 5 (mod 8)`, where `ℚ(√(±k!!))` is
imaginary. Even `k`: each induced pair has determinant `−(−1)^{p+q} = +1` at `−1`, so `(−1)^{δ_{8∣k}}` is
unchanged (recomputed for even `k ≤ 24`). The functional equations, §11.3 and both Lean functional-equation
statements are independent of this local convention and are unchanged.

## RT-KloostermanMomentsAndPotentialAutomorphy~2b/F01 (P3) — applied

§0.2 API: added the second moment `−1` for nontrivial `ψ` (proof: `Σ Kl₂(a)² = q(q − 1) − 1`). §0.3 API: added
`Z₂(p; T) = 1 − T`. §1.6 proof: "`deg Z₂ = 1` (§§1.4–1.5)" → "(§1.4 and `Z₂ = 1 − T` of §0.3)"; Needs gains §0.3.
Same pattern: "`Z₁ = 1 − T` (§1.5)" → "(§0.3, with §1.4)", since §1.5 has it only as a Check.

Verified: `Σ_{x,y∈Fˣ} ψ(x + y)(q·[y = −x] − 1) = q(q − 1) − (Σψ)² = q(q − 1) − 1`; second moments computed by
direct summation over `𝔽_p`, `p = 2, 3, 5, 7, 11, 13`: all `−1` (characteristic 2 included, `y = −x = x`).
Negative control: the trivial character over `𝔽₅` gives `4·(16 − 5) = 44`. No cycle: §0.3 is in Layer 0.

## Checks run

- `lake env lean packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean` (from the content checkout):
  no errors; five `declaration uses 'sorry'` warnings, at lines 95, 114, 196, 206, 221 (the five headline
  theorems). The file is unchanged this round.
- Binder check: a scratch copy of the file with `#check @name` for all 22 declarations was elaborated once. Every
  elaborated type matches its README statement; there is no `variable` or `include` block, so no binder can be
  lost; nothing changed relative to the worker's signature record.
- Dependency check, output verbatim:

      depcheck: 240 roadmaps, 2190 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line. The one added edge is to McKaySkewGroup, on main.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere (McKaySkewGroup
  §§0.1–0.2 and its two theorem names resolve on main).
- Gate failures listed in the brief: none.

## Adversarial pass on added and changed statements

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §0.2 second moment `= −1` | `𝔽₂, 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₁₁, 𝔽₁₃`; trivial `ψ` over `𝔽₅` | `−1` each; `44 ≠ −1` | holds; `ψ ≠ 1` needed and stated |
| §0.3 `Z₂ = 1 − T` | every `p`; sum over all `a ∈ F` as wrong model | `exp(−ΣT^m/m) = 1 − T`; wrong model adds `1 − q` per moment, giving `1 − qT` | holds; excludes the wrong model |
| §1.6 route, `p = 2` | `Ḡ ∈ {C_n, D_{2^a}, A₄, S₄, A₅}` | normal Sylow-2 with odd cyclic quotient: `C_n`, `D_{2^a}`, `A₄`; `S₄` has 3, `A₅` has 5 Sylow-2 | only `A₄` survives irreducibility and `Sw(Sym²) = 1` |
| §1.6 `V₄` exclusion | `Ḡ = V₄`, `ρ(I_∞) = Q₈` | `Sym²` = 3 nontrivial characters, breaks `≥ 1`, `Sw ≥ 3`; `deg Z₂ = 1` | excluded |
| §1.6 normalizer | `N ⊇ 2.S₄` | orders `24, 48, 120`; `48 ∤ 120`; `2.S₄/{±1} = S₄ = N_{SO(3)}(A₄)` | `N = 2.S₄` |
| §1.6 route, odd `p` | `p = 3`, `p = 5` | `ρ(P_∞)` of order `3`, `5`, `−1 ∉`; `ρ(I_∞)` binary dihedral of order `4p` = `12`, `20` | cyclic in a torus, as cited |
| McKay contract: transfer to `ℚ̄_ℓ` | entries of a finite subgroup of `SL₂(ℚ̄_ℓ)` | finitely generated field, transcendence degree finite, embeds into `ℂ` | isomorphism type, subgroups, normalizer preserved |
| §6.2 Check | balanced `(1, −1)`; non-balanced `g = c` | order `+1` along `E₁`; order `−1` | agrees with `ord_{E₁}(t·g) = 1` |
| §6.3 `k = 5` Check | `j = 0, 1, 2`; wrong `deg z = 1` | bounds `6, 4, 2` → types `(6,6), (4,2), (2,4)`; bounds `6, 5, 4` → no `(2, 4)` | agrees with §§6.5–6.6 |
| §6.3 `k = 1` Check | triangle; segment | area `1/2`, `2!·vol = 1 = dim H¹_dR`; area `0` | agrees with MHM §10.6 and §5.5 |
| §10.3 factor at `∞`, odd `k` | `k = 1, 3, 5, 7, 9` | `A = 0, 1, 3, 6, 10`; `(−i)^A = 1, −i, i, −1, −1` against printed `1, i, −i, −1, −1` | differs exactly at `k ≡ 3, 5 (mod 8)` |
| §10.3 factor at `∞`, even `k` | `k = 2, 4, 6, 8, 16, 24` | `+1, +1, +1, −1, −1, −1` for both characters | unchanged |
| §10.3 global sign | `k = 3`: `w₃·ε_∞` | `i·(−i) = 1`; printed value `i·i = −1` | `+1` = root number of `L(s, χ_{−3})` |
| §10.3 `k = 6, p = 3` Check | with `N`; without `N` | `3^{4−s}`, conductor `1`; `1`, conductor `0` | matches `(−1)^{v}p^{u((k+2)/2 − s)}`, `u = 1`, `v = 0` |
| Corrections entry, FSY §5.3.1 | `k = 3`, `sgn`, `exp(−2πix)` | `−i` by the local functional equation (numerically `−0.0432139i` against `−i·e^{−π}`) | correction stands |

## Ownership

The new supplier, McKaySkewGroup §§0.1–0.2 (on main), is the existing owner of the finite subgroups of `SL₂(ℂ)`;
this roadmap states no part of that classification. The second moment of `Kl₂` is one of this roadmap's own
moments (Layer 0); `roadmaps grep` finds no other owner on main or in the open pull requests.

## For the maintainer

- No name of `Suggested.lean` changed, no id this roadmap defines moved, and no other roadmap's text is affected.
- New dependency edge: KloostermanMomentsAndPotentialAutomorphy → McKaySkewGroup (on main).
- The archimedean epsilon value for odd `k` now differs from FSY's printed value for `k ≡ 3, 5 (mod 8)`; the
  README records it under "Corrections to the sources". KloostermanSheavesAndBesselIsocrystals and other
  consumers cite no epsilon factor of this roadmap.
- Sources: no new citation, nothing requested in `needs-references.toml`.
