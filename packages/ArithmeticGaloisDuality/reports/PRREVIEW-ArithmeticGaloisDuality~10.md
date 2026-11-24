# Review of ArithmeticGaloisDuality (pull request #3027 at e7914b5)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 86 changed lines since `aecb53a`. The new §D7.6a (`Ш` kernels with lattice and divisible coefficients) was recomputed in full: its definitions, statements (a)–(d), proof sketch and both Checks, with its locators read in Milne (Theorem I.4.10), Lim (Theorem 4.2.6) and Kolster–Movahhedi (§1, p. 41), together with the two edited overview sentences, the layer record, ownership, the dependency order and the elaboration of `Suggested.lean`. Accepted with no finding. The folder is unchanged since the previous review, so its two small corrections in the proof sketch (the character-duality section cited for the limit in (b) covers only bounded exponent; the sketch of (c) argues for `T^D` where the statement names `W`) and its format note on a page number still stand; none blocks. Nothing is left for a human to decide.

## C01 — The section cited for the passage to the limit in (b) covers only groups of bounded exponent, and `Ш¹_S(F, T^D)` and `Ш²_S(F, T)` need not have bounded exponent

The sketch of (b) (line 5835) and the *Needs* line (line 5853) send an implementer to *Character duality for the arithmetic topological groups* (§R02.4.2, line 2899) for the step "Pontryagin duality turns the colimit into the limit". That section is stated for "locally compact abelian groups of bounded exponent", so it gives each finite level but not the limit pairing. The limit groups do have unbounded exponent in general: for an elliptic curve `E/ℚ` of rank 2 with good reduction at 3 (conductor 389), `p = 3`, `S = {3, 389, ∞}` and `T = T₃E`, so `T^D ≅ E[3^∞]`, the Kummer image `(ℚ₃/ℤ₃)²` reaches the places of `S` only through `E(ℚ₃) ⊗ ℚ₃/ℤ₃ ≅ ℚ₃/ℤ₃` (the groups at 389 and `∞` tensor to `0`), so `Ш¹_S(ℚ, E[3^∞])` has positive corank and `Ш²_S(ℚ, T₃E) ⊇ ℤ₃`.

Statement (b) is true as written: the isomorphism is `Hom(colim A_n, ℚ_p/ℤ_p) = lim Hom(A_n, ℚ_p/ℤ_p)` applied to the finite-level dualities, and the topological half is Matlis duality over `ℤ_p`. Citing *Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1, already a dependency of Layer D7) in the sketch of (b) and on the *Needs* line, beside or in place of the character-duality section, would close the gap.

## C02 — The proof sketch of (c) shows that `H¹(G_{F,S}, T^D)` is cofinitely generated, while (c) asserts it for `Ш¹_S(F, W)`

Statement (c) (lines 5818–5819) names `W`; the sketch (line 5838) argues for `T^D`, so an implementer following the sketch proves a different clause. Both are true by the same argument (`W = (T′)^D` for `T′ = Hom_{ℤ_p}(T, ℤ_p)(1)`, and `H¹(G_{F,S}, W)[p]` is a quotient of the finite `H¹(G_{F,S}, W[p])`). Writing "`H¹(G_{F,S}, W)` and `H¹(G_{F,S}, T^D)` are cofinitely generated" in the sketch would match it to the statement.

## N01 — Milne's Theorem I.4.10 (a) is cited at p. 56 (line 5845); only the theorem's first line is on printed p. 56, and part (a) is on printed p. 57 (PDF p. 65), the page §R02.4.4 already gives for part (c).

## Verified sound

