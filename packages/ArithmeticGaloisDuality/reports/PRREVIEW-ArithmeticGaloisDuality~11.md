# Review of ArithmeticGaloisDuality (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** An incremental re-review of the 41 lines changed since `e7914b5`. Both small corrections of the previous review are repaired in the proof sketch of §D7.6a: the passage to the limit in (b) now rests on Matlis duality over `ℤ_p` instead of the bounded-exponent character duality, and the sketch of (c) now covers `W` as the statement does. The other changes replace whole-layer supplier citations by section citations on seven *Needs* lines; each cited section exists at the head and on `main` and contains what is cited from it. Accepted with no finding and no small correction; one format note (a page number) is carried over. Nothing is left for a human to decide.

## N01 — Milne's Theorem I.4.10 (a) is cited at p. 56 (line 5850); only the theorem's first line is on printed p. 56, and part (a) is on printed p. 57 (PDF p. 65), the page §R02.4.4 already gives for part (c).

## Previous findings

- C01 — repaired: the sketch of (b) now says "the Pontryagin dual is the Matlis dual `Hom_{ℤ_p}(−, ℚ_p/ℤ_p)`, and biduality is *Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1, `R = ℤ_p`)"; the *Needs* line cites §1.M.1.
- C02 — repaired: the sketch of (c) reads "`H¹(G_{F,S}, W)` and `H¹(G_{F,S}, T^D)` are cofinitely generated".
- N01 — not repaired: "Theorem 4.10 (a), p. 56" stands at line 5850; written again above as N01.

## Verified sound

| Statement | Instance | Computed: one side | Computed: other side | Result |
|---|---|---|---|---|
| §D7.6a (b), sketch: Pontryagin dual = Matlis dual on finitely generated `ℤ_p`-modules | `M = ℤ_p`; `M = ℤ/pⁿ` | continuous characters of `ℤ_p`: `1 ↦ ζ` of `p`-power order, group `ℚ_p/ℤ_p` | `Hom_{ℤ_p}(ℤ_p, ℚ_p/ℤ_p) = ℚ_p/ℤ_p`; both `ℤ/pⁿ` for `ℤ/pⁿ` | holds |
| Same, on cofinitely generated modules | `M = ℚ_p/ℤ_p` discrete | `Hom(ℚ_p/ℤ_p, ℚ/ℤ) = End(ℚ_p/ℤ_p) = ℤ_p` | `D(ℚ_p/ℤ_p) = ℤ_p` (DerivedModuleAlgebra §1.M.1, first Check) | holds |
| (b), limit step `Hom(colim A_n, ℚ_p/ℤ_p) = lim A_n^*` | `A_n = ℤ/pⁿ` with inclusions | `Hom(ℚ_p/ℤ_p, ℚ_p/ℤ_p) = ℤ_p` | `lim ℤ/pⁿ = ℤ_p` | holds |
| (b), unbounded exponent now covered | conductor 389, rank 2, `p = 3`, `T = T₃E` | `Ш¹_S(ℚ, E[3^∞])` of corank `≥ 1`, cofinitely generated | `Ш²_S(ℚ, T₃E) ⊇ ℤ₃`, finitely generated; §1.M.1 covers both classes | holds |
| (b), bounded instance unchanged | `ℚ(√−31)`, `p = 3`, `S = {3, ∞}`, `T = ℤ₃(1)` | `Ш¹(ℚ₃/ℤ₃) = Hom(Cl_S, ℚ₃/ℤ₃) = ℤ/3` | `Ш²(ℤ₃(1)) = Cl_S ⊗ ℤ₃ = ℤ/3` | holds |
| (c), sketch against statement | `W = (T′)^D`, `T′ = Hom(T, ℤ_p)(1)` | `H¹(G_{F,S}, W)[p]` is a quotient of the finite `H¹(G_{F,S}, W[p])` | subgroup `Ш¹_S(F, W)` then has finite `p`-torsion: cofinitely generated | holds |
| §1.M.1 hypotheses met for `R = ℤ_p` | `ℤ_p` | complete Noetherian local, residue field `𝔽_p` finite | `E_R(k) = ℚ_p/ℤ_p`; biduality for finitely generated and Artinian modules | supports |
| *Grothendieck local duality*: its sources (sampled) | Stacks 47.18.3 (0A84), 47.16.4 (0A7Q), 47.18.1 (0A82), 47.9.1 (0A6R), 47.10.1 (0955) | 47.18.3: `RHom(K, ω)^∧ ≅ RHom(RΓ_Z(K), E[0])`, `K ∈ D(A)`; 47.18.1: `RΓ_Z(ω) = E[0]` | README steps (1)–(3), completion removed for complete `R` | supports |
| *Abelian-variety Ext*: its sources (sampled) | Milne I.0.16–0.17; I.3.1; II.5.7; Stacks 59.99.1 (0758); Groechenig–Wyss–Ziegler 3.8, 3.11 | printed pp. 11–12; p. 40; p. 203; lemma on injectives under restriction; arXiv v3 pp. 17–18 | README locators the same | supports |
| *Needs* of *Abelian-variety Ext*: §2.3 added | Barsotti–Weil step | extension `0 → G_m → E → A → 0` read as a `G_m`-torsor on `A` | SchemeAndStackFoundations §2.3 is the carrier of torsor classes | consistent |

