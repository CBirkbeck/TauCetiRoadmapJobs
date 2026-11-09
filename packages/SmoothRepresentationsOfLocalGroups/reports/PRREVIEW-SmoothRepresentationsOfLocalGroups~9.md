# Review of SmoothRepresentationsOfLocalGroups (pull request #1688 at 3419c0b)

**Verdict:** accepted

Incremental re-review of the 9 lines changed since 1b376be. The change touches one bullet of the SR.1.3 **Checks.** list (`TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md` 1338–1342); `Suggested.lean` is byte-identical to 1b376be (`git diff 1b376bee HEAD -- …/Suggested.lean` is empty) and nothing outside the folder differs from `origin/main`. The repair is exactly the one prescribed for R01 of the previous report and is correct; it introduces nothing new. The gate passes, the dependency check prints no problem, and the file elaborates at the pins with `sorry` as the only warning. No finding remains.

## Previous findings

- R01 — repaired: README 1338–1342 now opens “For `A ≠ 0` and `H = ⊕_{n ∈ ℕ} A` with componentwise product …”, says H ⊗_A H “is free on the ε_i ⊗ ε_j”, gives the difference `Σ_{k ≤ N, k ≠ n} ε_k ⊗ ε_n ≠ 0` for N > n, and ends “For A = 0 both tensors are zero.”

## Verified sound

### The changed passage (README 1338–1342)

Every clause of the rewritten Check was recomputed (row 1 of the table below):

- **Local units.** u_N = Σ_{k ≤ N} ε_k is idempotent (the ε_k are orthogonal idempotents), and u_N ε_n = ε_n = ε_n u_N for N ≥ n. So both u_N and ε_n are local units of ε_n, and the inverse m ↦ e ⊗ m of SR.1.3 (README 1309–1312) sends ε_n to ε_n ⊗ ε_n.
- **Identity in H ⊗_H H.** With r(h, h′, m) = hh′ ⊗ m − h ⊗ h′m (the relations named at README 1311), u_N ⊗ ε_n − ε_n ⊗ ε_n = −r(u_N, ε_n, ε_n). So the two tensors agree in H ⊗_H H for every N ≥ n.
- **Freeness.** H = ℕ →₀ A is free on the ε_k, so H ⊗_A H is free on the ε_i ⊗ ε_j (Mathlib `Basis.tensorProduct`, `Mathlib/LinearAlgebra/TensorProduct/Basis.lean:40`).
- **The difference is nonzero.** The difference Σ_{k ≤ N, k ≠ n} ε_k ⊗ ε_n is a sum of N ≥ 1 distinct basis vectors with coefficient 1, so it is nonzero exactly when 1 ≠ 0 in A. The added hypothesis `A ≠ 0` is the right one. The new final sentence records the A = 0 case correctly (H = 0).
- **Consistency with the list.** The bullet now follows the convention of the neighbouring bullet at 1334–1336 (“For `A ≠ 0`, … For A = 0 both modules are zero”).
- **Statement it tests.** It agrees with the SR.1.3 statement it tests (1309–1312): bijectivity of H ⊗_H M → M. Nothing in the README cites this Check, so no other passage depends on it.
- **Style.** The new code span is Unicode, the gate counts `latex=0` and `round-labels=0`, and the bullet names no Lean declaration.

### Gate, dependency check, elaboration

Gate rerun on 3419c0b:

`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

The worker's `scratch/gate.md` agrees and adds `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.

Dependency check as the brief gives it (real order, `--movable`):

```text
depcheck: 236 roadmaps, 2266 edges, 0 problem(s)
```

ORDER.txt lists this roadmap at line 25, after its suppliers (lines 1–24).

Elaboration: `lake env lean TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean` exits 0. It prints exactly 12 `declaration uses sorry` warnings (lines 92, 106, 139, 148, 161, 171, 186, 242, 260, 281, 331, 348), the same set as at 1b376be.

The imports are `import Mathlib` plus eight `TauCeti.*` modules, all of which resolve at the pin. `scratch/signatures.md` flags three section binders as dropped:

- `[TopologicalSpace F]` from `Points`;
- `[TopologicalSpace G]` from `AbsolutelyIrreducible` and `IsGeneric`.

These are the same three that r6–r8 checked. They are algebraic definitions whose bodies do not use the topology, so the binders are correctly dropped.

### Seeded sample

None of the fifteen seeded targets falls in the changed lines 1338–1342. Their positions at this head are those of r8, plus 1 after line 1342:

