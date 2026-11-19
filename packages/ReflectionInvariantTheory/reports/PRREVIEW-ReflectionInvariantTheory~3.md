# Review of ReflectionInvariantTheory (pull request #2539 at 4a4d440)

**Verdict:** needs changes

**Summary.** One P2 finding blocks acceptance. Convention 7 defines "irreducible" as Mathlib's `P.IsIrreducible`, and that class also admits a pairing on a line with no roots. For that pairing `h = |Φ|/r` is `0/0`, and §4.4's claim that the exponents lie in `[1, h − 1]` is false. `Suggested.lean` already excludes the case with `[Nonempty ι]`, but the README does not. All six findings of the previous review are repaired, and the deferred anchor finding stands. The sampled locators match their texts, and the eleven theorems elaborate with `sorry` as the only warning. There are two small corrections, neither blocking: Convention 8's scope sentence leaves out §2.1, and the route of §4.5 rests on Macdonald's product formula, which nothing here provides. The human reviewers have two facts to note: where the sources were read, and later Tau Ceti proofs.

## R01 (P2) — Convention 7 takes "irreducible" to be Mathlib's `P.IsIrreducible`, which admits a pairing with no roots, and §4.4 is false for it

§4.4 asks an implementer to prove two things for every pairing that Convention 7 calls irreducible. The first is that `h = |Φ|/r` is the order of every Coxeter element. The second is that the exponents "lie in `[1, h − 1]`" (lines 732–736). The overview defines `h` the same way (lines 20–22), and Convention 7 fixes "irreducible" as `P.IsIrreducible` (lines 81–83).

Mathlib's `RootPairing.IsIrreducible` (`LinearAlgebra/RootSystem/Irreducible.lean`, line 148) asks only that `M` and `N` be nontrivial and that `M` and `N` have no proper nonzero invariant submodule. It therefore holds for the pairing with `ι` empty and `M = N = K`. Mathlib needs `[Nonempty ι]` as a separate hypothesis before an irreducible pairing becomes a root system (same file, line 203).

Take that pairing, with the base of empty support:
- `W = 1`, `r = 0` and `|Φ| = 0`;
- the only Coxeter element is the empty product `1`, of order `1`;
- `S^W = K[x]` has one basic invariant, of degree `1`, so the one exponent is `0`.

So `|Φ|/r` is `0/0`, and `0` does not lie in `[1, ord(c) − 1] = ∅`. §4.5's "the highest root has height `h − 1`" (lines 757–759) has no root to refer to.

`Suggested.lean` excludes this case already. Its four irreducible theorems carry `[Nonempty ι]`, and their docstrings say "with at least one root" (lines 150–153, 160–163, 184–189, 198–203). The README never says so, so the README and the Lean file state these results in different generality. The smallest change is in Convention 7, line 81: "'Irreducible' is `P.IsIrreducible` with `ι` nonempty". If you want, the rootless pairing on a line could also become a Check of §4.4.

## C01 — Convention 8 says that nothing beyond Layer 1 and §2.5 is asserted in modular characteristic, but §2.1 holds over every field

Convention 8 (lines 86–89) lists what the roadmap asserts in characteristic dividing `|G|` and adds "and nothing else". The list is the invariant ring, its grading, integrality, finite generation and the completed local comparison of §2.5. Line 224, however, says that §2.1 also holds over every field. For finite `G`, the API of §2.1 asserts `Hilb(A, t) = ∏ (1 − t^dᵢ)⁻¹` and that the degree multiset is intrinsic, in any characteristic. Three passages also exhibit polynomial invariant rings with `|G| = 0` in `K`: the Check of §2.1 in characteristic `2` (line 253), the modular Example of Layer 1 (lines 196–198) and the last Check of §2.5 (lines 397–400). A reader looking up what holds in modular characteristic would miss §2.1. The sentence becomes true if you add "the definition and API of systems of basic invariants (§2.1)" to its list.

## C02 — The route of §4.5 rests on Macdonald's product formula, which no layer, supplier or pinned declaration provides