| Statement | Instance | Computed: one side | Computed: other side | Result |
|---|---|---|---|---|
| Definitions; `T^D = V′/T′` | `T` free of rank `r`; `T = 0` | `Hom(T, ℤ_p)(1) ⊗ ℚ_p/ℤ_p` | `Hom(T, ℚ_p/ℤ_p)(1)`; all groups `0` for `T = 0` | holds |
| Finite level of (b): `M = T^D[pⁿ]`, `M^D = T/pⁿT` | `T = ℤ_p(1)` | `T^D[pⁿ] = ℤ/pⁿ`, `Hom(ℤ/pⁿ, μ_{pⁿ}) = μ_{pⁿ}` | `T/pⁿT = μ_{pⁿ}`; transition maps dual to each other | holds |
| (a) colimit | `ℚ`, `p` odd, `S = {p, ∞}`, `T = ℤ_p(1)`, `W = μ_{p^∞}` | `H¹(G_S, μ_{pⁿ}) = ⟨p⟩/pⁿ`; `p ∉ ℚ_p^{×p}`, so `Ш¹ = 0` each `n` | `Ш¹_S(ℚ, μ_{p^∞}) = 0` | holds |
| (a) limit at a real place | `p = 2`, `T = ℤ₂` trivial action | `lim Ĥ²(ℝ, ℤ/2ⁿ) = lim (ℤ/2ⁿ)/2 = ℤ/2` | `Ĥ²(ℝ, ℤ₂) = ℤ₂/2ℤ₂ = ℤ/2` | holds |
| (b) duality | `ℚ(√−31)`, `p = 3`, `S = {3, ∞}`, `T = ℤ₃(1)` | `Ш¹(ℚ₃/ℤ₃) = Hom(Cl_S, ℚ₃/ℤ₃) = ℤ/3` (`h = 3`, `3` inert) | `Ш²(ℤ₃(1)) = Cl_S ⊗ ℤ₃ = ℤ/3` | holds |
| (b), unbounded exponent | conductor 389, rank 2, `p = 3`, `T = T₃E` | `Ш¹ ⊇ ker((ℚ₃/ℤ₃)² → ℚ₃/ℤ₃)`, corank `≥ 1` | `Ш²_S(ℚ, T₃E) ⊇ ℤ₃` | holds; C01 |
| (b) as exactness of the lattice sequence | general | `ker(H²(T) → P²) = coker(P¹(T) → H¹(T^D)^*)` | `= (ker(H¹(T^D) → P¹(T^D)))^* = Ш¹(T^D)^*` | consistent |
| (c) structure | the two instances above | `Ш²` and `Ш¹(T^D)`: both `ℤ/3`; both infinite | `H¹(G_S, W)[p]` is a quotient of finite `H¹(G_S, W[p])` | holds; C02 |
| (d) at `p = 2` | `ℚ`, `S = {2, ∞}`, `T = ℤ₂` | `H²(ℚ₂, ℤ₂) ⊕ Ĥ²(ℝ, ℤ₂) = (ℤ/2)²` onto `H⁰(μ_{2^∞})^* = ℤ/2` | `Ш² = Ш¹(μ_{2^∞})^* = 0`, so `H²(G_S, ℤ₂) = ℤ/2` | consistent |
| (d) at odd `p` | `ℚ`, `S = {p, ∞}`, `T = ℤ_p` | `H²(ℚ_p, ℤ_p) = μ_{p^∞}(ℚ_p)^* = 0`; end term `0` | `H²(G_S, ℤ_p) = Ш² = Ш¹(μ_{p^∞})^* = 0` (row (a) colimit) | consistent |
| (d), its source | Kolster–Movahhedi p. 41, `T = ℤ_p(i)`, `i ≥ 2` | wild kernel `→ H² → ⊕_{v∈S} H²(F_v, ℤ_p(i)) → H⁰(F, ℚ_p/ℤ_p(1−i))^* → 0` | `T^D = ℚ_p/ℤ_p(1−i)`; `p` odd or `√−1 ∈ F` at p. 38 | matches |
| (b) for lattices, its source | Lim, Theorem 4.2.6 (arXiv v3, p. 32) | isomorphism of triangles, bounded complexes, real places allowed at `p = 2` | README: number field, free `ℤ_p`-lattice, the scope of §D7.6 | supports |
| Finite level, its source | Milne I.4.10 (a), pp. 56–57 | nondegenerate `Ш¹_S(K, M) × Ш²_S(K, M^D) → ℚ/ℤ`, `#M` a unit in `R_{K,S}` | README §R02.4.3 (a), same hypotheses; `p ∈ S` here | supports; N01 |
| Check 1 | `T = ℤ₂(e+1)`, `e = 0, 1` | `e = 0`: `ker N = M[2] = ℤ/2`, `(c−1)M = 0`, `H¹ = ℤ/2` | `e = 1`: `N = 0`, `(c−1)M = 2M = M`, `H¹ = 0` | true |
| Check 2 | `ℚ`, `p = 3`, `S = {3, 61, ∞}` | `3⁵ = 243 ≡ −1 (mod 61)`, `3²⁰ ≡ 1`; `61 ≡ 1 (mod 3)`: `3` is a cube | `Ш¹ = 0` (no unramified extension of `ℚ`); cubic character ramified at 61 | true |
| Record of layers | merge base against head | 8 layers; D7.1–D7.7 | 8 layers, same ids and titles; D7.6a new, no id reused | kept |

