# Review of FiniteReductiveGroups (pull request #2881 at 5305798)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/FiniteReductiveGroups/`
**Verdict:** accepted

**Summary.** Accepted: the full read found no false statement, no missing hypothesis and no unowned prerequisite; every Check and worked value that could be recomputed by hand was recomputed and agrees, and the Lean statement of the Bessel-type decomposition was confirmed numerically on eight groups. There are seven small corrections (the local type statement 6.5 is kept to residue fields of prime order although its route never uses that; three locators into the formal proof name statements and not their proofs; most targets have no theorem-level locator) and five format notes, none blocking. Left for a human: the status and the licence of the Lean formalisation the family is built around, and the fact that the main published sources could not be read legally from here.

## C01 — The local type statement 6.5 is restricted to residue fields of prime order, but nothing in its route uses the restriction

A reader who needs 6.5 over a residue field `𝔽_q` with `q` not prime is told "for a general finite residue field it is not claimed here" (6.5, lines 2187–2189), and so cannot use it, although the argument written under it proves it. I read the route (lines 2191–2197) step by step: injectivity of the Jacquet map on depth-zero vectors (6.0), the count of members of the supercuspidal support that are unramified twists of `χ` (6.3), the geometric lemma, and the irreducibility of a product with unlinked supports; 6.0, 6.3 and 5.7 are stated for every nonarchimedean local field, and no step mentions `|k|`. The convention under the Conventions ("Statements of the formal proof") allows a wider form to be stated beside the form of the formal proof; 6.5 is the one target where that is not done. It would be enough to state 6.5 for every finite residue field and keep the sentence that the formal proof has it for prime order.

## C02 — Three locators into the formal proof point at a statement, or at a conditional implication, and not at a theorem that proves it

A reader who follows these names to check the proof finds a definition. I opened the cited files in the repository the References give:

- 2.4, lines 598–599: `Formalism.L2.SG.GGMirabolic.MirabolicBound` is `def MirabolicBound : Prop` (`src/Formalism/LocalToGlobal/SiegelLatticeTheory/ClosedLocalOrbits/GGMirabolic.lean`, line 64), and it occurs in that file as a hypothesis (line 120).
- 2.8 (b), lines 827–828: `GlobalTheory.FinGL.MultSharpPf.PlaceBound` is `def PlaceBound : Prop` (`MultSharpOfPlaceBound.lean`, line 14), taken as a hypothesis `(H : PlaceBound)` at lines 116, 145 and 175. The second name cited there, `sum_numBlockSets_mul_gamma_two_sided_bounds`, is a theorem, with the constants of 2.8 (b).
- the docstring of `exists_regular_of_isCuspidal` (`Suggested.lean`, lines 186–188): `GlobalTheory.GLq.Green` is `def Green : Prop` (`LabelDatum.lean`, line 108), and `green_of_regular` (`SumRangeEqRoots.lean`, line 225) derives it from the hypothesis `GreenRegularCharacters`, whose last clause (every cuspidal class function is some `τ θ`) is not among the clauses that `exists_cusp_of_regular` proves (lines 65–70 of its file).

For comparison, 2.2 cites `gelfand_graev_multiplicity_one`, which is a theorem whose type is the statement `GelfandGraevMultOne` (line 962 of its file): that is the right shape. Either cite, for each of the three, the declaration that proves the statement, or write "stated in [FormalProof] as …".

## C03 — Twelve of the fifteen sampled targets have no theorem, section or page of a published source at the claim

The targets 0.3, 0.4, 1.0, 1.4, 2.4, 2.6, 4.1, 4.6, 5.1, 5.2, 5.5 (apart from the `q`-hook formula) and 6.3 are tied to the literature only through the References, which name a work and the layers it serves ("Carter …: Layers 0, 1, 4"), so the statement cannot be checked against a page; the same holds for the general case of the headline 2.2 ("Steinberg, *Lectures on Chevalley groups*; Digne–Michel", line 520) and for 4.5 (b) ("Deligne–Lusztig, §8; Digne–Michel", line 1242). Only 0.5, 4.3 and 4.10 of the sample carry a locator.