The route for the height partition (lines 759–763) compares §4.1 with Macdonald's product formula `Σ_w t^ℓ(w) = ∏_(α ∈ Φ⁺) (1 − t^(ht(α)+1))/(1 − t^ht(α))`. That formula is Macdonald 1972, Theorem (2.4) specialised in Corollary (2.5), p. 164, and Macdonald proves it through a separate polynomial identity. It is not a target here, and no supplier states it. The pinned `TauCeti/GroupTheory/Coxeter/Poincare.lean` has only the definition (line 87) and elementary facts: rank zero and one, the values at `±1`, the degree and the leading coefficient. The *Needs:* line (line 769) lists only §4.1, §4.4, the height and the highest root.

The type-by-type alternative has the same gap. It rests on the degree table of Layer 4's Examples, which lines 859–860 say is no substitute for proofs, and on the classification (`TauCeti.existsUnique_dynkinType`, RootSystems §§3.3–3.5), which the *Needs:* line also omits. Either of two changes would close the gap:
- state the product formula as a step of §4.5, with its locator, and add it to the *Needs:* line;
- list the classification and per-type inputs for the type-by-type route in the *Needs:* line.

## Questions for the author

- The module docstring of `Suggested.lean` lists as not statable the length identity `Hilb(C, t) = Σ_w t^ℓ(w)` for a general finite real reflection group. Its reason is that the pins have no chambers and no Coxeter system on `W`. Was a definition of `ℓ` as the number of reflecting hyperplanes separating a regular vector `x` from `w x` considered? §3.1 proves that count equal to `ℓ_C`, and it needs only a short definition. I did not write that statement in Lean. If the Coxeter length itself is meant, the docstring's reason stands.

## Earlier findings

- R01 — repaired: §3.2 now says that the open dominant chamber "is the sum of `M^W`, the common kernel of the coroots, and its intersection with `E = (M^W)^⊥`". It also says "that this intersection is a chamber of §3.1" (lines 463–466). The `A₁`-in-`ℝ²` Check has been added (lines 477–479).
- C01 — repaired: §1.2 now proves first "that `S` is free over `K[θ]` (Macaulay's theorem …)" through `TauCeti.IsRegularLocalRing.isCohenMacaulay`, `free_of_isCohenMacaulay` and graded Nakayama for modules (lines 160–164, 174–176). §2.3 uses `TauCeti.two_mul_genus_sub_two_eq_iff_forall_isTame` (lines 302–303, 311).
- C02 — repaired: the Jacobian now cites "Stanley 1979, Proposition 4.8, p. 488, with the product defined on the same page", and the Steinberg 1964 citation is gone (lines 265–266).
- C03 — repaired, all three parts:
  - §§3.5–3.6 and their Lean statements now work over any field of characteristic zero for pseudoreflection groups (lines 531–532, 566–568);
  - §4.5 and `card_height_eq_card_degrees` cover every reduced crystallographic pairing with finite Weyl group (lines 754–757);
  - §2.5's comparison now reads "Let `K` be any field" (line 366).
