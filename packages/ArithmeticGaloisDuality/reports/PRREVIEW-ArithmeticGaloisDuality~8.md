# Review of ArithmeticGaloisDuality (pull request #3027 at 4a2d22f)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 86 changed lines since `592bdb1`. The new §D7.6a (`Ш` kernels with lattice and divisible coefficients) was checked in full: its definitions, statements (a)–(d), proof sketch and both Checks were computed over `ℚ`, over `ℚ(√−31)` and for an elliptic curve of rank two, and its locators were read in Milne (Theorem I.4.10), Lim (Theorem 4.2.6) and Kolster–Movahhedi (§1, p. 41), together with the edited overview sentences, the layer record, ownership and the dependency order. Accepted with no finding; there are two small corrections in the proof sketch (the character-duality section cited for the passage to the limit in (b) covers only groups of bounded exponent, and the sketch of (c) argues for `T^D` where the statement names `W`) and one format note on a page number, none blocking. Nothing is left for a human to decide.

## C01 — The section cited for the passage to the limit in (b) covers only groups of bounded exponent, and `Ш¹_S(F, T^D)` and `Ш²_S(F, T)` need not have bounded exponent

The proof sketch of (b) (line 5835) and the *Needs* line (line 5853) send an implementer to *Character duality for the arithmetic topological groups* (§R02.4.2, line 2899) for the step where Pontryagin duality turns the colimit into the limit. That section is stated for locally compact groups of bounded exponent, so it does not give the perfect limit pairing. The limit groups can have unbounded exponent. Take the elliptic curve of conductor 389 over `ℚ`, which has rank 2 and good reduction at 3, with `p = 3`, `S = {3, 389, ∞}` and `T = T₃E`, so that `T^D ≅ E[3^∞]` by the Weil pairing. The Kummer image `E(ℚ) ⊗ ℚ₃/ℤ₃ ≅ (ℚ₃/ℤ₃)²` maps to the places of `S` only through `E(ℚ₃) ⊗ ℚ₃/ℤ₃ ≅ ℚ₃/ℤ₃`, because `E(ℚ_389) ⊗ ℚ₃/ℤ₃ = 0` and the real group vanishes. Hence `Ш¹_S(ℚ, E[3^∞])` has positive corank, and `Ш²_S(ℚ, T₃E)` contains `ℤ₃`.

Statement (b) is still true. The isomorphism `Ш²_S(F, T) ≅ Ш¹_S(F, T^D)^*` is the identity `Hom(colim A_n, ℚ_p/ℤ_p) = lim Hom(A_n, ℚ_p/ℤ_p)` applied to the finite-level dualities. The topological half is Matlis duality over `ℤ_p` between finitely generated and cofinitely generated modules. Citing *Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1, already listed among the dependencies of Layer D7) in the sketch of (b) and in the *Needs* line, in place of or beside the character-duality section, would close the gap.

## C02 — The proof sketch of (c) shows that `H¹(G_{F,S}, T^D)` is cofinitely generated, while (c) asserts this for `Ш¹_S(F, W)`

Statement (c) (lines 5818–5819) names `W`, but the sketch (line 5838) argues for `T^D`, so an implementer who follows the sketch proves a different clause. Both clauses are true by the same argument. `W` is `(T′)^D` for `T′ = Hom_{ℤ_p}(T, ℤ_p)(1)`, and `H¹(G_{F,S}, W)[p]` is the image of the finite group `H¹(G_{F,S}, W[p])`. Writing "`H¹(G_{F,S}, W)` and `H¹(G_{F,S}, T^D)` are cofinitely generated" in the sketch would match it to the statement.

## N01 — Milne's Theorem I.4.10 (a) is cited at p. 56 (line 5845), but part (a) is on printed p. 57 (PDF p. 65), the page §R02.4.4 already gives for part (c); the theorem only begins on p. 56.

## Verified sound

