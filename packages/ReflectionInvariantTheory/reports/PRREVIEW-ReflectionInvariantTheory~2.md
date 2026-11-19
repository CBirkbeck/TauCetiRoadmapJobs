# Review of ReflectionInvariantTheory (pull request #2539 at 80547df)

**Verdict:** needs changes

**Summary.** Changes are needed for one P2 finding. §3.2 claims that the open dominant chamber of a real crystallographic root pairing is a chamber of §3.1. That is false whenever the roots do not span `M`: for `A₁` in `ℝ²` the dominant chamber is a half-plane, which §3.1's own Check rules out as a chamber, and §3.8 uses §3.2 in exactly this case for `U(n)`. All earlier findings are repaired or deferred, the README's 40 source locators match their texts, and the eleven `Suggested.lean` theorems are true as stated and elaborate with `sorry` as the only warning. There are four small corrections and one format note, none blocking: unnamed inputs in the routes of §1.2 and §2.3, a Steinberg 1964 citation for a formula that paper does not state, statements narrower than their sources, and two scope sentences that contradict §2.4. The human reviewers have two facts to note, on licences and on later Tau Ceti proofs.

## R01 (P2) — §3.2 claims that the open dominant chamber is a chamber of §3.1, which is false whenever the roots do not span `M`

An implementer who proves §3.2 as written is asked to prove something false for the root pairings with fixed directions that the roadmap keeps in scope: Convention 7, §4.7 and §3.7–§3.8 for `U(n)`. §3.1 takes chambers inside `E = (V^W)^⊥` (lines 407–408). Its third Check (lines 433–435) says that in `V` the half-planes containing `V^W` are not chambers. §3.2 (lines 439–443) lets `P` be any finite reduced crystallographic root pairing over `ℝ` and asks for a proof "that the open dominant chamber is a chamber of §3.1, with walls the kernels of the simple coroots". Tau Ceti's `openDominantChamber` is a subset of `M`, cut out by `0 < P.coroot' i x` for the simple `i` (`LinearAlgebra/RootSystem/Chamber.lean`, line 144). It therefore contains `V^W`, the common kernel of the coroots.

Take `A₁` in `M = ℝ²`, with roots `±e₁` and coroots `±2e₁*`. Then `W = {1, s}`, `V^W = ℝe₂` and `E = ℝe₁`. The open dominant chamber is the half-plane `x₁ > 0`, while the chambers of §3.1 are the two open half-lines of `E`. The case is used downstream: §3.8 uses §3.2 to identify the Bruhat length with `ℓ_C` for every compact connected `G`, including `U(2)`, whose roots do not span `X*(T) ⊗ ℝ`. So restricting §3.2 to spanning roots would not do. The smallest change is to the clause itself: "that the open dominant chamber meets `E` in a chamber of §3.1, whose walls are the kernels of the simple coroots in `E`, and is the sum of that chamber and `V^W`".

## C01 — Two proof routes rest on inputs that their *Needs:* lines do not supply

In §1.2 (lines 155–158) the route says that `θ` is a homogeneous system of parameters of `S`, "which is therefore free over `K[θ]`". That is Macaulay's theorem for the polynomial ring, which Smith 1997, p. 220, invokes at this step. It is the trivial-group case of §1.2 itself, and none of the listed inputs supplies it. The graded Nakayama lemma named there, `TauCeti.GradedAlgebra.adjoin_eq_top_of_irrelevant_le`, is about generating an algebra, not about a graded projective module being free. The pinned Tau Ceti has the local pieces: `TauCeti.IsRegularLocalRing.isCohenMacaulay` (`RingTheory/RegularLocalRing/CohenMacaulay.lean`, line 125) and `TauCeti.IsRegularLocalRing.free_of_isCohenMacaulay` (`RingTheory/RegularLocalRing/Free.lean`, line 93). One repair is to name them together with the passage from graded to local. Another is to make "a polynomial ring is free over every homogeneous system of parameters" a step of the route.

In §2.3 (lines 291–294) the route gets `2g − 2 = −d − m` from the tame form of the Hurwitz formula, in which the different is replaced by `Σ (e_P − 1)`. `TauCeti.hurwitz_genus_formula` is the form with `deg Diff`. The tame form is `TauCeti.two_mul_genus_sub_two_eq_iff_forall_isTame` (`FieldTheory/FunctionField/Different/Hurwitz.lean`, line 120), and it could be added to the *Needs:* line.

## C02 — Steinberg 1964 is cited for the Jacobian formula of §2.2, which it does not state

Line 254 cites "Steinberg 1964, Theorem 1.4 and Lemma 3.1, pp. 393–396" beside Stanley's Proposition 4.8 for `J = c · ∏ ℓ_H^(e_H − 1)`. In Steinberg 1964, Theorem 1.4(a) identifies the product `Π` of the `R_h^(e(h)−1)` as the polynomial of the harmonic characterisation 1.3(c). Lemma 3.1 shows that `Π` is skew and divides every skew polynomial (Steinberg1964 lines 79–82 and 170–183). The paper never mentions the Jacobian. Stanley's Proposition 4.8 supports the statement on its own. Either drop the Steinberg citation or attach it to the step it gives: the Jacobian is skew, so Lemma 3.1 makes `Π` divide it.

## C03 — Several statements are narrower than the sources they cite and the routes they give

- §§3.5–3.6 and `prod_degrees_eq_card`, `poincareSeries_coinvariants_eq_prod` and `exists_linearEquiv_coinvariants_monoidAlgebra` work over `ℝ`. Stanley 1979, Corollaries 4.4 and 4.10 (pp. 487, 489), which the README cites, prove `∏ dᵢ = |G|` and the regular representation for every finite `G ⊂ GL(V)` over `ℂ` with polynomial invariants. The routes given do not use the reals: `Representation.finrank_quotient_symmetricAlgebraHilbertIdeal_dual_of_pseudoreflectionSubgroup_eq_top` needs only `|G|` invertible (`RepresentationTheory/SymmetricAlgebra/Free.lean`, lines 276–298). The Examples of Layer 2 already use `∏ dᵢ = |G|` for `G(m, 1, n)` (line 392), but no target states it for a complex group.
- §4.5's height partition and `card_height_eq_card_degrees` assume `P` irreducible. Macdonald 1972, Corollary (2.7), p. 164, assumes only a reduced root system. The identity holds as stated for `A₁ × A₂`: three roots of height 1 and one of height 2, against exponents `1, 1, 2`. It also holds with fixed directions, whose exponents are `0`.
- §2.5's completed local comparison assumes `K` algebraically closed of characteristic zero. SGA 1, Exp. V, Proposition 2.2(i), assumes only a finite group acting on a scheme that is finite over its locally Noetherian quotient, which `Spec Sym(V*)` is in every characteristic.

Would you state these in the generality of their sources, keeping the real, irreducible or characteristic-zero forms as Checks? Or say in one clause why the narrower form is kept?

## C04 — Two sentences under "Not in this roadmap" contradict §2.4 and Convention 5

Line 976 says that "no finite group is claimed to have a polynomial invariant ring unless it is generated by pseudoreflections". But §2.4 states the nonfaithful form `ρ.pseudoreflectionSubgroup ⊔ ρ.ker = ⊤`, and its Check claims `A = K[x]` for `ℤ/2` acting trivially on `K`, which has no pseudoreflection. Line 977 says that "'polynomial' always comes with homogeneous generators and their degrees". But Convention 5, §2.4 ("homogeneous or not", line 311) and `shephard_todd_target` allow any bijective `MvPolynomial.aeval f`. The first sentence would be right as "unless its image `ρ(G)` is generated by pseudoreflections". The second would be right if dropped, or if reworded to say that a graded invariant ring that is a polynomial algebra has homogeneous generators (§2.4).

## N01 — In §5.3 (line 879), "the one interchanging the two ends" reads as a single exchanging automorphism of type `D_r`

For odd `r` there are four, as the Check on `D₅` (line 895) says; "those interchanging the two ends" would match it.

## Earlier findings

- R01 — repaired: each sampled target cites a locator at the claim, for example "(Fogarty 2001, §2, p. 6)" in §1.1 and "(Steinberg 1964, Theorem 1.5, p. 394, …)" in §2.5.
- R02 — repaired: "homogeneous invariants of positive degree, as many as the Krull dimension `n` of `A`" (lines 150–151), with the trivial-group Check (lines 174–176).
- R03 — repaired: "`J = (x − y)(x − z)(y − z)` (both sides are `−2` at `(0, 1, 2)`)" (line 278).
- C01 — not repaired: deferred (D01).
- C02 — repaired: "`K` need not embed in `ℝ`, so pass through `ℚ`", with `RootPairing.restrictScalarsRat` (lines 627–634); it is also in the *Needs:* line of §4.4 (line 704).
- C03 — repaired: `CoxeterSystem.bipartiteCoxeterElement_recolorOfEquiv_boolNot` is cited (lines 851, 855).
- C04 — repaired: "`char K ≠ 2`" (line 240) and "`K` containing `m` distinct `m`-th roots of unity" (line 245).
- C05 — withdrawn: the project fixes the title of this series of pull requests.
- N01 — repaired: "The statement assumes that `P.weylGroup` is finite" (lines 625–627).
- Question on Steinberg's stabilizer theorem as a headline — settled: the Summary does not list it among the headline theorems, so its absence from `Suggested.lean` is consistent.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 Noether bound | `μₘ` on `K`; Fogarty (2)–(3) | `A = K[xᵐ]`, bound `m` attained; `Ψ_S = (∏_{γ∉S} f_γ)·Tr(∏_{γ∈S} γf_γ)`, an invariant of degree `|S|` as factor | true | none |
| §1.2 Hochster–Eagon (sample) | `{±1}` on `K²`, `θ = (x², y²)`; trivial `G`, `θ = (x, x²)`; Smith Thm 1.6 | basis `1, xy`, Hilb `(1+t²)/(1−t²)²`; two members against `n = 1`, `x²` zero on `K[x]/(x)` | true | C01 (route) |
| §2.1 `IsBasicInvariants` | `S₃` with `e` and `p`; `fᵢ = 0`; char 2 sign changes | degrees `{1,2,3}` both; `Xᵢ ↦ 0` breaks injectivity, so `dᵢ ≥ 1`; char 2 gives `(x, y)` | definition right | none |
| §2.2 Jacobian | `S₃` at `(0,1,2)`; `μₘ`; Steinberg 1964 | `det = −2`, `(x−y)(x−z)(y−z) = −2`; `J = m x^(m−1)`; the word Jacobian absent from Steinberg 1964 | true | C02 |
| §2.3 étale covers (sample) | `n = 1` Hurwitz; SGA 1 XIII 2.12, genus 0, one point | `2g − 2 = −d − m ≥ −2` forces `d = m = 1`; tame `π₁` generated by `σ₁` with `σ₁ = 1` | true | C01 (route) |
| §2.4, `shephard_todd_target` | `ℤ/2` trivial on `K`; `{±1}` on `K²`; `μₘ` | `⊥ ⊔ ker = ⊤`, `K[x]` polynomial; both sides false (Hilbert series); both sides true | true | C04 |
| §2.5 (sample) | `S₃` at `(1,1,2)`; `ℤ/2 × ℤ/2`, one factor trivial, at `1`; `μ₂` at `1`; SGA 1 V 2.2(i) | `⟨(1 2)⟩`; stabilizer is the kernel, no pseudoreflection; `K⟦x²−1⟧ ≅ K⟦x−1⟧`; SGA needs no characteristic | true; faithfulness needed | C03 |
| §3.1 chambers | `I₂(m)`; `S₃` on its plane; `{1, s}` on `ℝ²` | sector `π/m`, rotation `2π/m`; 6 chambers, `ℓ(w₀) = 3`; two half-lines in `E` | true | none |
| §3.2 (sample) | `A₁` in `ℝ²`, roots `±e₁`; `U(2)` via §3.8 | open dominant chamber `x₁ > 0`, a half-plane; chambers of §3.1 are half-lines of `ℝe₁` | false | R01 |
| §3.3 (sample) | `Sₙ` on `ℝⁿ`; trivial group on `ℝⁿ` | one degree `1` against `dim V^W = 1`; `n` degrees `1` against `dim V^W = n` | true | none |
| §3.4 (sample) | `{±1}` on `ℝ`; Steinberg 1964 Thm 1.2(c) | `∂(x²)xᵏ = k(k−1)x^(k−2)`, so `𝓗 = span(1, x)`; `S = ℝ[x²] ⊕ ℝ[x²]x` | true | none |
| §3.5, `poincareSeries_coinvariants_eq_prod` | `S₃`; nonfaithful `{±1} × ℤ/2` on `ℝ` | `(1+t)(1+t+t²) = 1+2t+2t²+t³`, lengths `1,2,2,1`; `1 + t` with `d = 2` | true without faithfulness | C03 |
| §3.6, `prod_degrees_eq_card`, `sum_degrees_eq_add_card_reflections` (sample) | `S₃`, `I₂(m)`, `H₃`, `H₄`, `V = 0` | `6 = 6`, `6 = 3 + 3`; `2m`, `m + 2`; `120`; `14400`; `∏∅ = 1 = |1|`, `0 = 0 + 0` | true | C03 |
| `exists_linearEquiv_coinvariants_monoidAlgebra` | `{±1}` on `ℝ`; `𝔽₂` swap (excluded by `ℝ`) | `C = 1 ⊕ x` = trivial ⊕ sign = `ℝ[ℤ/2]`; `𝔽₂[x]/(x²)` with trivial action, not `𝔽₂[S₂]` | true | C03 |
| §3.8 (sample) | `SU(2)`, `U(2)`, `SU(3)`; Bott B′ 2° | `1 + q²`; `(1−q²)(1−q⁴)/(1−q²)² = 1 + q²`, wrong normalisation `1 − q⁴`; `1+2q²+2q⁴+q⁶` | true | none |
| `poincarePolynomial_weylCoxeterSystem_eq_prod`, §4.1 | `A₃`; `A₁` in `ℝ²`; empty `ι` | `[1,2,2,1]∗[1,1,1,1] = [1,3,5,6,5,3,1]`; degrees `1, 2` give `1 + t`; `1 = 1` | true | none |
| `IsCoxeterElement`, §4.2 (sample) | `A₂` | `s₁s₂`, `s₂s₁` conjugate by `s₁`, order 3; `[1, 1, 2]` fails `Nodup` | definition right | none |
| `charpoly_coxeterElement_eq_prod`, §4.3 | `A₁`, `A₂`, `B₂` | `X + 1 = X − e^(πi)`; trace `−1`, det `1` give `X² + X + 1`; `±i` give `X² + 1` | true | none |
| `card_eq_card_support_mul_orderOf`, §4.4 (sample) | `E₈`, `A₁`, `G₂`; inversions of `c` | `240 = 8·30`; `2 = 1·2`; `12 = 2·6`; `c(s_r⋯s_(i+1)αᵢ) = −s₁⋯s_(i−1)αᵢ` | true | none |
| `height_highestRoot_add_one_eq_orderOf` | `G₂`, `B₂`, `A₁` | `5 + 1 = 6`; `3 + 1 = 4`; `1 + 1 = 2` | true | none |
| `card_height_eq_card_degrees`, §4.5 (sample) | `G₂`; `B₂`; reducible `A₁ × A₂` | `j = 1, 5, 6`: `2, 1, 0` both sides; `2, 1, 1` both; `3, 1` both | true; irreducibility unused | C03 |
| `exists_degree_eq_of_coprime`, §4.6 (sample) | `E₈`; `H₃`; `A₁ × A₂` | units mod 30 are the 8 exponents; `3, 7` missing for `H₃`; `5` missing for `A₁ × A₂` | true for irreducible Weyl groups only | none |
| §4.7 (sample) | `A₁ × A₂` | `|Φ| = 8`, `r = 3`, `8/3`; order `lcm(2, 3) = 6`; exponents `1; 1, 2` | true | none |
| §4.8 (sample) | `𝔰𝔩₂`; supplier hypotheses | Killing form, degree 2 = degree of `A₁`; restriction `x²` up to a scalar; char 0, closed, `IsKilling` | true | none |
| §5.1 (sample) | `U(2)`, `SU(3)`; Stanley p. 489 | degrees `1, 2` → `2, 4` → `1, 3`; degrees `2, 3`; `deg aᵢ = i` | true | none |
| §5.3 affine diagrams | `Ã₃`, `D̃₄`, `D̃₅`, `C̃₃`, `C̃₂` | 4 of 8 preserve; all 24 preserve; 4 of 8 exchange; `i ↦ r − i` changes parity iff `r` odd | true | N01 |
| Scope, lines 976–977 | `ℤ/2` trivial on `K`; right side of `shephard_todd_target` | `A = K[x]` with no pseudoreflection; any bijective `aeval f` | contradicted by §2.4 | C04 |

- Source locators checked against the text: all 40 in the README — Stanley1979 11, Steinberg1959 7, Springer1974 6, Macdonald1972 5, Steinberg1964 4, Fogarty2001 3, SGA1 2, Smith1997 1, Bott1956 1. Theorem, page and hypotheses match; the one exception is the Steinberg 1964 citation for the Jacobian (C02).
- Library declarations opened at the pins: 25. Tau Ceti: `Hurwitz.lean:72,107,120,160`, `Unramified.lean:42`, `Jacobian.lean:88`, `SymmetricAlgebra/Free.lean:276,295`, `RegularLocalRing.lean:61`, `OrbitSeparation.lean:100`, `TrivialSummand.lean:174`, `HighestRoot.lean:94`, `Chamber.lean:141,144`, `Weyl/Chamber.lean:168,302`, `GradedAlgebra/Nakayama.lean:60`, `RegularLocalRing/CohenMacaulay.lean:125`, `RegularLocalRing/Free.lean:93`, `MiracleFlatness.lean:72`, `DualCoxeterNumber.lean:86`, `Coxeter/Poincare.lean:87`. Mathlib: `RootSystem/BaseChange.lean:132`, `WeylGroup.lean:62,132`.
- Cross-roadmap citations resolved on main (1b7b481): PurityOfBranchLocus §2.2 (lines 200–207); RootSystems §2.1, §3.2, §§3.3–3.5, §6.1 and Layer 4; LieGroups Layers 5A, 6 and 8 (Schubert cells, CW structure and cohomology, line 1081); CharacteristicClasses C5.1–C5.3, C5a.2 and C5a.7; LieHighestWeight Layer 7. The only name found nowhere at the pins, `Scheme.Hom.etale_of_etaleAt_codimOne`, is PurityOfBranchLocus's proposed name for its §2.2.
- Automatic checks: all passed; none set aside. Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives eleven `declaration uses 'sorry'` warnings and nothing else. `#check @` of all 13 declarations, run on a scratch copy, matches the README statements; no binder is lost.
- Padding: on a scratch copy, `first | simp | rfl | infer_instance | aesop` in place of each `sorry` closed none of the eleven theorems. No pinned declaration states any of them: the Tau Ceti degree identities and the converse of Shephard–Todd come after the pin.
- Ownership searched by object across main and the open heads (Shephard–Todd, basic invariants, coinvariant algebra, Coxeter element, Coxeter number): other roadmaps (IntegralLattices, KloostermanSheavesAndBesselIsocrystals, HeckeStacksAndLocalShtukasPartII) consume Coxeter numbers or define twisted Coxeter elements; none owns these objects.