- is-smooth 623
- smooth-discrete-comparison 740
- unit-pro-order 791
- klingen-positive-hecke 1566
- compact-generation 1797
- derived-hecke-algebra 1869
- geometric-lemma 2175
- the “Check (which operator)” paragraph 2230
- compact-representations 2340
- langlands-classification 2939
- paired-unitary-parameter 3461
- distinguished-cuspidal-types 3886
- universal-whittaker 4320
- wd-raw-parameters 4477
- llc-family-conditional 4833

They keep the source verification of the earlier full reviews. The changed lines cite no source, and the README flags no locator as unverified (`grep -i unverified` finds nothing).

### Computed adversarial pass

The diff changes one statement (row 1). Rows 2–8 are carried from the r8 report for statements the diff leaves untouched; their line numbers are unchanged, except the negative control, now at 1343–1344. Rows 9–18 cover the headline theorems of `Suggested.lean`, carried from r8 (which carried them from r4–r7) at byte-identical statements, each with one instance recomputed here.

| # | Statement and line | Instances and computed values on the two sides | Result / change |
|---|---|---|---|
| 1 | Check: A ≠ 0, H = ⊕_{n∈ℕ} A, u_N = Σ_{k≤N} ε_k, M = H (README 1338–1342) | A = ℤ, n = 0, N = 1: in H ⊗_ℤ H, u_1 ⊗ ε_0 − ε_0 ⊗ ε_0 = ε_1 ⊗ ε_0, a basis vector ≠ 0; in H ⊗_H H it is −r(u_1, ε_0, ε_0) = 0. A = 𝔽₂, n = 1, N = 3: ε_0⊗ε_1 + ε_2⊗ε_1 + ε_3⊗ε_1, three distinct basis vectors, ≠ 0 (no cancellation in characteristic 2). N = n: empty sum 0, consistent with “for N > n”. A = 0: H = 0, both tensors 0, as stated. Multiplication H ⊗_A H → H sends the difference to u_Nε_n − ε_n = 0, so H ⊗_A H → H is not injective and the relations are needed. | Pass / — (r8 R01 repaired) |
| 2 | A-structure of a nondegenerate module determined, a·m = (ae)m (1306–1308) | Carried from r8: independence of e via a common local unit f, (ae)m = (af)m = (ae′)m. Unit: 1·m = em = m. Uniqueness: a·m = a·(em) = (ae)m. H = 0: M = 0. | Pass / — |
| 3 | Same category over A or over the ring H (1308–1309) | Carried from r8: f H-linear, e a local unit of m: f((ae)m) = (ae)f(m) = a·f(m). | Pass / — |
| 4 | Submodules of nondegenerate modules are nondegenerate (1309–1310), negative control (1343–1344) | Carried from r8: n = en ∈ HN. 2ℤ on ℤ[1/2]: 2ℤ·ℤ[1/2] = ℤ[1/2], 2ℤ·ℤ = 2ℤ ∌ 1. In 2ℤ, e² = e forces e = 0, so 2ℤ is not idempotented. | Pass / — |
| 5 | H ⊗_H M → M bijective, inverse m ↦ e ⊗ m (1309–1312) | Carried from r8: e ⊗ m = fe ⊗ m = f ⊗ em = f ⊗ m. h ⊗ m ↦ hm ↦ e ⊗ hm = eh ⊗ m = h ⊗ m. Zero module: 0 = 0. H unital: 1 ⊗ m ↦ m. | Pass / — |
| 6 | Scope deferral (78–85), shared interfaces (135–138) | Carried from r8: CyclicHomologyLieHomologyAndQuasiFreeAlgebras §5.4 owns firm modules over a general nonunital ring and records SR.1.3 as its instance. That roadmap's last supplier, RefinedTraceMethods, is at ORDER line 330, after this roadmap's line 25. | Pass / — |
| 7 | `SmoothRep.grothendieck` (Lean 92–95) | Carried from r8: `IsGrothendieckAbelian [Abelian C]` (`GrothendieckCategory/Basic.lean:70`). G trivial: SmoothRep = Rep A 1 ≃ A-modules, Grothendieck. G discrete: smooth = all representations. | Pass / — |
| 8 | `whittakerCoinvariants_one_dimensional` (Lean 106–116) | Carried from r8: a one-dimensional V (excluded by `hinf`) gives V_{U,ψ} = 0, finrank 0 ≠ 1. ψ = 1 (excluded by `hψ1`) gives the Jacquet module of an irreducible principal series, dimension 2. A sum of two generic representations (excluded by `hi`) gives 2. | Pass / — |
| 9 | `isAdmissible_of_isIrreducible` (Lean 139) | H = 𝔾_m, Points = F^×. An irreducible smooth complex V is spanned by the countably many g·v (g ∈ F^×/K), so by Schur it is a character, and dim V^K ≤ 1 for every compact open K: admissible. | Pass / — |
| 10 | `exists_finrank_invariants_le` (Lean 148) | 𝔾_m, K = O_F^×: every irreducible smooth is a character, finrank V^K ∈ {0, 1}, so c = 1 works. `∃ c` precedes `∀ V`, so the bound is uniform as [Ber92] II §1.4 states. | Pass / — |
| 11 | `isFiniteLength_of_isAdmissible` (Lean 161) | 𝔾_m, V = C_c(F^×/O^×) ≅ ℂ[t^{±1}], cyclic on 1_{O^×}: V^{O^×} is infinite-dimensional, so it is not admissible and is excluded by `hadm`. It has infinite length (chain ((t−1)^k)), so `hadm` is needed. A character: length 1. | Pass / — |
| 12 | `isNoetherian_of_finite` (Lean 171) | 𝔾_m, V = C_c(F^×/O^×) ≅ ℂ[t^{±1}]: its submodules are ideals of a PID, so it is Noetherian. Negative control for `hs`: the regular ℂ[F^×] is cyclic but not Noetherian, since F^× ≅ ℤ × O^× is not finitely generated. | Pass / — |
| 13 | `heckeAlgebra_finite_over_center` (Lean 186) | 𝔾_m, K = O^×: R = End(ℂ[F^×/O^×]) ≅ ℂ[t^{±1}], commutative, so the centre is R, finite over itself and of finite type (generated by t, t⁻¹). Trivial group, K = G: R = ℂ. | Pass / — |
| 14 | `EssentiallyAIG.scalars` (Lean 242) | n = 1: U is trivial, so Subsingleton(V/S) gives V = S, an absolutely irreducible character. Then f = a·id, and a is unique since S ≠ 0. | Pass / — |
| 15 | `CoWhittaker.scalars` (Lean 260) | n = 1: U trivial, coinvariants = V ≃ A, and an A-linear f : A → A is multiplication by f(1), with a unique. A = 0: a = 0 is unique. | Pass / — |
| 16 | `CoWhittaker.tensor_endomorphisms` (Lean 281) | n = 1, V ≃ A with character θ: τ ≅ M with g acting by θ(g)·id, so every A-linear map commutes with G, End_G(τ) = End_A(M), and e f (m ⊗ v) = f m ⊗ v. M = 0: both sides are the zero ring. | Pass / — |
| 17 | `WeilDeligneParameter.exists_frobeniusSemisimple` (Lean 331) | dim V = 1: every r w is a scalar (semisimple) and N = 0, so Dss = D. V = E², r(Frob) = [[1,1],[0,1]], trivial inertia, N = 0: Dss with r(Frob) = 1 keeps charpoly (X−1)², keeps N and agrees on ker deg. | Pass / — |
| 18 | `grothendieck_quasiUnipotent_complete` (Lean 348) | V = E with an unramified character: ρ is trivial on inertia and nilpotent N on a line is 0. The exponential sum is 1 = ρ(σ). N = 0 is the unique solution. | Pass / — |