| Statement | Instance | Computed: one side | Computed: other side | Result |
|---|---|---|---|---|
| Definitions; `T^D = V′/T′` | `T` free of rank `r`; `T = 0` | `Hom(T, ℤ_p)(1) ⊗ ℚ_p/ℤ_p` | `Hom(T, ℚ_p/ℤ_p)(1) = T^D`; for `T = 0` every group is `0` | holds |
| (a) colimit | `ℚ`, `p` odd, `S = {p, ∞}`, `T = ℤ_p(1)` | `Ш¹_S(ℚ, μ_{pⁿ}) = 0` for every `n`: `H¹ = ⟨p⟩/pⁿ`, and `p` is not a `p`-th power in `ℚ_p` | `Ш¹_S(ℚ, μ_{p^∞}) = 0` | holds |
| (a) limit at a real place | `p = 2`, `T = ℤ₂` with trivial action | `lim Ĥ²(ℝ, ℤ/2ⁿ) = lim ℤ/2` (transition maps are isomorphisms) | `Ĥ²(ℝ, ℤ₂) = ℤ₂/2 = ℤ/2` | holds |
| (b) duality | `ℚ(√−31)`, `p = 3`, `S = {3, ∞}`, `T = ℤ₃(1)` | `Ш¹ = Hom(Cl_S, ℚ₃/ℤ₃) = ℤ/3` (`h = 3`; `(3)` inert, principal) | `Ш² = Cl_S ⊗ ℤ₃ = ℤ/3` | holds |
| (b), unbounded exponent | conductor 389, rank 2, `p = 3`, `T = T₃E` | `Ш¹_S(ℚ, E[3^∞]) ⊇ ker((ℚ₃/ℤ₃)² → ℚ₃/ℤ₃)`, corank `≥ 1` | `Ш²_S(ℚ, T₃E) ⊇ ℤ₃` | holds; C01 |
| (c) structure | the same two instances | `Ш²` infinite exactly when `Ш¹(T^D)` is: both infinite, then both `ℤ/3` | `H¹(G_S, W)[p]` is the image of the finite `H¹(G_S, W[p])`, so `Ш¹(W)` is cofinite | holds; C02 |
| (d) at `p = 2` | `ℚ`, `S = {2, ∞}`, `T = ℤ₂` | `H²(ℚ₂, ℤ₂) ⊕ Ĥ²(ℝ, ℤ₂) = (ℤ/2)²` maps onto `H⁰(μ_{2^∞})^* = ℤ/2` | `Ш² = Ш¹(ℚ, μ_{2^∞})^* = 0`, so `H²(G_S, ℤ₂) ≅ ℤ/2` | consistent |
| (d) at odd `p` | `ℚ`, `S = {p, ∞}`, `T = ℤ_p` | `H²(ℚ_p, ℤ_p) = μ_{p^∞}(ℚ_p)^* = 0`; end term `0` | `H²(G_S, ℤ_p) = 0`; Euler characteristic ranks `1 − 1 + 0 = 0` | consistent |
| (d), its source | Kolster–Movahhedi p. 41, `T = ℤ_p(i)`, `i ≥ 2` | `WK^ét → H² → ⊕_{v∈S} H²(F_v, ℤ_p(i)) → H⁰(F, ℚ_p/ℤ_p(1−i))^* → 0` | `T^D = ℚ_p/ℤ_p(1−i)`; `K^ét = H²` needs `p` odd or `√−1 ∈ F` (p. 38) | matches |
| (b) for lattices, its source | Lim, Theorem 4.2.6 (arXiv v3, p. 32) | triangle isomorphism for bounded complexes of profinite `Λ`-modules; global fields of characteristic `≠ p`; real places allowed | README: number fields, free `ℤ_p`-modules, the scope of §D7.6 | supports; narrower, not raised |
| Finite level, its source | Milne I.4.10(a), pp. 56–57 | nondegenerate `Ш¹_S(K, M) × Ш²_S(K, M^D) → ℚ/ℤ`, `#M` a unit in `R_{K,S}` | Tate groups at archimedean places, as in §R02.4.2 | supports; N01 |
| Check 1 | `T = ℤ₂(e+1)`, `e = 0, 1` | `e = 0`: `ker(N = 2) = ℤ/2`, `(c−1)M = 0`, so `H¹ = ℤ/2` | `e = 1`: `N = 0`, `(c−1)M = 2M = M`, so `H¹ = 0`; the `ℚ(i)` character is nonzero at `∞` | true |
| Check 2 | `ℚ`, `p = 3`, `S = {3, 61, ∞}` | `3⁵ = 243 ≡ −1 (mod 61)`, so `3²⁰ ≡ 1`; the cubic `χ` of conductor 61 has `χ(3) = 1` | `Ш¹ = 0` since `Cl(ℚ) = 1`; `Ш² = 0`; `χ` is ramified at 61 | true |
| Record of layers | merge base against head | 8 layers; D7.1–D7.7 | 8 layers; D7.1–D7.7 kept; D7.6a new, no id reused | kept |