Two that I can vouch for, having read the text: 0.5 (a), (b) are Steinberg 1965, Lemma 3.2 and Theorem 3.3 (printed pp. 54–55), and the existence of regular unipotent elements is Theorems 3.1 and 4.6 (pp. 54, 59); the facts of 0.3 on `C_G(s)°` are 2.7 (a), 2.9 and 2.11 of the same paper (p. 53), stated there for semisimple `G`. The others need the author's own locators.

## C04 — LocalGaloisDeformationRings §2.26.2 is listed as a downstream consumer, but it is on main, earlier in the merge order, and says the finite-group calculations are its own

Under Downstream consumers (lines 2231–2233) a reader is told that "the general finite-group part of that construction is 1.2–1.4, 4.2–4.7 and 5.2–5.6", which reads as if that section imported them. LocalGaloisDeformationRings is on main and cannot cite this roadmap, and its §2.26.2 ends: "these finite-group calculations are part of this target" (its README, line 2118), for the degree, sign and restriction identities of the level-zero virtual classes. The general theory (`R_T^G`, 4.4, 4.7) is stated only here, so I do not read this as two owners of one object; but the boundary belongs in Scope and ownership, in one clause saying that §2.26.2 keeps its calculations for the classes it names and that Layer 4 here is the general statement they are instances of.

## C05 — The parenthesis in 6.0, "'if' being used for `F` of characteristic zero", does not say who uses it or whether "if" holds otherwise

In 6.0 (lines 2059–2060) the equivalence "an irreducible `π` has depth zero iff every member of its supercuspidal support does" is followed by this parenthesis, and 6.3 and 6.1 then use the equivalence for every nonarchimedean local field. A reader cannot tell whether the "if" direction is being restricted to characteristic zero. At the supplier, LocalFactorsOfTwistsAndTypes §2.1 (a), the equivalence is stated and routed for every nonarchimedean local field; the parenthesis there describes where the family applies it. Say that here ("both directions hold for every `F`; the family applies 'if' only in characteristic zero"), or drop the parenthesis.

## C06 — The description says every pull request of the family carries the family index "with identical content"; two heads do not

The sentence is "The family index … is carried, with identical content, by every pull request of the family". Of eleven sibling heads compared with this head's `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, nine agree and two differ: the head for HermitianFormsAndLattices lists FrobeniusRestrictedRieszSums at another place in the order (ten lines), and the head for ThetaChainsAndFrobeniusPrimeSums has two reworded sentences in the opening paragraph (seven lines). "…is carried by every pull request of the family; the heads are brought to the same text before the first merges" would be true.

## C07 — The References say the announcement is "Cited at 2.7(b) and 2.8", and it is cited nowhere in the layers

`[Announcement]` occurs only at lines 2504 and 2510, both in the References. I read the announcement: it does not mention the Bessel-type decomposition or the multiplicities. Drop "Cited at 2.7(b) and 2.8", or cite it where it is used.

## N01 — Paths into the formal proof omit the leading `src/`

Every file named in 2.2, 2.4, 2.7, 2.8, 5.11 and the docstrings exists in the repository under `src/` (seventeen files opened); as written the paths do not resolve.

## N02 — "The family follows the formal Lean proof"

This sentence of the family index and of the description says of the family what a roadmap does not say of a source. The layers of this roadmap are organised by the mathematics and map onto no file tree; wording such as "the family plans the mathematics on which that proof rests" would describe it.

## N03 — Forty-five lines of `Suggested.lean` are longer than 100 characters

Mostly in docstrings and in `bessel_pairing_eq`.

## N04 — Several Checks report machine enumerations a reader cannot redo from the text

