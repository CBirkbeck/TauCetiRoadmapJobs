# Review of BelyiMaps (pull request #767 at fde6599)

**Verdict:** accepted

Incremental re-review of the 61 lines changed since `c19b421`. No finding: the six findings of the previous report are repaired, the repairs introduce no new problem, and the gate passes.

## Previous findings

- R01 — repaired: `Suggested.lean:2` imports `TauCeti.FieldTheory.FunctionField.Belyi.GaloisAction`; `:91–99` states `faithfulSMul_absoluteGaloisGroup_isoClass` with `sorry`; the docstring's 13.5 bullet is gone and the 9.8/10.7/11.6 bullet reads "that the pinned Tau Ceti does not have"; `README.md:74–77, 615–620` agree.
- R02 — repaired: `README.md:128` "Eleven roadmaps supply material to this one." The Boundaries section and the supplier table name eleven (count below).
- R03 — repaired: `README.md:333` "from B   5.6, 6.1, 6.3, 7.1, 8.7, 9.1, 9.1C, 9.5–9.8, 10.2, 10.3, 10.7,"; it now covers the prerequisite line of 12.4 at `:4714`.
- R04 — repaired: `README.md:3636` "`[M(S) : ℂ(f)] ≤ deg f` by the elementary symmetric functions of the fibre values", the same orientation as `:3637`.
- R05 — repaired: `README.md:566` names `TauCeti.Representation.centralCharacter`, as `:152` and `:1390` do; `TauCeti.centralCharacter` no longer occurs in the README.
- R06 — repaired: the description's last paragraph says the branch pins Tau Ceti `2fd255d997f4` and Mathlib `1b1ccf4b088b`, and its **Suggested.lean** paragraph says the file states Layer 13.5 with `sorry` and keeps the two proved lemmas. Both match the head.

## Verified sound

**Gate, build, dependency check.** Gate rerun at `fde6599`: every counter `0`, `OK`. `lake env lean TauCetiRoadmap/BelyiMaps/Suggested.lean`: exit 0, one warning, `97:8: declaration uses sorry`. `lake-manifest.json` pins Tau Ceti `2fd255d997f4` and Mathlib `1b1ccf4b088b`, and the checked-out packages are at those revisions. Dependency check output: `depcheck: 234 roadmaps, 2263 edges, 0 problem(s)`, no UPWARD or CYCLE line. Changes outside the folder against `origin/main`: none.

**Signatures.** `#check @name` on a scratch copy for the three declarations: `faithfulSMul_absoluteGaloisGroup_isoClass : FaithfulSMul Gal(AlgebraicClosure ℚ/ℚ) (TauCeti.AlgebraicBelyiPair.IsoClass (AlgebraicClosure ℚ))`, with no section binder to lose; `opposite_third_peripheral` and `conjugation_transfer` are unchanged from the previous report. The new statement equals `README.md:5226–5227` and `:616–620`.

**Padding probe on the new theorem.** On a scratch copy: `infer_instance` fails (no instance), `simp` makes no progress, `constructor; intro a b h; simp_all` makes no progress, `rfl` fails, `exact?` proposes only the statement itself. Not padding.

**Adversarial table.** Rows for statements the diff leaves untouched are carried from the previous report (its table, 27 rows: §Pinned conventions, 0.5–0.8, 1.6, 2.6, 3.2–3.5, 4.4, 4.5, 5.8, 6.3, 7.7, 8.5, 9.1, 9.3, 9.7, 10.2, 10.3, 10.5, 10.7, 11.1, 11.4, 11.7, 12.11, 12.12, 14.1, Hall's numbers); none of those passages changed. Rows for the changed statements:

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 13.5 as stated in `Suggested.lean:97–99` | the action at the pin; `σ = 1`; `σ ≠ 1` on a polynomial pair; universe | `GaloisAction.lean:239`: `g • c = c.conj (toRingEquiv g)`; `Bundled.lean:79–90`: classes are pairs up to `≃ₐ[RatFunc k]`, so `t` is fixed and no Möbius change of the target is allowed. `σ = 1`: `conj_refl` gives `c`, both sides agree. `σ ≠ 1`: the pair `ℚ̄(x) / ℚ̄(P)` and its conjugate `ℚ̄(x) / ℚ̄(P^σ)` are isomorphic over `ℚ̄(t)` only by a Möbius `m` with `P^σ ∘ m = P`; `P⁻¹(∞) = {∞}` forces `m(∞) = ∞`, so `m` is affine, which `TauCeti.exists_polynomial_criticalValues_subset_comp_ne_map` excludes. `AlgebraicClosure ℚ : Type`, carriers in `Type`, and `ℚ̄(x)` lives there | true; the wrong model (classes up to Möbius on `t`) is excluded by the pinned setoid |
| 8.7 source line, `[M(S) : ℂ(f)] ≤ deg f` (`README.md:3636`) | `f = z²` on the sphere; `f = id` | `M(S) = ℂ(z)`, `ℂ(f) = ℂ(z²)`, degree `2 ≤ 2`; degree `1 ≤ 1`; the old orientation `[ℂ(f) : M(S)]` is not a degree for `z²` | correct |
| Supplier count (`README.md:128`) | Boundaries section and table `:562–584` | CharacterTheory, UniversalCovers, AlgebraicTopology, ConformalMapping, ComplexManifolds, FuchsianOrbifolds, ModularForms, AlgebraicCurves, PolynomialGaloisGroups, ProfiniteProPGroups, ProfiniteArithmetic = 11 | correct |
| Section C import row (`README.md:333–334`) | prerequisite lines naming 9.1C | `:4714` (12.4) names 9.1C and is in C; `:4231` (10.6) is in B and needs no row | correct |
| Supplier row for 3.2 (`README.md:566`) | the pin | `RepresentationTheory/CharacterTable/CentralCharacter.lean:35` documents `TauCeti.Representation.centralCharacter`; CharacterTheory Layer 4.3 on main cites the same name | correct |

**Library declarations opened at the pin** (`2fd255d9`): `FieldTheory/FunctionField/Belyi/Bundled.lean:55` (`AlgebraicBelyiPair`), `:79–90` (the setoid and `IsoClass`); `Belyi/GaloisAction.lean:214–262` (`IsoClass.conj`, `conj_refl`, `conj_conj`, `instMulAction` at `:239`, `smul_def`, `smul_mk`, `smul_mk_eq_mk_iff`); `RepresentationTheory/CharacterTable/CentralCharacter.lean:19, 35`. No `FaithfulSMul` statement on `AlgebraicBelyiPair.IsoClass` exists at the pin, on main or at any open head (the only hit of the roadmap search is this file), so the new theorem duplicates nothing and no other `Suggested.lean` declares its name.

**Overlaps.** Unchanged from the previous report: #1187 is ordered after this pull request in the generated merge-order block, and #1791 falls under its "whichever merges second is rebased" rule. No dropped id and no id that only an open revision defines.

**Seeded sample.** The sampled targets lie in passages the diff does not touch and are covered by the previous report's rows, cited above. The one changed passage the sample meets is the source line of 13.5 ("Lemma 4.50", with Theorem 4.49 now also named in the Lean docstring); see "Not verifiable".

## Not verifiable

- Girondo–González-Diez, **Lemma 4.50**, **Theorems 4.48, 4.49** and **Proposition 1.89**, **Corollary 1.93(iv)**: the book is paywalled and no legal copy was found, as in the previous round. The numbering, and whether Proposition 1.89 states the bound for the whole extension, were not checked; the mathematics of the two passages was checked by the computations in the table.

## Source issues

- none
