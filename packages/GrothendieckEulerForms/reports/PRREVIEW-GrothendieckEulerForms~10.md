# Review of GrothendieckEulerForms (pull request #2585 at e52e69d)

**Verdict:** accepted

**Summary.** No findings: this roadmap folder is ready for a human's final approval. The head is the one the previous review read, and a second full pass recomputed every Check, the four headline theorems and the `sorry`'d graded Cartan target without finding a false statement; the sampled locators in Bühler, Weibel's *K-book* and Dancso–Licata state what they are cited for, with three loose attributions. There are two small corrections, neither blocking: AlgebraicKTheory is named as a consumer although it cites no roadmap (unchanged from the previous review), and three locators sit beside statements their source does not make. One fact is left for the human reviewers: StablePeriodicCurved's Lean file imports this module.

## C01 — AlgebraicKTheory is named as a consumer of this roadmap, but it uses Tau Ceti's split K₀ directly and cites no roadmap as an input

A reader who follows the overview or the consumer list to AlgebraicKTheory finds no trace of this roadmap there. The overview (lines 54–56) says that AlgebraicKTheory and KTheoryLowDegrees "build on the split and exact `K₀` here", and the consumer list (lines 1629–1631) says that AlgebraicKTheory uses "the split and exact `K₀`, the additive functor maps and the resolution comparisons of Layers 2–3". AlgebraicKTheory on main never mentions GrothendieckEulerForms; it takes `TauCeti.SplitK0` as "the single categorical split K₀ engine" (its line 15) and says that none of the roadmaps it leaves material to is cited as an input (its line 17). KTheoryLowDegrees and GeneralAlgebraicKTheory do cite Layers 2–3 here, so the sentences hold for them.

The smallest repair is to drop AlgebraicKTheory from both sentences, or to say that it uses Tau Ceti's `TauCeti.SplitK0`, the carrier of §2.1, directly.

## C02 — Three locators stand beside statements that the cited item does not make

A reader who opens the source at the locator finds a different statement. In §5.5 (line 1128) the descent of the Ext-Euler value to a biadditive pairing on exact `K₀`, with its universal characterization, is cited to *The K-book*, Proposition II.7.5; that proposition is the Euler characteristic of a bounded complex in a subcategory closed under kernels of surjections (weibel-kbook line 7407). The descent uses the universal property of exact `K₀` for additive functions, Definition II.7.1 with II.6.1.2 (weibel-kbook lines 7145–7156). In §7.4 (line 1497) the left and right numerical quotients are followed by "(Dancso–Licata, Definition 3.2)"; that definition is the right and left dual of a `q`-lattice with a nondegenerate form (dancso-licata lines 409–416) and contains no radical or quotient, as the introduction of Layer 7 itself says. In §0.2 (line 213) "The standard consequences (Bühler, Propositions 2.9 and 2.12)" heads a list whose first and third items are Bühler's Lemma 2.7 and Remark 2.3 (buhler-exact lines 235 and 293).

The smallest repair: in §5.5 cite II.7.1 with II.6.1.2 for the descent (II.7.5 may stay for the vanishing on exact complexes); in §7.4 write "for the distinction between left and right, compare Dancso–Licata, Definition 3.2"; in §0.2 add Lemma 2.7 and Remark 2.3 to the parenthesis.

## Earlier findings