"By computation" in the Checks of 2.2, 2.4 (d), 2.6, 4.1, 4.5 (d), 4.6 (c), 5.6 (b) and 5.11, the last over a group of order `115 379 712`. Each gives its values, so nothing is wrong; a clause saying what was enumerated and that it is evidence beside the proof, not part of it, would keep a reader from looking for the calculation.

## N05 — In 5.1 the Coxeter torus is "the only rational maximal torus contained in no proper rational Levi subgroup"

Up to `G^F`-conjugacy (line 1506), as in the sentence before it.

## Questions for the author

- Does the formal proof contain theorems of type `MirabolicBound`, `PlaceBound` and `GreenRegularCharacters` (C02)? I opened only the files the README names; the repository is 376 MB and I did not search it.
- 6.5 is "the statement of [FormalProof]" with no file or declaration. Which one? Without it I could not compare the hypotheses (the group `J`, the idempotent condition) with the source.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 0.3 centralisers | `GL₂`: split, elliptic; two factors | `(q−1)²`; `q²−1`; `(q^a−1)(q^b−1) < q^{a+b}−1`, so cyclic of order `q^n−1` forces one factor | holds | locator (C03) |
| 0.4 classes of `GL_n(𝔽_q)` | `n ≤ 4` from the product; `n = 2` families; pairs | `q−1, q²−1, q³−q, q⁴−q`; `(q−1)+½(q−1)(q−2)+(q−1)+½q(q−1) = q²−1`; `½q(q−1)+½(q²+q−2) = q²−1` | holds | none |
| 0.5 regular unipotents | `GL₂`, `a = 0`; `SU₃` | centraliser all of `GL₂`; `q³ − q` regular in `U₀^F`; Steinberg1965 lines 263–269, 281–284 read | holds | locator (C03) |
| 1.0 transitivity | `GL₃`, `Q = P_{(2,1)}` | both sides of degree `(q²+q+1)(q+1)` | holds | none |
| 1.4 Hecke algebras | `GL₂`; `GL₃(𝔽₂)`; `GL₃(𝔽₃)`, `χ³` | `q·1 − 1·q = 0`; `7 + 14 = 21 = 1 + 2·6 + 8`; `13 + 39 = 52`; `(T−1)(T+1)` excluded by `a = q` | holds | none |
| 2.2 multiplicity one | supporting monomials; `GL₂`; dihedral control | `Σ_s C(n−1,s−1)(q−1)^s = (q−1)q^{n−1}`; degrees sum to `(q−1)(q²−1)`; `End = M₂(ℂ)` | holds | locator (C03) |
| 2.4 derivatives | `P₂`; class `(2,1)` of `GL₃`; (d) `d = 1`; `d = 2, q = 2` | `(q−1)+(q−1)² = q(q−1)`; `−(q−1)`; `1, q`; `35 = 5·7 = 28 + 7` | holds | C02 |
| 2.5 convolution bound | `q = 3, 4`; `q = 2, n = 3`; polynomial | `1.785 ≤ 2`, `1.452 ≤ 1.75`; `8/3 > 5/2`; `(1+3x)(1−x−x²) − 1 = x(2−4x−3x²) ≥ 0` on `[0, 1/3]` | holds, `q ≥ 3` needed | none |
| 2.6 Harish-Chandra restriction of `Γ_ψ` | `GL₂`, `L = T`; `SU₃` | `(q−1)² = 2·½(q−1)(q−2) + (q−1)`; `q² − 1 = |T^F|` | holds | none |
| 2.7 (b), `bessel_pairing_eq`, `besselCharacter`, `degenerateCharacter` | Lean identity on unipotent classes, `(n,q) =` (2,2), (2,3), (2,5), (3,2), (3,3), (4,2), (4,3), (5,2), every `k, i`; `ψ₀ = 1` | both sides equal in all cases; with `ψ₀ = 1`, `n = 2`: `χ(1)` against `χ(1) + (q−1)χ(u)` | holds; `ψ₀ ≠ 1` needed | none |
| 2.8 multiplicities | `GL₃, k = 2`; `q = 2, n = 7, k = 3`; (c) | `q²+2q, q², q²−q`; `35+4+14+21 = 74 > 60`; `1 − s/g ≥ 1 − 4sn/g`, `e^x ≤ 1 + 2x` on `[0,1]` | holds; `n ≤ q` needed | C02 |
| 3.1–3.4 Lefschetz numbers | `𝔾_m`; inversion; `ℤ/p` on `𝔸¹`; cusp | `R(∞) = 0`; `L = 2`, one fixed point in characteristic `2`; `L = 1`; `X^t = Spec k̄[x]/(x³)` | holds | none |
| 4.1 Lang torsor, `Y_U` | `F(x,y) = (y², x)`; `SL₂` | `F²` the `2`-Frobenius, `G^F = {(0,0),(1,1)}`; `|X_B(K)| = |K| + 1 − (q+1)` | holds | none |
| 4.3 character formula | `GL₂`, `T_s`: elliptic, central | `θ(z) + θ(z^q)`; `(1−q)θ(a)`; gives 5.2 at `d = 1, n` | holds | none |
| 4.4 inner products | `SL₂(𝔽₂)`, open piece | `(2^k−1)² + N₃·2^k = 4^k + (−2)^k + 1`, `N₃ = 3` or `1`; pairing `[θ′=θ] + [θ′=θ⁻¹]` | holds | none |
| 4.6 Steinberg | `U₃`; `GL₃` sixteen terms; `diag(a,a,b)`; `diag(J₂,b)`; `SL₂³` | `2−1−1+1 = 1` (not `5`); `1`; `3(q+1) − 2(q+2) + 1 = q`; `3−2−2+1 = 0`; `N_∅ − N_S = det w` | holds | locator (C03) |
| 4.7 degree | `GL₂`; second route `n = 2` | `−(q−1)`; `½((q+1) + ε′(q−1)) = 1` forces `ε′ = −1` | holds | none |
| 4.8 exhaustion | regular character at `1` | `|G^F|_{p′}·q^N = |G^F|` | holds | none |
| 4.10 Green functions | `GL₂` | `(Ind_B 1)(u) = 1`, `(1 − St)(u) = 1` | holds | none |
| 4.11 pairing with `Γ_ψ` | `GL₂`, `θ = α∘N`; `Δ` | `⟨Γ, α∘det − α·St⟩ = −1`; `⟨Ind ψ_J, 1⟩ = 1` only for `J = ∅` | holds | none |
| 5.1 tori and labels | `N*_2(2)`, `N*_2(4)`, `N*_2(6)` | `1 ∈ [0, 2]`, `3 ∈ [2, 4]`, `9 ∈ [8, 10.7]` | holds | N05 |
| 5.2, `HasCuspidalValues`, `exists_cuspidal_of_regular` | `GL₂(𝔽₂) ≅ S₃`; `GL₂`, `GL₃` classes; `n = 1`; separation list | `1, −1, 1` = sign; `(q−1)θ(a)`, `−θ(a)`, `−(θ(z)+θ(z^q))`, `−(q−1)θ(a)` at `(2,1)`; `θ`; `(2,6)`: `66 ≥ 63`, `60 < 63` | holds | none |
| 5.5, `exists_regular_of_isCuspidal` | `(n)`, `(1^n)`, `(1)`; `GL₃`, `(2,1)`; `n = 1` | `1`, `q^{n(n−1)/2}`, `ψ_{n−1}(q)`; `q(q+1)`; `θ` itself, injectivity on `Fin 1` trivial | holds | C02 |
| 5.8 weights | `n = 2` totals; share of `(X−a)(X−b)` | `(q−2)/(2(q−1)) + q/(2(q+1)) + q/(q²−1) = 1`; `(q+1)/(q(q−1)²)` both ways | holds | none |
| 5.9 counting | `k₄`; the injection | `q⁴ − q`; `W(A_k) = q^{−k}W` or `q^{−k}(1−q^{−1})W`; `2(q−1)/q ≥ 1` iff `q ≥ 2` | holds | none |
| 5.10 Gauss sums | `n = 2`; `J_σ`; `(2,8)`, `(3,6)` | `(q−1) − (q²−1) = −q(q−1)`, total `−q(q−1)G₂`; `−q⁻¹θ(−1)S_θ(−t)` rederived; `3 ∉ ⟨2⟩` mod `17`, `5 ∉ ⟨3⟩` mod `28` | holds | none |
| 5.11 Shintani descent | `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)`; `q = m = l = 2` | fibres `30, 90, 60` of `180`; `−(4 − 5) = 1`; `deg τ = 5` | holds | none |
| 6.1, 6.2 depth zero | `n = 2`, `q` odd | `(q−1)/2` or `(q+1)/2`; `½(q−1)·(q−1)/2 + ½(q−1)·(q+1)/2 = ½q(q−1)` | holds | none |
| 6.3 labels | unramified principal series; Steinberg of `GL₂(F)` | label `n·{1}`; label `(X−1)²`, no `K`-fixed vector | holds | none |
| 6.0 | supplier §2.1 (a), (d) at its head | (a) stated for every `F`; (d) an isomorphism, injective for smooth `π` | agrees | C05 |
| 6.5 local type statement | `a = b = 1`, `f = {α}`; route | `(χ∘det) ⊗ St` is not an irreducible induction; no step uses `|k|` prime | holds | C01 |

