# Review of StablePeriodicCurved (pull request #2668 at abb27d9)

**Verdict:** needs changes

**Summary.** The verdict is needs changes, for two false sentences. Neither touches a headline. First, the eventual-periodicity target of §4.5 identifies the tail of a periodic resolution with the unfolding of its compression; the compression of §4.1 sums infinitely many terms there and is defined only for bounded complexes. Second, the curved DG algebra example of §5.5 holds only for an element of degree one, not for every odd element. The nine statements in `Suggested.lean` elaborate. They match their sources: Buchweitz Theorem 4.4.1, Stai Lemma 3.12 and Theorem 4.3, Positselski Theorems 7.8–7.9 and Eisenbud. There are also six small corrections (locators, two headlines the pin nearly proves, one interface gap, one dropped name another roadmap cites) and one format note. Nothing is left for a human to decide.

## R01 (P2) — The §4.5 target and two examples identify a periodic resolution with the unfolding of its "compression", which is false for the compression this roadmap defines

An implementer cannot prove the first target of §4.5 as written. It asks to "prove that its tail beyond `p` is the unfolding … of the `m`-periodic complex obtained by compressing it" (line 872). Compression is defined in §4.1 (line 733), and at the pin (`TauCeti.PeriodicComplex.compressionFunctor`), only for bounded complexes: `(Δ_m X)^r` is the finite sum of the `X^i` with `i ≡ r`. The tail is unbounded. Summing over residue classes anyway puts infinitely many copies of each `P_i` in every degree. Take `k[x]/(x²)` and the resolution of `k` (period one). The tail is `⋯ → A → A → A`, and its compression is `⊕_(j ≥ 0) A` with differential `x`. The unfolding of that has an infinite sum in every degree, so it is not the tail. Even with the right periodic complex, `TauCeti.PeriodicComplex.unfoldFunctor` (`Algebra/Homology/Periodic/Unfold.lean:52`) gives a complex unbounded in both directions. The tail is only its truncation.

The same slip is in the Examples of Layer 4 (line 905, "whose compression to a two-periodic complex is the reduction of the matrix factorization"). In §8.2 (line 1391) the minimal resolution of `M_i` is called the unfolding of `powerXPeriodicComplex`, when it is the augmented truncation of that unfolding. A repair would say: "its tail beyond `p` is the truncation, in degrees at least `p`, of the unfolding of the `m`-periodic complex formed by one period `P_p, …, P_(p+m-1)` and the differentials between them". In the two examples, "whose compression" would become "which is the truncation of the unfolding of".

## R02 (P2) — The first example of §5.5 holds only for an element of degree one, not for every odd element

The example (line 1031) says that for "an odd element `b` of a graded algebra, `d = [b, -]` and `w = -b²` form a curved DG algebra". Convention 3 makes "odd" mean odd degree. The definition of §5.1 needs `d` of degree one and `w ∈ A²`. For `|b| = 3`, `d = [b, -]` has degree three and `w = -b²` lies in `A⁶`, so the pair is not a curved DG algebra. The displayed computation `d²(a) = [b², a]` and `d(w) = 0` is correct for every odd `b`. Replacing "an odd element" by "an element of degree one" makes the sentence true.

## C01 — Several locators point to a section that does not contain the cited result

- §1.3 (line 339) cites Bühler §§7, 10–13 for exact structures on idempotent completions. They are Bühler §6, Proposition 6.13 (p. 22); §7 is about weak idempotent completeness.
- §2.4 (line 456) cites Buchweitz §4 for the singularity category. It is defined in Buchweitz's Definition 1.2.2 (p. 8 of the manuscript).
- §7.4 (line 1244) cites Eisenbud §5 and Theorem 6.1 for the minimality clause. The bijection between reduced matrix factorizations and maximal Cohen–Macaulay modules without free summands is Eisenbud's Corollary 6.3 (p. 55).
- §5.3 (line 969) cites Positselski's Definitions 7.4–7.6 for curved modules. Those define the three acyclic classes; the modules are in §6.2 (pp. 33–34).
- §4.2 (line 767) cites Keller's *On triangulated orbit categories* with no locator. The orbit category and its universal property are in §1; the DG orbit category is §5.1.