Overlap check: read RootSystems, LieHighestWeight and RootSystemsPartII (main), OrthogonalTamagawaAndLatticeMass and PseudolineArrangementsAndOrientedMatroids (open), and ZigzagPreprojective (main, which RootSystems names as the owner of affine diagrams). The shared objects and their owners:
- the Coxeter presentation of Weyl groups and the finite Coxeter classification: RootSystems and Tau Ceti, cited here;
- the chambers of general finite real reflection groups: this roadmap, as RootSystems line 57 agrees;
- Chevalley restriction and orbit separation: Tau Ceti, cited here and consumed by LieHighestWeight Layer 7;
- `|W| = ∏ dᵢ` and the degree table: this roadmap, cited by OrthogonalTamagawaAndLatticeMass (README line 528);
- simply-laced affine diagrams: ZigzagPreprojective Layer 0 on Tau Ceti's `TauCeti.AffineDynkinType`, while the two-colourings of §5.3 and their automorphisms belong to this roadmap;
- oriented matroids: PseudolineArrangementsAndOrientedMatroids, not used here;
- RootSystemsPartII: nothing shared.

Source independence: 22 passages compared with 9 sources (Stanley1979, Smith1997, Fogarty2001, Springer1974, Steinberg1959, Steinberg1964, Macdonald1972, Bott1956, SGA1); none shared beyond forced terms ("splits the inclusion", "reflections in the walls"). The largest share is Stanley1979, 11 of 40 locators. Contents compared with Stanley1979 (§§1–10): independent. Layer 1 draws on parts of its §§2–3 and Layer 2 on part of its §4; Layers 3–5 have no counterpart there. The degree table of Layer 4 is classification data in the generic arrangement, not a source's table.

