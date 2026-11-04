# GATE-GaugeQuiltFieldTheory~1: answers to human review

The review was posted against head `4338826`. Its three README corrections were already made in the next commit, `971ef96`. This round checks those corrections against the sources. It also replaces `Suggested.lean` and removes the README's gate failures. Repair commit: `25e0ea3f` (not pushed).

## H01 (roed-math) — applied

The claim that every elementary handle correspondence is spin is false. `TauCetiRoadmap/GaugeQuiltFieldTheory/README.md` line 43 now says that absolute spin is not asserted. GQ2b (lines 58–74) replaces the claim with a relative-spin lift for the background `pr_-*B_g ⊕ pr_+*B_(g+1)`, where `b_g = (g mod 2)·η_g`, so that `w₂(TL_g) = p*η_g = p*b_g + q*b_(g+1)`. The case `r=2, d=1, g=2→3` is kept as a negative calibration at line 74.

Checked against the sources:
- Wehrheim–Woodward 1601.04924v2, Theorem 3.4.3: its proof treats `L(Q)` as a principal `G₀`-bundle (WehrheimWoodwardCoprime lines 1366–1385).
- Lemma 3.4.5 of the same paper gives the associated-bundle model with residual conjugation (lines 1429–1444).
- Scaduto–Stoffregen 1707.06268: the effective free `SO(3)` action (SS1707.06268 lines 23–28) and `d₂(1⊗y) = ᾱ` (line 307, Proposition 1 at line 314).
- Scaduto–Stoffregen 1707.06207: `w₂(E) = α mod 2` (SS1707.06207 line 30) and `c₁(TN_g) = 2α` (§4.2, line 862).

`ᾱ ≠ 0` because `α` generates the torsion-free group `H²(N_g;ℤ)`. Each of `b_g`, `b_(g+1)` is either `0` or `η`, exactly one of them nonzero, so their sum is `η`, which matches `w₂(TL_g)`.

## H02 (roed-math) — applied

Each of the three items the review asks the roadmap to own is now a stated target:
- **(1) Evaluation bundles.** GQ2a (line 45ff) builds the evaluation bundles `E_g = P_g ×_Ad su(r)` on the effective `PSU(r)` frame bundle. GQ2b gives the endpoint comparison `q*E_(g+1) ≅ p*E_g`.
- **(2) Backgrounds.** GQ2a fixes the backgrounds `B_g` for every surface value, including rank one, point and empty values. GQ2b covers reversed handles and cylinders.
- **(3) Compatibility.** GQ2c (line 76ff) gives the `TM_1 ⊕ B_1 ⊕ B_1` cancellation for composition, the Cerf-move lifts and the GQ4 determinant-line orientations. GQ3 (line 98ff) requires that replacement correspondences are relatively spin.

## H03 (roed-math) — applied

The reference at README line 151 now lists S. Ma'u, K. Wehrheim and C. Woodward, matching the arXiv record 1601.04919.

## H04 (roed-math) — applied

GQ4, README line 126, now treats the chord operator `A` and the strip operator `D = ∂_s + A` separately. `A` is the self-adjoint, invertible operator on its Lagrangian domain; `D` is not self-adjoint. The formal adjoint is stated as `D†₀ = −∂_s + A`.

The weighted formulas were recomputed:
- From `⟨Du,v⟩_φ = ∫ e^{2φ}⟨u_s + Au, v⟩` one gets `D†_φ = −∂_s + A − 2φ′`.
- Conjugating, `e^φ D e^{−φ} = ∂_s + A − φ′`.
- Pairing opposite weights gives `−∂_s + A`.

All three agree with the README text.

## H05 (roed-math) — applied differently

The review noted that `Suggested.lean` held only a group-theoretic prototype and did not state the surface or quilt theorems. The file has been replaced; it now opens with `import Mathlib`, where the old version imported a Mathlib submodule, which the gate refuses. It now defines the GQ1 representation model on native carriers: `relationSet` (tuples in `Matrix.specialUnitaryGroup (Fin r) ℂ` whose ordered commutator product is `ζ·1`) and `relationModuli` (its quotient by `ConjAct` conjugation). It states three headlines, each assuming `IsPrimitiveRoot ζ r`:
- `relationModuli_genus_one`: the genus-one moduli is a point (WW Theorem 3.3.3(c)).
- `relationSet_stabilizer_central`: every stabilizer is central, so the `PSU(r)` action is free.
- `relationModuli_simplyConnected`: the moduli is simply connected for `g ≥ 1` (WW Theorem 3.3.3, final clause).

The module docstring says what is not statable at the pins:
- the field-theory functor: the pins have no decorated bordism category, no `A∞` categories (Tau Ceti has `A∞` algebras and modules only), and no Fukaya or quilt theory;
- the symplectic structure, dimension and `c₁ = 2r[ω]`;
- the Lagrangian correspondences, `w₂` identities and Cerf invariance.

The README's GQ1 (line 17ff) names all five declarations and gives their routes and three Checks.

## H06 (roed-math) — answered

The reviewer could not compile locally. At the repair commit, `lake build TauCetiRoadmap.GaugeQuiltFieldTheory.Suggested` completes successfully; the only warnings are the three intended `sorry`s.

## Other repairs made so the gate passes