## C02 — §2.2 cites Buchweitz §4 for definitions that section neither gives nor needs

The sentence "These definitions need no noetherian hypothesis; the theorems below state the noetherian hypotheses they use (Buchweitz, §4)" (line 394) points at a section that does the opposite. Buchweitz §4 opens (p. 13) by assuming the ring is two-sided noetherian with finite self-injective dimension. It defines maximal Cohen–Macaulay modules by vanishing of `Ext` (Definition 4.2.1, p. 14). His complete resolutions are in §3.1 (Definition 3.1.1, p. 10): acyclic complexes of finitely generated projectives with the given cokernel, with no condition on `Hom(-, S)`. That condition is automatic over an Iwanaga–Gorenstein ring. Citing §3.1 with that remark would fix this, as would citing a source that defines totally acyclic complexes over an arbitrary ring.

## C03 — Stai's numbered results are stated for differential modules; the general period is in the remarks after them

In the arXiv text (1510.03574v1), Proposition 3.10, Lemma 3.12 and Theorem 4.3 are stated and proved for `n = 1` (`D₁(mod Λ)`, `D^b(mod Λ)/Σ`). The general period is asserted, with the proofs left to the reader, in the remark closing §3.4 (p. 15) and the remarks after Lemma 3.12 (p. 16) and Theorem 4.3 (p. 18). §§4.3–4.4 and the docstrings of `stai_orbitDerivedCompressionFunctor_full_faithful`, `stai_eq_top_of_essImage_le` and `stai_projective_isEquivalence` cite the numbered results for every `n ≥ 1`. "Lemma 3.12 and the remark following it", and likewise for the others, would say what the source states. The README cites the Mathematical Research Letters version, which could not be read; if its numbering or scope differs, cite that version's.

## C04 — Two headline statements are proved at the pin up to a short assembly

`stai_projective_isEquivalence` is the pinned `TauCeti.PeriodicComplex.DerivedCategory.isEquivalence_ι_comp_Qh` (`Algebra/Homology/Periodic/ProjectiveReplacement.lean:99`) for `C = FGModuleCat Λᵐᵒᵖ`. In a copy of the file, `refine isEquivalence_ι_comp_Qh _ n (d + 1) fun X ↦ ?_` elaborates. What remains is that every finitely generated right module has projective dimension `< d + 1` in `FGModuleCat`, a transfer of the bound from `ModuleCat`.

`eisenbud_isEquivalence` is likewise the README's own route through three pinned results. Full faithfulness is `fullyFaithfulQuotientGorensteinProjectiveStableCokernel` (`CommutativeAlgebra/MatrixFactorization/Cokernel/FullyFaithful.lean:282`). The cokernel criterion is `exists_quotientCokernel_iso_iff_hasProjectiveDimensionLE_of_isNoetherianRing` (`CommutativeAlgebra/MatrixFactorization/Cokernel/Resolution.lean:282`). The bound `pd_S ≤ 1` is `hasProjectiveDimensionLE_restrictScalars_quotient_of_isRegularLocalRing` (`Algebra/Homology/GorensteinProjective/Hypersurface.lean:87`).

As acceptance tests the two ask an implementer for little. The docstrings could say so: one is the module-category case of the pinned equivalence, the other the regular-local assembly. Alternatively, `stai_projective_isEquivalence` could state the triangle-equivalence form that §4.3 also asks for and the pin lacks.

## C05 — A predicate that HermitianKTheoryOfPoincareCategories cites is no longer declared, and the README does not name what replaces it

HermitianKTheoryOfPoincareCategories on main (README line 71) uses "StablePeriodicCurved Layer 4, `HasFiniteGlobalDimension`" as its uniform bound. The rewritten `Suggested.lean` no longer declares that predicate. The bullet in Scope and ownership (line 1546) gives the replacement, `TauCeti.globalDimension Λᵐᵒᵖ ≤ d`, but not the old name, so that roadmap cannot find it. One clause would let it follow: "the predicate `HasFiniteGlobalDimension` that other roadmaps cite is this bound".

## C06 — The composite functor of §7.5 and §8.1 does not type-check through §2.3 as stated