- Source locators checked against the text: 5 (MilneADT lines 2128–2147; Lim2012 line 1293, and line 47 for its quotation of Nekovář; KolsterMovahhedi2000 lines 233–240, with the hypothesis at line 128).
- Internal citations resolved at the head: the five *Needs* entries of §D7.6a (§R02.4.2 twice, §R02.4.3, §R02.4.4, §D7.6), and DerivedModuleAlgebra §1.M.1 on main (its README line 2622).
- Consumers at the head: HeckeIdealsAndTaylorWilesRelations §10.1 and BernoulliBoundsForClassGroupEigenspaces 6.17 cite §D7.6a (b) and (d) as stated there.
- Library declarations opened: none needed. The change adds no Lean, and `Suggested.lean` is unchanged.
- Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`.
- Automatic checks: the worker's run passed every check. A rerun by hand differs only by listing the files of the other folders this pull request changes.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` exits 0 with 12 `sorry` warnings and no other message.
- Seeded sample: none of the fifteen targets lies in changed or affected text (all are in untouched sections, README lines 433–6778).

Overlap check: read SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa, EulerSystemsAndKolyvaginSystems (main), CompletedCohomologyPartII, GlobalGaloisDeformationsPartII, CohomologyOfGroups, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, ModularityAndLanglandsExtensionsPartII (open), and ArithmeticKTheory §6.9. None of them shares an object with §D7.6a: SelmerIwasawaCohomology §§2.18–2.20 treat `H¹` Selmer groups, and ArithmeticKTheory §6.9 has the special case `T = ℤ_ℓ(i+1)` and names ArithmeticGaloisDuality as the owner of Poitou–Tate. ArithmeticGaloisDuality owns the general lattice `Ш` duality. The same statements on main in HeckeIdealsAndTaylorWilesRelations §10.1 now cite §D7.6a at the head.

Source independence: 6 passages compared with 3 sources (changed passages only: the definitions, (b), (d), the Lim attribution, the sketches of (a) and (d)); none shared beyond the notation the mathematics forces. The largest share is MilneADT, with about 87 mentions in the README, the most of any source. Contents were not compared, since the change adds no layer and reorders none.

Research link: §D7.6a is the kernel form of Poitou–Tate duality for `ℤ_p`-lattices, deduced from Tate's finite-level theorem (Milne 2006, I.4.10) and the derived duality of Nekovář (2006) and Lim (2012). For `T = ℤ_p(i)`, its sequence (d) is the étale wild kernel sequence of Kolster–Movahhedi (2000). This rests on README §D7.6a and KolsterMovahhedi2000 p. 41.

## Not verifiable

- Nekovář, *Selmer complexes*, Proposition 5.4.3 (i): the author's page returned HTTP 403. It was checked only as Lim quotes it (Lim2012 line 47).
- Lim's numbering was checked on arXiv v3 (dated after the journal version), not on the published paper in J. Number Theory 132.

Automatic checks set aside as false positives: when run by hand without the pull request's list of folders, the check for edits outside the roadmap folder lists the 112 files of the other roadmap folders this pull request adds or revises.

## Source issues

- none

## For the human reviewers

- none