- Nine LaTeX display blocks became indented Unicode formula lines.
- Nine links pinned to commits of other roadmaps became plain citations by roadmap and section. The sections were checked: HamiltonianReduction R5, SpinGeometry G4, HeegaardFloer F0–F3 and DGAInfinity on main; SmoothBundlesConnections B1–B5 and FukayaTheory FK0/FK1.1 at their open heads.
- Spacing typos fixed: "Theorem3.4.3", "characteristic2".
- Reference locators added: WW Theorem 3.3.3, Remark 3.3.7 eq. (31), Theorem 3.4.3, Lemma 3.4.5 and Theorem 3.5.1; Scaduto–Stoffregen Proposition 1 and §4.2.

SmoothBundlesConnections and FukayaTheory are not on main and not in this roadmap's merge-order prefix. Depcheck does not flag them, but their status as suppliers should be confirmed when the roadmap enters the order. The README's overall shape (no Scope/Conventions/Layer headings) was not changed, because that is outside these review points.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `relationSet_stabilizer_central` | g=0, r=2, ζ=−1 | empty product `1 ≠ −1`, so the set is empty and the statement is vacuous | holds | none |
| | r=1 | SU(1) is trivial, so `u = 1` is central | holds | none |
| | r=2, ζ=1 (not primitive), g=1, x=(1,1) | `u = diag(i,−i)` commutes with x and is not central | fails without primitivity | primitivity kept; negative Check added |
| | eigenspace argument, dim m | `det = 1 = ζ^m`, so `r ∣ m`, so `m = r` | holds | route recorded in README |
| `relationModuli_genus_one` | r=2, ζ=−1 | `A = diag(i,−i)`, `B = [[0,1],[−1,0]]`: `BA⁻¹B⁻¹ = −A⁻¹`, so `[A,B] = −1` (existence) | holds | Check added |
| | uniqueness | `A^r` is scalar; with `det A = 1` the eigenvalue set of `A` is one fixed coset of `μ_r`; Heisenberg irreducible unique up to `U(r)`, and `U(r) = ℂ^×·SU(r)` | holds | route recorded |
| | r=2, ζ=1 | commuting pairs mod conjugation form the pillowcase `S²`, not a point | fails without primitivity | negative Check |
| `relationModuli_simplyConnected` | g=1 | point (by genus-one theorem) | holds | none |
| | r=1 | `SU(1)^{2g}` is a point | holds | none |
| | g=0 excluded | for r ≥ 2 the set is empty, and `SimplyConnectedSpace` needs nonempty | hypothesis `1 ≤ g` needed | kept |
| | g ≥ 2, r ≥ 2 | WW (31) homeomorphism to `M(P)` plus WW Thm 3.3.3 simple connectivity | holds per source | none |
| GQ2b `w₂(TL_g) = p*b_g + q*b_(g+1)` | g even: `(0, η)`; g odd: `(η, 0)` | sum `η = w₂(TL_g)`, computed as `w₂(TN) + w₂(E) = 0 + η` | holds | none |
| GQ2b cylinder | diagonal | `b + b = 0 = w₂(TN_g)` | holds | none |
| GQ2b `L_g` dimension | `dim N_g + k = (2g−1)k` against `½(dim N_g + dim N_(g+1)) = ½(2g−2+2g)k` | equal | Lagrangian dimension correct | none |
| GQ4 adjoints | computed above (H04) | `−∂_s+A−2φ′`, `∂_s+A−φ′`, `−∂_s+A` | holds | none |
| `IsPrimitiveRoot ζ r` ↔ `gcd(r,d)=1` for `ζ = exp(2πid/r)` | r=4, d=2 | order of ζ is 2, not 4, so not primitive (and gcd = 2) | equivalence holds | stated in README |

**Signature check.** I appended `#check @name` for all five declarations to the file, built once, then removed the lines. The elaborated types match the README statements: every hypothesis (`1 ≤ r`, `IsPrimitiveRoot ζ r`, `1 ≤ g`) is an explicit binder, and the file has no section `variable` block, so no binder can be dropped. Nothing changed as a result.

**Ownership.** The twisted `SU(r)` relation model is this roadmap's GQ1 specialisation. I found no other definition of it in Mathlib or Tau Ceti at the pins. Ownership against the open pull requests was checked only for the citations above; I ran no repository-wide object search.

**Sources.** WW 1601.04924v2 and Scaduto–Stoffregen 1707.06207v1 and 1707.06268v1 were fetched from arXiv, and locators were checked against them. The package has no `sources.toml`, and this job may edit only README.md and Suggested.lean, so no manifest entries were written. No texts are missing.

**Suspicious text in the review:** none.

## Build and gate

- `lake build TauCetiRoadmap.GaugeQuiltFieldTheory.Suggested`: Build completed successfully (8976 jobs). Warnings: three `declaration uses 'sorry'`, at lines 47, 55 and 66.
- Gate: `gate GaugeQuiltFieldTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`. The only failure is `depcheck: NOT IN ORDER`; the brief says this is not a defect for a roadmap at the design stage.
- Depcheck (`--movable`): `NOT IN ORDER: GaugeQuiltFieldTheory (insert it after its last supplier)` / `depcheck: 148 roadmaps, 1006 edges, 1 problem(s)`. No UPWARD or CYCLE line.