- Source locators checked against the text: Steinberg1965 lines 198–227, 263–269, 281–284, 463 (§§2–4, printed pp. 53–55, 59); 18 declarations of [FormalProof] in 17 files (statements of 2.7 (b), 2.8 (a), (b), 5.2, 5.11 (e) compared with the README).
- Library declarations opened at the pin: 11 by `#check` (`TauCeti.upperUnitriangularGroup`, `TauCeti.ReductiveCommHopfAlgCat`, `TauCeti.FiniteField.rationalPointsMulEquiv`, `TauCeti.UniversalEnvelopingAlgebra.kostantRootSubgroupPoints`, `Matrix.card_GL_field`, `FiniteField.frobeniusAlgHom`, `Rep.ind`, `ArithmeticFunction.moebius`, `GaloisField`, `FDRep.character`, `Representation.IsIrreducible`); `TauCeti.GL2Cuspidal` at `TauCeti/RepresentationTheory/CharacterTable/GL2/Cuspidal/Irreducible.lean` line 333. No cuspidal, Gelfand–Graev or Deligne–Lusztig declaration for `GL_n` at the pinned Tau Ceti.
- Cross-roadmap citations resolved: about 70 sections and named targets in 21 roadmaps, on main or at the open heads (ReductiveGroups 7, 7a–7f, 7C, 9, 9E; EtaleCohomologyFoundations, eleven sections; the three family suppliers at their heads).
- Dependency check: `depcheck: 171 roadmaps, 1994 edges, 0 problem(s)`. The family index lists this roadmap after its three family suppliers.
- Elaboration: `sorry` the only warning (lines 112, 174, 189). The seven elaborated signatures were compared with the README statements; no binder lost. One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp_all`, `aesop`): none closes any of the three theorems.
- Headlines: the Deligne–Lusztig package, Gelfand–Graev multiplicity one and 4.11, Green's parametrisation and weights, 2.7 (a) and 2.8, Shintani descent and Layer 6 are named in the module docstring as not statable, each with its missing carrier; Green's cuspidal characters (two theorems) and the Bessel-type decomposition are stated.
- No change outside the folder other than the three files of the family index.

Overlap check: read LocalFactorsOfTwistsAndTypes, BaseChangeAndGaloisRepresentationsForUnitaryGroups, BesselPoincareSeriesAndGramBounds, TensorInductionAndFiniteGroupInputs (open), SmoothRepresentationsOfLocalGroups, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer (main); the third list is empty. Shared objects: the depth-zero Jacquet comparison, owner LocalFactorsOfTwistsAndTypes §2.1 (imported in 6.0); depth-zero cuspidal types over `F/ℚ_p`, owner SmoothRepresentationsOfLocalGroups SR.5.2 (6.1 is the extension to every local field, said in Scope); tensor induction and characters on a coset, owner TensorInductionAndFiniteGroupInputs §§6.1, 6.2; the Steinberg character for split groups, owner SmoothRepresentationsOfLocalGroupsPartII SRU.4.1 (4.6 is the form for every Steinberg endomorphism, said at 4.6); the finite-group calculations of LocalGaloisDeformationRings §2.26.2 (C04). Nothing else shared; BaseChangeAndGaloisRepresentationsForUnitaryGroups and BesselPoincareSeriesAndGramBounds cite this roadmap by section.

Source independence: 10 passages compared with 2 sources (Steinberg1965, four passages; [FormalProof], six declarations), none shared; largest share [FormalProof], 13 of about 27 exact locators; contents compared with [FormalProof]'s file tree: independent. The table of contents of Deligne–Lusztig 1976 (7 locators) could not be read; by the section numbers the README itself gives, Layer 4 takes its §§1, 4, 6, 8, 7, 7, 5–7, 8, 9, 10 in that order, not one to one.

Research link: Layers 3–5 are Deligne–Lusztig (1976) and Green (1955), with Shintani (1976) in 5.11; Layer 6 is the depth-zero theory of Moy–Prasad (1994, 1996). The family's later roadmaps use them for parameters of depth-zero supercuspidal representations and for theta chains, after Alpöge's formal proof (2026). Rests on the README.

## Not verifiable

- Deligne–Lusztig 1976 (Theorems 4.2, 6.2, 6.8, 9.16, 10.7, Corollary 7.7, §8; sample targets 4.1, 4.3, 4.6, 4.10): the DOI leads to a journal archive page the sources service does not class as open; no other legal copy found.
- Green 1955 (5.2, 5.5): the publisher's page is not in a licence class the service knows.
- Digne–Michel, Carter, Dudas–Michel (0.3, 0.4, 1.0, 2.6, 4.5 (b)), Macdonald (5.5), Zelevinsky LNM 869 and S. I. Gelfand 1970 (2.4, 2.6 (c)): books or articles with no legal copy found.
- Howlett–Lehrer 1980 and Iwahori 1964 (1.4), Solomon 1966 and Curtis 1966 (4.6), Lusztig–Srinivasan 1977 (5.6): paywalled, cited by locator only.
- Moy–Prasad 1994, 1996 (6.3): the DOI is paywalled and the open archive page returned an index, not the article.
- Shintani 1976 (5.11), Kondo 1963 (5.10): the open-archive landing pages gave no PDF link.
- Whether [FormalProof] proves the three statements of C02, and where it states 6.5: not searched beyond the cited files.

## Source issues

- none

## For the human reviewers

- **Scope.** The family is built around a Lean formalisation announced on 20 November 2026 ([FormalProof]); its repository's README says it "claims" the proof, with verification still to be run. This roadmap's headlines are published (Deligne–Lusztig 1976, Green 1955).
- **Scope.** Only 2.7 (b), (c), 2.8, the lower bound of 5.8 (c), the form of 5.11 (e) and 6.5 have [FormalProof] as their sole source (README References, lines 2503–2509).
- **Licence.** The repository's README states that the submission "was published without a license" and is mirrored for verification only; the README and `Suggested.lean` cite its declarations by path and name.
- **Licence.** `besselCharacter`, `degenerateCharacter`, `IsCuspidal` encode the objects of its `symEdge` (`src/Formalism/LocalToGlobal/Divisibility/DefGroup.lean` line 217), `cutEdge` and `IsCuspidal`, with other binders and bodies; only the name `IsCuspidal` is shared.
- **Not tested.** The wording and the arrangement were compared only with Steinberg 1965 and the cited files of [FormalProof]; Deligne–Lusztig 1976, Green 1955 and Digne–Michel could not be read.