§7.5 builds Orlov's functor from three pieces: the cokernel functor, the equivalence of §2.3, and the functor of §2.5. The cokernel functor lands in the stable category of `TauCeti.GorensteinProjectiveModuleCat (S ⧸ (w))`. §2.3 compares `TauCeti.GorensteinProjectiveModuleCat Rᵐᵒᵖ` with Gorenstein-projective objects of `FGModuleCat Rᵐᵒᵖ`. No choice of `R` turns `Rᵐᵒᵖ` into `S ⧸ (w)` itself, so the middle step needs either §2.3 for left modules or the identification of a commutative ring with its opposite. No section owns either. A sentence in §2.3 stating the comparison for left modules too, or for commutative `R` through `R ≃ Rᵐᵒᵖ`, would close the gap. It is also what the module docstring gives as the reason Orlov's theorem is not statable.

## N01 — `Suggested.lean` calls the degree-zero functor "Chen's functor", but the README never mentions Chen

The docstrings at lines 25 and 62 follow the pin, which credits X.-W. Chen (Math. Nachr. 284, 2011). Either add Chen to the References or describe the functor without the name.

## Questions for the author

- Does the published Mathematical Research Letters version of Stai number Proposition 3.10, Lemma 3.12 and Theorem 4.3 as arXiv v1 does, and does it state them for general `n`? Only the arXiv text could be read.

## Verified sound