- The previous review had no findings. Its one small correction (AlgebraicKTheory as a consumer) is not repaired: the head is unchanged, and it is C01 above.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / check) | Result | Change |
|---|---|---|---|---|
| §0.2 axioms and pushout criterion (Bühler 2.1, 2.9, 2.12) | square with only the top map an inflation | E2 makes the bottom map an inflation, so 2.12 applies; pinned TFAE assumes `E.IsInflation f` only | holds | C02 (attribution) |
| §0.3 admissible morphisms (Bühler 8.1, 8.4) | inflation `i = i ∘ 1`, deflation `p = 1 ∘ p` | 8.1: admissible epic then admissible monic; 8.4: factorization unique up to unique iso (lines 1207–1246) | supported | none |
| §0.4 conflation-exact functors (Bühler §5) | identity split → canonical on dual numbers | 5.1 definition, 5.2 preserves pushouts along inflations; identity is exact, does not reflect `0→(ε)→A→k→0` | holds | none |
| §0.5 split, abelian, fully exact (Bühler 13.1–13.3) | dual numbers | splitting forces `A ≅ k ⊕ k` with `ε·1 = 0`, but `ε ≠ 0`; 13.3 closed under extensions | holds | none |
| §1.2 presented group (K-book II.6.1.1–6.1.3) | f.d. vector spaces | presentation, universal property, skeletal smallness at lines 6315–6344; free group alone keeps `[k²] ≠ 2[k]` | supported | none |
| §1.4 product of presented groups | `C × D` with biproduct relations | `[(X,Y)] = [(X,0)] + [(0,Y)]`; image of a `C`-relation has second coordinate `(∑nᵢ)[0] = 0` | holds | none |
| §2.2 exact K₀ (K-book II.7.1) | split structure ≤ `E` | II.7.1 at line 7145; `fromSplit` = `ofLE` after identifying split `K₀` with exact `K₀` of the split structure | holds | none |
| §2.4 sign law | `k[1]`, `k[2]` in `Dᵇ(vect)` | `−1`, `+1`; negate-on-every-shift gives `−1` for `k[2]` | Check true | none |
| §2.5 bounded complexes (K-book II.7.5) | `0→Bₙ→Zₙ→Hₙ→0`, `0→Zₙ→Cₙ→Bₙ₋₁→0` | extension-closure gives `Zₙ`, then `Cₙ`, in `P`; II.7.5 uses the same two sequences (lines 7417–7422) | supported | none |
| §3.3 Euler class (proof of II.7.6, Lemma II.7.6.1) | `1⟶2`: `0→P₂→P₁→S₁→0` | `χ(S₁) = [P₁] − [P₂]`; common refinement via diagonal `C→C⊕C`, cone, lines 7456–7481 | supported; source gap below | none |
| §3.7 linear/minimal, Betti series | `1⟶2`; `k[x]/(x²)`; graded dual numbers | `[[1,0],[qt,1]]`; `1 + q²t` (minimal, not linear); `∑qⁿtⁿ`; wrong shift gives `q⁻¹t` | Checks true | none |
| §3.7 converse against `A₀{j}` (BGS 2.14.2) | minimal `P`, semisimple `A₀` | differentials of `Hom(P, A₀{j})` vanish since `A₊·A₀ = 0`; `(Pᵢ/A₊Pᵢ)ⱼ = 0` for `j ≠ i`; BGS (3) at line 1034 | supported | none |
| §4.3 Cartan matrix orientation | `1⟶2`; reversed arrow; transpose | `[[1,0],[1,1]]`; both slips give `[[1,1],[0,1]]`; pin: entry `(i,j)` = paths `j→i` | holds | none |
| Headline 1: resolution theorem, det `±1` | dual numbers; `1⟶2` | V.3.1 hypotheses (line 22950) are §3.2's; `C = [2]` not a unit; `det [[1,0],[1,1]] = 1` | holds, pinned | none |
| Headline 2: `CᵀE = D`, `E = C⁻ᵀD` | `ℝ⊂ℂ`; `1⟶2` | `[1][2] = [2]`; `[[1,1],[0,1]]·[[1,−1],[0,1]] = I`; `C·E = [[1,−1],[1,0]]`; `E_{ij} = (C⁻¹)_{ji} d_j` | holds, pinned | none |
| Headline 3: Lean `gradedCartanMap_bijective` | arbitrary `𝒜`; five one-tactic probes | resolving conditions use no decomposition: syzygies f.g. by induction, kernel a summand; `exact` pinned theorem, `simp_all`, `rfl`, `infer_instance`, `exact?` all fail | true; not padding | none |
| Headline 4: `C(q)·B(q,−1) = I` | `1⟶2`; graded dual numbers; `q⁻ᵈ` convention | `[[1,0],[q,1]]·[[1,0],[−q,1]] = I`; `(1+q)∑(−q)ⁿ = 1`; wrong convention gives `q − q⁻¹`; strand in degree `m` finite | holds | none |
| §5.1 signed sums | degrees `0,1` then `1,2` | `a − b`, `b − a`; reindex by `m` multiplies by `(−1)ᵐ` | Checks true | none |
| §5.3 Euler-admissible pairs | dual-number residue field | pin: `IsExtFinite` and `IsExtBounded` separate fields; `Extⁿ(S,S) = k` all `n`: finite, not bounded | holds | none |
| §5.5 descent locator | K-book II.7.5 vs II.7.1 | II.7.5 is `χ(C•) = ∑(−1)ⁱ[Hᵢ]`; descent needs the universal property of II.7.1 | loose locator | C02 |
| §5.7–5.8 graded comparison | `(S₁,S₂)` on `1⟶2`; two loops, `X = kQ/(xyⁿ)` | `Ext¹_gr(S₁,S₂{j}) = k` iff `j = 1`; `xyⁿ` suffix-free so `Ω` free; `∏_ℕ k` vs `⊕_ℕ k`; `χ_q(S₁,S₂) = −q⁻¹` matches pin | holds | none |
| §6.3 `q`-Euler form (D–L Def. 2.3, footnote to 3.1) | 1-dim `M`; Example 3.3 | `χ_q(M,M{1}) = q`, `χ_q(M{1},M) = q⁻¹`; D–L `⟨L₁,P₁⟩ = (1+q⁻²) − q⁻¹·q = q⁻²` as printed | supported | none |
| §6.4 graded duality | graded `1⟶2` | `C̄ᵀ = [[1,q⁻¹],[0,1]]`, `E = [[1,−q⁻¹],[0,1]]`, product `I` | holds | none |
| §6.5 specialization | `[[1,q],[q,1]]` | det `1 − q²`; `0` at `q = ±1` | Check true | none |
| §7.1 radicals | `x₁y₂` on `ℤ²`; `2xy`; `bar(x)(1−q)y` | left `{x₁=0}`, right `{y₂=0}`; symmetrization has zero radicals; `2xy` zero radicals, not perfect; pin `b.ker`, `b.flip.ker` | Checks true | none |
| §7.2 numerical quotients | `b = 0` on `ℤ`; `f = id`, `g = 0` to `xy` | quotients `0`; `rad_left(0) = ℤ ⊄ 0`; `g` surjective gives `b′(fx, gy) = b(x,y) = 0` for all `y′` | holds, pinned | none |
| §7.4 Euler specialization (D–L Def. 3.2) | text at lines 409–416 | right/left duals of a `q`-lattice; no radical or quotient | supports left/right distinction only | C02 |
| `E₈` orientation | Bourbaki edges shifted by one | `0–2, 2–3, 3–4, 4–5, 5–6, 6–7, 1–3`: the seven listed arrows | holds | none |
| Consumer sentences about AlgebraicKTheory | AlgebraicKTheory README on main | 0 mentions of this roadmap; `TauCeti.SplitK0` used directly | inaccurate | C01 |