Carried from r8 without recomputation: the 179 rows r8 carried from r7 (6 rows) and, through it, from r4–r6 (173 rows), including the rows for the seeded sample. Their statements are untouched. Line numbers are r8's, plus 1 beyond 1342.

### Ownership and overlaps

`scratch/overlaps.md` (recomputed at main 3090489 and 457 open heads):

- no other open pull request changes this roadmap;
- no cited id is dropped by an open pull request;
- no cited id is defined only by an open revision.

The closest roadmaps (#1815, #1736, #1737, #999, #931) are unchanged since r8, which found that none of them owns what SR.1.3 owns. The changed Check introduces no object and no citation.

`scratch/citations.md` lists 13 Lean names found nowhere. As in r4–r8, they are README names of targets that are not in `Suggested.lean` (`readme-ids-missing=0`), and none is in the changed lines.

### Remarks (untouched text, no change requested)

The pull request description is outside the folder and is regenerated by the worker:

- It still names a dependency on ReductiveGroupsPartII and an import of its module. `Suggested.lean` imports no roadmap module.
- Its merge-order chain still ends at CyclicHomologyLieHomologyAndQuasiFreeAlgebras, although the dependency check finds no edge to that roadmap.

## Not verifiable

- **[Tat79]**: paywalled at the AMS (DOI 10.1090/pspum/033.2/546607). It is settled as `uncertified` and is not cited by the changed lines.
- **[BH06]** 36.1, **[Mac]**, **[HM18]**, **[Nak]**: not in the sources cache and not legally readable here, as in the earlier reports. None is cited by the changed lines.

## Source issues

- none