Research link: Layer 2 is the Chevalley–Shephard–Todd theorem (Shephard–Todd 1954; Chevalley 1955), with Steinberg's fixed-point theorem (Steinberg 1964, Thm 1.5). Layer 4 is the Coxeter-element and exponent theory of Coleman 1958, Kostant 1959, Steinberg 1959 and Springer 1974, which CharacteristicClasses C5a.7 consumes for the rational cohomology of compact Lie groups. This rests on the README's References and on the sources read.

## Not verifiable

- Fleischmann 2000 (uncertified): the README cites it only through Fogarty 2001, p. 5, which records it; not read.
- Bourbaki 2002 (uncertified), Hochster–Eagon 1971, Shephard–Todd 1954, Chevalley 1955, Serre 1967, Kostant 1959, Coleman 1958, Humphreys 1990, Kane 2001 and Smith 1995: these are in the References with no locator in the README, and were not fetched.

## Source issues

- none

## For the human reviewers

- Licence: Springer 1974 and Macdonald 1972 were read as OCR of open GDZ scans; Stanley 1979, Smith 1997, Steinberg 1959, Steinberg 1964 and Fogarty 2001 from the free AMS back issues; Bott 1956 from Numdam; SGA 1 from arXiv math/0206203.
- `STATUS.md` in this folder (generated, not changed by this pull request) reports Tau Ceti proofs after the pinned commit 2fd255d: both Shephard–Todd directions, `∏ dᵢ = |G|`, the regular representation and the Jacobian formula. Several `Suggested.lean` statements will then be library theorems.