- Source locators checked in the cached texts: 27 (buhler-exact 2.1, 2.2–2.8, 2.9, 2.12, 5.1–5.2, 8.1, 8.4, 13.1–13.3; weibel-kbook II.6.1.1–6.1.3, 7.1, 7.5, 7.5.1, 7.6, 7.6.1, 9.15, V.3.1; dancso-licata 2.2, Def. 2.3, Prop. 2.4, Prop. 2.7, Def. 3.1 with footnote, Def. 3.2, Ex. 3.3; bgs-koszul Lemma 2.11.1, Thm 2.11.1, Def. 2.14.1, Prop. 2.14.2).
- Library declarations opened at the Tau Ceti pin: `RepresentationTheory/GrothendieckGroup/CartanMatrix.lean:138–148`, `.../Quiver/CartanMap/Matrix.lean:158`, `Algebra/Homology/EulerCharacteristic/ExtEuler/Basic.lean:121, 174`, `LinearAlgebra/SesquilinearForm/NumericalQuotient/Basic.lean:90, 96, 317`, `RepresentationTheory/Quiver/PathAlgebra/GradedExtEuler/Value.lean:127`, `Algebra/Category/GradedModuleCat/Basic.lean:62`, `.../CartanMap/Basic.lean:108–113`, and the 24 pinned signatures as elaborated.
- Cross-roadmap citations resolved on main: QuiverRepresentations §§0.1, 2.1, 3.1, 3.3, 4.1; ClassicalArithmeticCompletion §7.8; AlgebraicKTheory §§0.1–0.4; KTheoryLowDegrees §1.1; consumers StablePeriodicCurved, ZigzagPreprojective, DGAInfinity, McKaySkewGroup, HopfologicalAlgebra, GeneralAlgebraicKTheory all cite this roadmap.
- Automatic checks: all passed. Dependency check: `depcheck: 194 roadmaps, 2150 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0; the only warning is `sorry` at line 134. `#check @gradedCartanMap_bijective`, `@ExactStructure`, `@ExactStructure.Conflation` compared with the README (§4.5, Convention 13): commutative `k`, arbitrary `𝒜`, the resolution hypothesis; no binder lost, nothing changed.
- One-tactic probe on a copy of the file: five tactics, none closes the target (the pinned theorem needs `DirectSum.Decomposition 𝒜`).
- Description counts confirmed at the head: 25 Checks, 13 conventions, 24 pins, 20 Tau Ceti imports, one `sorry`'d theorem, one declaration removed.