The rows of the previous review for the untouched statements stand as in that review, of `e7914b5`.

- Source locators checked against the text: 12 (MilneADT lines 567, 581, 1576, 2139, 7426; five Stacks lemmas and Theorem 47.18.3 in the cached book; Stacks 59.99.1; Groechenig–Wyss–Ziegler arXiv v3, Lemma 3.8 and Remark 3.11).
- Cross-roadmap citations resolved at the head and on `main`: 13 sections (AlgebraicCurves §§12A, 12B; SchemeAndStackFoundations §§2.3, 2.7, 2.9, 2.15, 2.18, 2.21; AbelianSchemesAndArithmeticModuli §A2.2; AlgebraicModuliForArithmeticGeometry §4.20; ArithmeticGaloisRepresentations §7.2; DerivedModuleAlgebra §§1.M.1, 1.M.2), each with the names cited from it (`DualizingComplex`, `NormalizedDualizing`, `localCohomology_colimit_ext_comparison`, `derivedTensor`, `derivedHom`, `Gm`, `etale_galois_comparison`, `gerbeClass`, the dual abelian scheme, the trace pairing).
- Library declarations opened: none needed; the change adds no Lean and `Suggested.lean` is unchanged.
- Record of layers: 8 layers at the merge base, the same 8 ids and titles at the head; §D7.6a is the only added heading.
- Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`.
- Automatic checks: every check of the worker's run passed.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` gives 12 `sorry` warnings and no other message.
- Seeded sample: two of the fifteen targets have a changed *Needs* line (*Grothendieck local duality for a complete Noetherian local ring*, *Abelian-variety Ext on the big étale site*); their locators were read as above. The pull request's description names §D7.6a as cited by BernoulliBoundsForClassGroupEigenspaces 6.17, which the head bears out.

Overlap check: read SelmerIwasawaCohomology, NoncommutativeAndEquivariantIwasawa, EulerSystemsAndKolyvaginSystems (main), GlobalGaloisDeformationsPartII, CohomologyOfGroups, IntegralIwasawaTheoryPartII (open) as in the previous review; nothing shared with the changed passages. No other open pull request changes this roadmap, and none drops an id it cites.

Source independence: 5 passages compared with 3 sources (changed passages only: the new sentences of the sketch of (b) and (c) against Milne I.4.10 and Lim 4.2.6, and the *Needs* lines, which quote no source); none shared; largest share MilneADT, 52 of the README's locators; contents not compared, since the change adds, removes and reorders no layer.

Research link: §D7.6a is the kernel form of Poitou–Tate duality for `ℤ_p`-lattices, from Tate's finite-level theorem (Milne 2006, I.4.10) and the derived duality of Nekovář (2006) and Lim (2012); for `T = ℤ_p(i)` its sequence (d) is the étale wild kernel sequence of Kolster–Movahhedi (2000). Rests on README §D7.6a and KolsterMovahhedi2000 p. 41.

## Not verifiable

- Nekovář, *Selmer complexes*, Proposition 5.4.3 (i): not opened; checked only as Lim quotes it (Lim2012 line 47), which is how the README cites it.
- Lim's numbering was read on arXiv v3, the version the README links, not on the published paper in J. Number Theory 132.

## Source issues

- none

## For the human reviewers

- none