- C04 — repaired: "unless its image `ρ(G)` is generated by pseudoreflections" (lines 1022–1024), and the sentence about homogeneous generators is gone.
- N01 — repaired: "those interchanging the two ends" (line 925).

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 Noether bound | `μₘ` on `K`; `{±1}` on `K²`; Fogarty p. 6 | `A = K[xᵐ]`, bound `m` attained; generators in degree `2 ≤ 2`; `mᵍ ⊂ J` when `g` invertible | true | none |
| §1.2 Hochster–Eagon | `{±1}` on `K²`, `θ = (x², y²)`; trivial `G`, `(x, x²)`; Smith Thm 1.6 | basis `1, xy`, Hilb `(1+t²)/(1−t²)²`; `x²` zero on `K[x]/(x)`; Smith p. 220 nonmodular | true | none |
| §2.1 `IsBasicInvariants` | `S₃` with `e` and `p`; `fᵢ` constant; `V = 0` | degrees `{1,2,3}` both; `Xᵢ − c ↦ 0` kills injectivity, so `dᵢ ≥ 1`; empty family, `A = K` | definition right | none |
| §2.2 Jacobian | `S₃` at `(0,1,2)`; `μₘ`; `μ₃` | `det = −2 = (x−y)(x−z)(y−z)`; `J = m x^(m−1)`; `d − 1 = 2` pseudoreflections, one hyperplane | true | none |
| §2.3 étale covers | `n = 1` Hurwitz; Artin–Schreier; `𝔸ⁿ_ℂ → 𝔸ⁿ_ℝ` | `2g−2 = −d−m ≥ −2` forces `d = m = 1`; degree `p` étale in char `p`; degree `2` over `ℝ` | true | none |
| §2.4, `shephard_todd_target` | `{±1}` on `K²`; `ℤ/2` trivial on `K`; `μₘ` | both sides false (Hilbert series); `K[x]` with `⊥ ⊔ ker = ⊤`; both true | true | none |
| §2.5 comparison, any field | `S₂` swap on `𝔽₂²` at `(1,0)` and `0`; `μ₂` at `1`; SGA 1 V 2.2(i) | `𝔽₂⟦s−1, p⟧`; `𝔽₂⟦x+y, xy⟧ = 𝔽₂⟦x,y⟧^S₂`; `K⟦x²−1⟧ ≅ K⟦x−1⟧`; SGA needs only Noetherian, finite | true | none |
| §3.2 dominant chamber | `A₁` in `ℝ²`; `A₂` | `D = {x₁>0} = ℝe₂ + {x₁>0}∩ℝe₁`; `E = ℝe₁` = root span; `ℓ(w₀) = 3` | true | none |
| §3.3 | `Sₙ` on `ℝⁿ`; trivial group on `ℝⁿ` | one degree `1` = `dim V^W`; `n` degrees `1` | true | none |
| §3.4 | `{±1}` on `ℝ` | `∂(x²)` kills `1, x`; `𝓗 = span(1,x)`; `S = ℝ[x²] ⊕ ℝ[x²]x` | true | none |
| §3.5, `poincareSeries_coinvariants_eq_prod` | `S₃`; nonfaithful `ℤ/2×ℤ/2` on `ℝ`; `{±1}` | `1+2t+2t²+t³`, lengths `1,2,2,1`; `1+t` with `d = 2`; `1−t = (1−t²)/(1+t)` | true without faithfulness | none |
| §3.6, `prod_degrees_eq_card`, `sum_degrees_eq_add_card_reflections` | `S₃`; `I₂(m)`; `μₘ` on `ℚ(ζₘ)`; `V = 0` | `6=6`, `6=3+3`; `2m`, `m+2`; `m=m`, `m=1+(m−1)`; `1=1`, `0=0+0` | true | none |
| `exists_linearEquiv_coinvariants_monoidAlgebra` | `{±1}` on `ℝ`; `𝔽₂` swap (excluded by `CharZero`) | `C` = trivial ⊕ sign = `ℝ[ℤ/2]`; `𝔽₂[x]/(x²)` trivial action, not `𝔽₂[S₂]` | true | none |
| §3.7 | `S¹`; `U(2)`, `SU(2)` | `ℚ[t]` in degree 1; weights `(1,2)`: `1/((1−t)(1−t²))`, standard grading `1/(1−t)²` | true | none |
| §4.1, `poincarePolynomial_weylCoxeterSystem_eq_prod` | `A₃`; `B₂`; `A₁` in `ℝ²` | `[1,3,5,6,5,3,1]`; `1+2t+2t²+2t³+t⁴`; degrees `1,2` give `1+t` | true | none |
| §4.2 `IsCoxeterElement` | `A₂`; empty `ι` | `s₁s₂`, `s₂s₁` conjugate by `s₁`, order 3; `[1,1,2]` fails `Nodup`; `c = 1` | definition right | none |
| §4.3, `charpoly_coxeterElement_eq_prod` | `A₁`; `A₂`; `B₂` | `X+1`; `X²+X+1`; `X²+1` from `±i` | true | none |
| §4.4, `card_eq_card_support_mul_orderOf`, Convention 7 | `E₈`; `A₁`; `ι` empty, `M = K`, `IsIrreducible` | `240 = 8·30`; `2 = 1·2`; `|Φ|/r = 0/0`, `ord(c) = 1`, exponent `0 ∉ [1,0]` | Lean true; README §4.4 false without roots | R01 |
| `height_highestRoot_add_one_eq_orderOf` | `G₂`; `B₂`; `A₁` | `5+1 = 6`; `3+1 = 4`; `1+1 = 2`; empty `ι` excluded by `[Nonempty ι]` | true | none |
| §4.5, `card_height_eq_card_degrees` | `G₂`; `A₁ × A₂`; `A₁` in `ℝ²` | `2,1,1,1,1` against exponents `1,5`; `3,1` against `1;1,2`; one root of height `1`, exponents `0,1` | true | C02 (route) |
| §4.6, `exists_degree_eq_of_coprime` | `E₈`; `H₃`; `I₂(5)` | units mod 30 are the 8 exponents; `3, 7` missing; `2, 3` missing | true for Weyl groups | none |
| §4.7 | `A₁ × A₂` | `|Φ| = 8`, `r = 3`; order `lcm(2,3) = 6`; `5` prime to `6`, not an exponent | true | none |
| §5.2 | `S₃`; `D₄` | `(1 2)(2 3) = (1 2 3)`, inverse `(1 3 2)`; `h(D₄) = 6` | true | none |
| §5.3 | `Ã₁`, `Ã₃`, `D̃₄`, `D̃₅`, `C̃₂`, `C̃₃` | swap exchanges; 4 of 8 preserve; all 24 preserve; 4 of 8 exchange; `i ↦ r−i` flips parity iff `r` odd | true | none |
| Convention 8 against §2.1 | §2.1 API in char `p`; modular Example | `Hilb(A) = ∏(1−t^dᵢ)⁻¹` in every characteristic; `𝔽₂[x+y, xy]` polynomial with `|G| = 0` | omits §2.1 | C01 |