Overlap check: read QuiverRepresentations, DGAInfinity, GeneralAlgebraicKTheory, ArtinAlgebras and HopfologicalAlgebra; QuiverRepresentations §3.3 owns the row-convention Cartan matrix (§4.3 here only compares it with Tau Ceti's column matrix); this roadmap owns exact structures, the resolution theorem, linear resolutions and the numerical quotients (DGAInfinity §10.4 applies them to perfect DG categories; GeneralAlgebraicKTheory consumes Layers 2–3; HopfologicalAlgebra consumes Layer 6); admissible morphisms and the Betti Poincaré series are planned in no other roadmap on main or at an open head. No open pull request changes this roadmap or drops an id it cites.

Source independence: 15 passages compared with 4 sources, none shared beyond forced phrasing (longest run 8 words, the description of Dancso–Licata's Definition 2.3); largest share weibel-kbook, 20 of about 55 locators; contents compared with weibel-kbook Chapter II (§§1–9): independent, since Layers 0 and 3–7 have no counterpart there and Layer 2 takes §§5, 7, 6, 9.15 out of order.

Research link: Layers 5–7 build the graded `K₀`, `q`-Euler form and left/right duals in which Dancso–Licata (2022) realise lattices from Koszul algebras; §§3.7 and 4.5 are the linearity criterion and Hilbert-series identity of Beilinson–Ginzburg–Soergel (1996); Layer 3 is the `K₀` case of Quillen's resolution theorem (Weibel, *K-book* V.3.1). Rests on the README and the three texts read.

## Not verifiable

- Assem–Simson–Skowroński, I.4–5 and III.3.4–3.13 (§§4.4, 4.6, 5.6): paywalled, recorded as uncertified.
- Weibel, *An Introduction to Homological Algebra*, §§1.3, 1.6, 2.4–2.7 and Chapter 4 (Layer 5): paywalled, recorded as uncertified.
- Webb, Proposition 7.4.1 and Corollary 7.4.2 (§§4.2, 5.6): outside the sample, not re-read this round.
- Bühler was read as the arXiv text; its numbering was not compared with the *Expositiones* version the References cite.

Automatic checks set aside as false positives: the listing of `Suggested.lean` declarations reads two docstring words at the start of a line ("instance", "structure") as declarations named `)` and `of`, and so reports a declaration `of` as added; both are prose.

## Source issues

- **Gap** in weibel-kbook at Theorem II.7.6 and its proof, p. 135: the source compares Euler classes in `K₀(P)` by Corollary 7.5.1, which needs `P` closed under kernels of surjections, while hypothesis (b) concerns `C` only; it should assume that closure of `P`, as Theorem V.3.1 does; affects the proof.
- **Misprint** in bgs-koszul at the proof of Lemma 2.11.1, p. 487: the source writes the `(x, y)` entry of a tensor product as a sum over `z` of `[M]_{x,z}[N]_{z,x}`; it should be `[M]_{x,z}[N]_{z,y}`; affects nothing.

## For the human reviewers

- `TauCetiRoadmap/StablePeriodicCurved/Suggested.lean` on main imports this module (line 3). The two non-headline declarations `ExactStructure` and `ExactStructure.Conflation` are kept only for that import between roadmaps, which the import rules for `Suggested.lean` do not allow.