| Statement | Instances tried | Values computed (source / roadmap) | Result | Change |
|---|---|---|---|---|
| §0.1 morphism-ideal quotient (sample) | zero ideal; ideal of all maps | quotient by 0 is `C`; by all maps every object is zero; pin `MorphismIdeal` is additive subgroups, two-sided | sound | none |
| §0.2 factoring ideal (sample) | `Vect_k`, `P` = lines | `id_{k²} = e₁+e₂` lies in the ideal; rank 2 > 1, so it factors through no single line; pin needs `Nonempty` and closure under binary products (FactorThrough.lean:119) | sound | none |
| §1.2 stable functors (sample) | identity functor; split structure | stable categories zero; `IsFrobeniusSubcategory` fields (FullSubcategory.lean:54) match the prose; Happel unreadable | sound | none |
| §1.3 idempotent completion (sample) | `C` idempotent complete | maps through a retract of `P` factor through `P`, so the ideals agree; Bühler Prop 6.13, p. 22, is §6 | locator | C01 |
| §2.2 total acyclicity (sample) | `ℤ/2` over `ℤ`; padding by `F → F` in degrees 1, 2 | not torsion free, so not a cycle module; `Z⁰` unchanged; Buchweitz Def 3.1.1 has no Hom condition | locator | C02 |
| §3.1 differential modules (sample) | `(k[t]/t², d = t)` | Λ indecomposable, so one parity piece is 0, forcing `d = 0 ≠ t`; Stai §3.1 p. 8; ABI §1 | sound | none |
| §3.4 periodic derived category (sample) | `ℤ/4 ⇄ ℤ/4` by 2 | ker = im = `2ℤ/4`; `dh+hd = 2c₀+2c₁ ≠ 1`; Keller 1990 §4.1 acyclic complexes in an exact category | sound | none |
| §4.2 orbit category (sample) | `D^b(k)`, `n ≠ 0` and `n = 0` | `End(k) = k`, against `⊕_ℤ k` when `n = 0`; Keller §1 composition matches | locator | C01 |
| §5.1 curved DG algebra (sample) | `d = 0`, `w = 0`, `|a| = 1` | `(d^a)²x = a²x − xa²` gives `w' = −a²`; Positselski `h' = h+d(a)+a²` with `w = −h` gives `w − d(a) − a²` | sound | none |
| §5.1 Bianchi target | `d³a` computed two ways | `(−1)^{|a|} a d(w) = d(w) a`; graded-central for odd `d(w)` | sound | none |
| §6.2 acyclic classes (sample) | `A = k` | totalizations contractible, so all classes are zero objects; Positselski Defs 7.4–7.6 p. 64; Tot = cone(cone(f) → M) | sound | none |
| §6.3 second-kind categories (sample) | `A = k` | `D^co = D^ctr = Hot`; Positselski §7.6 defines Verdier quotients | sound | none |
| §7.3 Frobenius description (sample) | `(1, w)`, `(w, 1)` | homotopies `h₁ = 1, h₀ = 0` and the swap give identity; FKS §4 stable categories | sound | none |
| §7.5 Orlov (sample) | `w = 0`; `S = k[x]`, `w = xⁿ` | `(S → 0)` has only zero homotopy and `D_sg(X) = 0`; `t ↦ 0` not flat; `t ↦ xⁿ` free with basis `1,…,x^{n−1}`; Orlov Prop 3.3 p. 18, Thm 3.9 p. 21 | sound | C06 |
| §7.6 MCM = G-proj (sample) | `k⟦x,y⟧/(xy)` | `R/(x)` depth 1 = dim; residue field depth 0; Buchweitz Thm 4.1.1 injdim = Krull dim, Def 4.2.1 remark | sound | none |
| §7.7 base change (sample) | `xⁿ` over `k[x]` | Eisenbud Prop 5.1 p. 49: `x` nzd gives periodic resolution of Coker; pin `toPeriodicComplex` needs `f w = 0` | sound | none |
| `buchweitz_isEquivalence` | `ℤ/4`; `k[x,y]/(x,y)²` | one indecomposable `ℤ/2`, End `𝔽₂`; `dim Ext¹(k,R) = 4−3+2 = 3`, so Gproj = free while `D_sg ≠ 0`; Buchweitz Thm 4.4.1 p. 16 | sound | none |
| `stai_orbitDerivedCompressionFunctor_full_faithful` | `Λ = k`; `k[t]/t²` | Homs `⊕_j Hom(V, W[nj])` on both sides; infinite gldim excluded by `hΛ`; Stai L3.12 p. 16 | sound | C03 |
| `stai_eq_top_of_essImage_le` | `Λ = k` | Stai Thm 4.3: hull generated by `(P, 0)` is all of `D₁` | sound | C03 |
| `stai_projective_isEquivalence` | dual numbers | `(Λ, t)` nonzero in `K₁(proj)`, zero in `D₁`; pin `isEquivalence_ι_comp_Qh` reduces it to a pd transfer | true, thin | C04 |
| `positselski_7_8a` | `A = k`, `e = 0` | all classes zero; Thm 7.8(a) p. 64; left gldim of `Aᵒᵖ` = right gldim of `A` | sound | none |
| `positselski_7_8b` | degree conditions | `Aⁿ = 0` for `n > 0`, or `n < 0` with `A⁰` semisimple and `A¹ = 0`: matches 7.8(b) p. 65; `w = 0` literal | sound | none |
| `positselski_7_9a/b` | (∗), (∗∗) | each countable sum finite ⇔ one bound `e` (direct summand of a countable sum of sums); Thm 7.9 p. 66 | sound | none |
| `eisenbud_isEquivalence` | `w ∈ 𝔪∖𝔪²`; `k⟦x⟧`, `xⁿ` | `R` regular, HMF zero; `(xⁱ, x^{n−i}) ↦ A/(xⁱ)`, `n−1` objects; three pinned pieces | true, thin | C04 |
| Keller–Vossieck (not statable) | split structure | both sides 0; no exact-category `D^b` at the pin (search); KV Ex. 2.3 OCR partly legible | sound | none |
| Eisenbud periodicity (not statable) | `k[x]/x²`, `k[x]/x³`, `k⟦x,y⟧/(xy)` | periods 1, 2 (`x, x²`), 2 (`x, y`); Thm 6.1 p. 52: period 2 after `d+1` steps | sound | R01 |
| §4.5 tail target | `k[x]/x²`, resolution of `k` | compression of the tail gives `⊕_{j≥0} A` per degree, not `A`; unfolding unbounded both ways | false | R01 |
| §5.5 example | `|b| = 3` vs `|b| = 1` | `d` of degree 3 and `w ∈ A⁶`, against degree 1 and `A²` | false for `|b| ≠ 1` | R02 |
| §8.2 stable dimensions | `n = 3`, `i = j = 2` | Hom dim 2, through `A` dim 1, stable 1 = `min(2,2,1,1)` | sound | none |
| §7.2 dual | `(xⁱ, x^{n−i})` | dual `(x^{n−i}, −xⁱ)`, composite `−xⁿ`; unsigned transpose has `+xⁿ` | sound | none |
| §0.4 exterior algebra | `λ` = coefficient of `xy` | `λ(xy) = 1`, `λ(yx) = −1`; `λ(y·ν(x)) = λ(−yx) = 1`; pin `φ(b·νa) = φ(ab)` | sound | none |
| §5.4 combining Check | `(m⊗n)(w_A⊗1)` | `(−1)^{|n||w_A|} m w_A ⊗ n = m w_A ⊗ n`, since `w_A` is even | sound | none |