- Source locators checked against the text, for the sample and the passages the repair touched: Fogarty2001 §2 pp. 5–7 (lines 25–26, 47–135); Smith1997 Thm 1.6 and pp. 219–220 (lines 423–465); Stanley1979 p. 481, Prop. 3.1, Thm 3.2, Lemma 3.3, Thm 4.1, Cor. 4.4, Prop. 4.8, Prop. 4.9, Cor. 4.10 (lines 299–362, 498–650); Steinberg1959 §1, Lemmas 2.2–2.3, 4.1, Thm 4.2, Cor. 4.3, Thm 6.3, Thm 8.4 (lines 14–65, 179–206, 314–319, 415–416); Steinberg1964 Thms 1.2, 1.3, 1.5 (lines 46–103); Springer1974 Prop. 2.3, Prop. 4.1, Thm 4.2, p. 171, Prop. 4.7 (OCR); Macdonald1972 §2.1, (2.2), (2.5)–(2.7) (OCR, lines 117–191); Bott1956 Thm B′ 2° (lines 37–91); SGA1 V 2.2(i) (lines 3816–3848) and XIII 2.12 (lines 11447–11463). Each theorem number, page, set of hypotheses and statement matches.
- Library declarations opened at the pins: 19 in all. Mathlib: `Irreducible.lean:148,203`, `Base.lean:68`, `AsTensorProduct.lean:378`, `Maschke.lean:159`, `BaseChange.lean:132`. Tau Ceti: `HighestRoot.lean:94`, `GradedModule/Nakayama.lean:94,131`, `RegularLocalRing/CohenMacaulay.lean:125`, `RegularLocalRing/Free.lean:93`, `Hurwitz.lean:120`, `SymmetricAlgebra/Free.lean:82,151,285,295`, `Weyl/Group.lean:470,476`, `Coxeter/Poincare.lean:87`. No pinned declaration states any of the eleven theorems; the named results that `STATUS.md` reports are after the pin.
- Cross-roadmap citations resolved on main (1b7b481):
  - PurityOfBranchLocus §2.2 (lines 198–243; `etale_of_etaleAt_codimOne` is declared in its `Suggested.lean`, line 92);
  - RootSystems §2.1, §3.2, §§3.3–3.5, Layer 4 and §6.1;
  - LieGroups Layers 5A, 6 and 8;
  - CharacteristicClasses C5.1–C5.3, C5a.2 and C5a.7;
  - LieHighestWeight Layer 7.

  The open OrthogonalTamagawaAndLatticeMass head cites §3 and §4 here (README line 528); both still resolve.