- Source locators checked against the text: 5 (MilneADT lines 2129–2147; Lim2012 lines 20–26, 47 and 1293; KolsterMovahhedi2000 lines 232–240, with the hypothesis at line 128).
- Internal citations resolved at the head: the five *Needs* entries of §D7.6a (§R02.4.2 at lines 2792 and 2899, §R02.4.3 at 3001, §R02.4.4 at 3077, §D7.6 at 5592) and DerivedModuleAlgebra §1.M.1 as cited at line 4374.
- Consumers at the head: HeckeIdealsAndTaylorWilesRelations §10.1 and BernoulliBoundsForClassGroupEigenspaces 6.17 cite §D7.6a (b) and (d) as stated there.
- Library declarations opened: none needed; the change adds no Lean, and `Suggested.lean` is identical to `main`'s.
- Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`.
- Automatic checks: every check of the worker's run passed.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` gives 12 `sorry` warnings and no other message; single `import Mathlib`, four `TauCeti.*` imports, no `set_option`.
- Seeded sample: none of the fifteen targets lies in changed or affected text; *Character duality for the arithmetic topological groups* was read because §D7.6a cites it (C01). Previous review: C01, C02 and N01 not repaired (the folder has not changed since the head it read).

Overlap check: read SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa, ProfiniteCohomologyPartII (main), InverseGaloisAndArithmeticFundamentalGroups, ArithmeticGaloisRepresentations, EulerSystemsAndKolyvaginSystems, CompletedCohomologyPartII, GlobalGaloisDeformationsPartII (open); nothing shared with §D7.6a. ArithmeticGaloisDuality owns the lattice `Ш` duality, and the two roadmaps of this pull request that use it cite §D7.6a. The other open pull request that edits this README changes only citation style on other lines (1732, 4418–4421, 5052, 5694–5696, 5744–5746, 6420); the two changes to this folder are disjoint.

Source independence: 6 passages compared with 3 sources (changed passages only: the definitions, (b), (d), the Lim attribution, the description of the Kolster–Movahhedi sequence, the sketch of (d)); none shared beyond notation the mathematics forces; largest share MilneADT, 52 of the README's locators; contents not compared, since the change adds, removes and reorders no layer.

Research link: §D7.6a is the kernel form of Poitou–Tate duality for `ℤ_p`-lattices, from Tate's finite-level theorem (Milne 2006, I.4.10) and the derived duality of Nekovář (2006) and Lim (2012); for `T = ℤ_p(i)` its sequence (d) is the étale wild kernel sequence of Kolster–Movahhedi (2000). Rests on README §D7.6a and KolsterMovahhedi2000 p. 41.

## Not verifiable

- Nekovář, *Selmer complexes*, Proposition 5.4.3 (i): not opened; checked only as Lim quotes it (Lim2012 line 47), which is how the README cites it.
- Lim's numbering was read on arXiv v3, the version the README links, not on the published paper in J. Number Theory 132.

## Source issues

- none

## For the human reviewers

- none