- Source locators checked against the text: about 34 (Stai 8, Positselski 8, Buchweitz 6, Eisenbud 4, Bühler 3, Orlov 2, FKS 2, Keller 1990 1, Keller 2005 1, ABI 1, Keller–Vossieck 1).
- Library declarations opened at the pins: over 30 Tau Ceti (for example `ProjectiveReplacement.lean:99`, `Compression/Derived.lean:191`, `IwanagaGorenstein.lean:48`, `GlobalDimension.lean:70`, `Curved/Algebra/Defs.lean:73`, `Curved/Module/Right/Acyclic.lean:103–205`, `Frobenius/Basic.lean:304–322`) and Mathlib `DerivedCategory.Bounded` (`DerivedCategory/TStructure.lean:204`).
- Cross-roadmap citations resolved on main: GrothendieckEulerForms §§0.2, 0.4; DGAInfinity Layers 0, 1, 5; HopfologicalAlgebra §§4.1, 4.2; ZigzagPreprojective §2.1. All are present.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 9 `sorry` warnings only. The elaborated signatures of all 12 declarations were compared with the README; no binder was lost.
- One-tactic probes on a copy of the file: `infer_instance` fails for `buchweitz_isEquivalence`, `eisenbud_isEquivalence` and the Stai full-faithfulness statement. `stai_projective_isEquivalence` reduces through `isEquivalence_ι_comp_Qh` to a projective-dimension bound.
- Overlap check: read HopfologicalAlgebra, DGAInfinity, ArtinAlgebras, McKaySkewGroup, GrothendieckEulerForms and GorensteinHomologicalAlgebra. Morphism-ideal quotients and Frobenius stable categories are owned by StablePeriodicCurved Layers 0–1, and HopfologicalAlgebra, ArtinAlgebras and McKaySkewGroup cite them that way. Exact structures belong to GrothendieckEulerForms and DG conventions and the pretriangulated envelope to DGAInfinity; both are cited here. Gorenstein-projective modules are pinned Tau Ceti and consumed here. McKaySkewGroup's algebra-valued duplexes are distinct from the scalar duplexes here.
- Source independence: 46 passages compared (34 at verified locators, 12 more from §§0.4, 3.3, 4.2, 5.5, 6.2, 7.2, 7.4, 8.4 and the `Suggested.lean` docstrings) with 11 sources. Nothing is shared beyond forced formulas and standard names. The largest shares are Stai and Positselski, 8 of about 46 locators each. Compared with their contents, the layers are independent: Layers 3–4 split and merge Stai §§3.1–3.5 and add Keller and Eisenbud, and Layers 5–6 use only Positselski §6.2 and §7.6.
- Research link: the headline targets are the comparison theorems of Eisenbud (1980), Buchweitz (1986), Orlov (2004), Positselski (2011; survey 2023) and Stai (2018). Singularity categories and matrix factorizations are the categories of B-branes in Landau–Ginzburg models (Orlov 2004 §3). This rests on the README's References and the sources read.

## Not verifiable

- Happel, *Triangulated Categories in the Representation Theory of Finite Dimensional Algebras*, Chapter I §2, Theorem I.2.6 (§§1.1, 1.2, 2.1): the book is behind the Cambridge paywall and no legal open copy was found.
- Stai, the Mathematical Research Letters version: the publisher's PDF is on a host of unknown licence class, so arXiv 1510.03574v1 was read instead (C03).
- Keller–Vossieck, Example 2.3: read only through OCR of the scan on Keller's page. The statement is partly legible and consistent with §2.7.

## Source issues

- none

## For the human reviewers

- none