- Automatic checks: all passed; none set aside. Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives eleven `declaration uses 'sorry'` warnings and nothing else. Running `#check @` on all 13 declarations in a copy of the file matched the README statements, and no binder was lost; the 13 include the two definitions.
- Padding probe: replacing each `sorry` with `first | rfl | simp | infer_instance | aesop` in a copy of the file closed none of the eleven theorems.
- Previous review's findings: six repaired, one deferred and still standing (D01).

Overlap check: I read OrthogonalTamagawaAndLatticeMass (open), and RootSystems, LieHighestWeight and RootSystemsPartII (main); the results-and-headings list was empty. I also searched every open head for Shephard–Todd, coinvariant algebra, basic invariants, Coxeter element and Coxeter number. Shared objects and their owners:
- the Weyl Coxeter presentation and the finite Coxeter classification belong to RootSystems and Tau Ceti, cited here;
- the chambers of general real reflection groups, the degrees and the exponents belong to this roadmap, as RootSystems line 57 agrees;
- orbit separation and Chevalley restriction belong to Tau Ceti; LieHighestWeight Layer 7 consumes them;
- `|W| = ∏ dᵢ` and the degree table belong to this roadmap; OrthogonalTamagawaAndLatticeMass line 528 cites them;
- RootSystemsPartII shares nothing.

Other open heads (IntegralLattices, KloostermanSheavesAndBesselIsocrystals, HeckeStacksAndLocalShtukasPartII, SmoothRepresentationsOfLocalGroupsPartII) consume Coxeter numbers or elements; none owns them.

Source independence: 36 locators read beside their claims and 12 further prose passages (routes of §§1.1, 1.2, 2.5, 4.3, 4.4; definitions in §§1.2, 3.1, 3.4; statements of §§3.8, 4.5; two docstrings) compared with 9 sources (Stanley1979, Smith1997, Fogarty2001, Springer1974, Steinberg1959, Steinberg1964, Macdonald1972, Bott1956, SGA1). None share more than forced terms ("splits the inclusion of", "reflections in the walls"). The route of §1.2 follows the standard proof of Smith 1997, Thm 1.6, in the roadmap's own words, with its own proof of the Macaulay step. The largest share is Stanley1979, 11 of 40 locators. Contents compared with Stanley1979 (§§1–10): independent. Layer 1 draws on parts of its §§2–3 and Layer 2 on part of its §4; Layers 3–5 have no counterpart there. The degree table of Layer 4 is classification data in the generic layout, not a source's table.

Research link: Layer 2 is the Chevalley–Shephard–Todd theorem (Shephard–Todd 1954; Chevalley 1955), with Steinberg's stabilizer theorem (Steinberg 1964, Thm 1.5). Layer 4 is the Coxeter-element and exponent theory of Coleman 1958, Kostant 1959, Steinberg 1959 and Springer 1974, which CharacteristicClasses C5a.7 uses for the rational cohomology of compact Lie groups. This rests on the README's References and on the sources read.

## Not verifiable

- Fleischmann 2000 (uncertified): cited only through Fogarty 2001, p. 5, which records it; not read.
- Bourbaki 2002 (uncertified), Hochster–Eagon 1971, Shephard–Todd 1954, Chevalley 1955, Serre 1967, Kostant 1959, Coleman 1958, Humphreys 1990, Kane 2001 and Smith 1995: listed in the References with no locator in the README; not fetched.

## Source issues

- none

## For the human reviewers

- Licence: Springer 1974 and Macdonald 1972 were read as OCR of open GDZ scans. Stanley 1979, Smith 1997, Steinberg 1959, Steinberg 1964 and Fogarty 2001 came from the free AMS back issues, Bott 1956 from Numdam and SGA 1 from arXiv math/0206203.
- `STATUS.md` in this folder (generated; this pull request does not change it) reports Tau Ceti proofs after the pinned commit 2fd255d. They cover both Shephard–Todd directions, `∏ dᵢ = |G|`, the regular representation and the Jacobian formula. Several `Suggested.lean` statements will then be library theorems.
