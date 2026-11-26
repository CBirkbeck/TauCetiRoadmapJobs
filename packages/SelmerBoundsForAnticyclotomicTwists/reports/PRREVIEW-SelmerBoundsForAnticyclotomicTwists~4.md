# Review of SelmerBoundsForAnticyclotomicTwists (pull request #3160 at 8c6c8b8)
Folder: `TauCetiRoadmap/ShortGRH/SelmerBoundsForAnticyclotomicTwists/`
**Verdict:** needs changes

**Summary.** Needs changes. Every sampled statement matches the formal proof it cites, and none of the statements I tested is false. All five findings are structural. There is no `Suggested.lean`, so the targeted build fails. Supply runs both ways with CongruencesOfTwistedThetaLifts. The sixteen `ShortGRH background` prerequisites have no owner, although roadmaps on main own most of them. SelmerLengthBoundsAndLocalLifting on main already owns twist selection and the local bounds, and this roadmap neither cites those sections nor says how its own versions differ. The sections reproduce the formal proof's file division. There are six small corrections and one format note. The human reviewers have two questions to decide: the scope (the main source is an unrefereed formal proof) and that source's licence (Apache 2.0).

## R01 (P1) — The folder has no `Suggested.lean`, so the roadmap has no acceptance test and its module does not build

Without the file, the build has no target for this roadmap, and nothing records which of its headline theorems can be stated at the pins and which cannot. The folder holds only `README.md`. `lake build TauCetiRoadmap.ShortGRH.SelmerBoundsForAnticyclotomicTwists.Suggested` fails with the module's file not found. The pull request's description lists the file under "Still to come".

Add `Suggested.lean` with the single `import Mathlib`, the namespace, and a module docstring. The docstring should name the two headline theorems: the twisting theorem (5.4, general form 2.7) and the defect of the dual of a summand above `ℓ` (4.6, through 3.6 and 3.7). For each it should say which carrier is missing at the pins: neither library has crystalline cocycles over a period ring, Hecke `L`-values of characters of `U(1)`, or the data of OneSidedPrimeSumBoundsAndAdmissibleData §3.2. A file that states nothing, with its docstring saying why, is acceptable.

## R02 (P1) — Supply runs both ways between this roadmap and CongruencesOfTwistedThetaLifts

Because of this, neither roadmap can come before the other in the merge order, and neither can be built as the other's supplier.

- This roadmap's 4.1 (line 969), 4.8 (line 1159), 5.1 (line 1190) and 5.4 (line 1291) need CongruencesOfTwistedThetaLifts §§1.1, 1.2, 1.3, 1.5, 3.1 (2) and 4.1.
- That roadmap's §1.1 (its line 225), §1.3 (line 314), §6.1 (line 1194), §6.2 (line 1227) and §7.3 (line 1506) need this roadmap's §§3.1, 4.1, 4.6–4.8 and 5.4, and its supplier contracts (line 1554) list this roadmap.

The sections are acyclic; the roadmaps are not. Every roadmap must take its material only from roadmaps placed before it in the merge order, so that each can be built and merged after its suppliers; the mechanical check of that rule finds no problem here only because neither member is in the merge order yet, so it cannot see the loop.

The same loop closes through two other members. This roadmap takes its set-up from DeterminantsOfThetaLiftChains §1.1 and OneSidedPrimeSumBoundsAndAdmissibleData §§2.1–3.4. In turn, Determinants §6.2 (its line 1360) needs Congruences §7.3, and OneSided §6.1 needs Determinants §6.3.

The fix is to move ownership so that supply runs one way. Move the definitions this roadmap takes from Congruences into this roadmap, or into a member earlier than both, and have Congruences cite them: local conditions at a place, conjugate self-dual representations of a level, main summands, Ribet cocycles, divisible Selmer lengths with `e′_ℓ`, and auxiliary twists. The set-up sections of OneSided and Determinants that this roadmap uses likewise need to sit in a member placed before it.

## R03 (P1) — The `ShortGRH background` prerequisites have no owner, although roadmaps on main own most of them

An input named only by a file of the formal proof is unowned: no roadmap will prove it, and the library gets second plans of theorems already planned. The *Needs:* lines 152, 182, 272, 321, 378, 407, 479, 565, 600, 785, 928, 1041, 1129, 1160, 1226 and 1256 cite "ShortGRH background (… [ShortProof] file (declaration))". Scope and ownership (line 1330) declares these not owned here but names no owner.

On main the owners are:

- Chebotarev's density theorem: Chebotarev (Completed).
- The Artin map and the existence theorem: ClassFieldTheory.
- Global duality and the Greenberg–Wiles formula: ArithmeticGaloisDuality.
- Gauss valuations: NewtonPolygons §2.2.
- Crystalline period rings: PadicPeriodRings.
- The Bloch–Kato condition and its local duality: SelmerIwasawaCohomology §§2.17, 4.9.
- The rank formula used in 4.4: PadicHodgeRegulators §1.5.
- Teichmüller lifts: Mathlib `WittVector.teichmuller` (`Mathlib/RingTheory/WittVector/Teichmuller.lean`, line 93).

SelmerLengthBoundsAndLocalLifting on main names these same owners for the same inputs in its Scope and ownership. Cite them on the *Needs:* lines and in the supplier contracts, with a clause where the form used differs (for instance `B_max` against `B_cris`). The remaining entries need an owner too, either as targets here or as a named roadmap section: Kummer charts and the frame theorem for Kisin modules, lengths of kernels by maximal minors, Hilbert 90 for finite ideles, Selmer modules cut out by relations, and avatars of algebraic Hecke characters.

## R04 (P2) — SelmerLengthBoundsAndLocalLifting on main owns twist selection and the local bounds, and this roadmap states its own versions without citing them or saying how they differ

As it stands, these results have two owners, and a reader cannot tell which statement the library is to prove or how the two relate. The Scope and ownership of SelmerLengthBoundsAndLocalLifting (its line 1895) owns:

- the specialisation lemma for roots of unity (§3.25b);
- twist selection (§3.26);
- the defect of a class orthogonal to part of the dual finite classes (§4.10b);
- lifting with loss over tame-type bases (§4.10f).

Set these beside this roadmap's 2.6, 2.7 and 5.4, 4.7, and 3.7. The README never names that roadmap or its family. The forms differ in four ways:

- Selmer data with the first-prime term and the bound `β_T`, against balanced conditions and `ν_s`;
- the powers `j ≤ m`, against all `m` prime to `p`;
- a specialisation free of degrees, against polynomials of the first kind;
- cup exponents, against lifting exponents.

The ids are unchanged at the head of that roadmap's open revision. In Scope and ownership, name SelmerLengthBoundsAndLocalLifting §§3.25b, 3.26, 4.10b and 4.10f, and say in one clause per section how 2.6, 2.7, 4.7 and 3.7 differ. Where the main form suffices for a step, cite it instead; the duality step of 4.7 is one such step.

## R05 (P2) — Sections 2.1–2.7, 3.3a–3.6, 4.6–4.8 and 5.1–5.4 reproduce the formal proof's file division and file titles, and Layers 3 and 4 are its folders `Lifting` and `LocalLoss`

The roadmap's organisation has to be its own; a source's arrangement is never the plan. Here the file list of [ShortProof] (its `CONTENTS.md`) gives these pairs:

- 2.1 OneSystem, 2.2 Untied, 2.3 StickelbergerSystems, 2.4 StickelbergerLine, 2.5 Line, 2.6 RootsOfUnity, 2.7 GeneralTheorem;
- 5.1 MainSummands, 5.2 ClassSums, 5.3 LValueSystems, 5.4 TwistingTheorem;
- 4.6 CrystallineDefect, 4.7 TateDualBound, 4.8 LocalLattices;
- 3.3a SafeMoves, 3.3 and 3.4 CutExponentBounds, 3.5 FewLowJumps, 3.6 CupOrthogonalityBounds.

The titles follow the files' titles closely ("the failure to be tied", "Stickelberger systems on a line", "restriction to a line", "tame classes from roots of unity and lattices above ℓ").

The order is not the problem, because the *Needs:* lines force most of it:

- 2.1, 2.2 and 2.4 come before 2.5, which comes before 2.7;
- 5.2 comes before 5.3, and 5.1 and 5.3 before 5.4;
- Layer 3 comes before Layer 4, since 4.5 needs 3.6 and 4.6 needs 3.7;
- Layer 5 comes after Layers 2 and 4, since 5.1 needs 4.1, 4.4 and 4.8, and 5.4 needs 2.7.

The scope is not forced. Layer 4 is the `LocalLoss` folder, although 4.3, 4.4, 4.5, 4.7 and 4.8 (a) are general statements about lattices over a local Galois group and do not use the data. The description says the layers keep the order of the formal proof's folders.

Keep the order and regroup by what 4.6 and 5.4 need. Put 4.3–4.5, 4.7 and 4.8 (a) in a layer of general local results beside 3.6 and 3.7, and leave 4.1, 4.2, 4.6 and 4.8 (b) as the layer on the data. Title each section by its mathematics in the roadmap's own words.

## C01 — Downstream consumers lists a supplier

The bullet at line 1304 names NormsOfThetaLiftsAndExchangeIdentities §§2.5, 2.7 and 6.1. These supply 5.2 (its *Needs:* line, line 1223, and the supplier contracts, line 1351), and that roadmap lists this one as its consumer (its line 1678). Remove the bullet; the supplier contracts already carry it.

## C02 — "Layers 4 and 5 are stated on the data" is not accurate

The sentence is in the Conventions (line 28), and Layer 4 opens "On the data" (line 938). But 4.3 holds over any noetherian ring and group, 4.4 over any CM field, and 4.5 and 4.7 for any open embedding `j`, and 4.8 (a) does not use the data either. Would read: "4.1, 4.2, 4.6, 4.8 (b) and Layer 5 are stated on the data".

## C03 — 4.4 (a) assumes a primitive 5040-th root of unity in `E`, which the rank formula does not need

At line 1033, the hypothesis comes from an instance of the formal proof. PadicHodgeRegulators §1.5 gives `dim H¹_f = dim D_dR/Fil⁰ + dim H⁰` for every finite `K/ℚ_ℓ` and de Rham `V`. That formula gives 4.4 (a) for any CM field: for `ℤ_ℓ(1)` over `ℚ_ℓ` the rank is `2 = 1 + 1`. Drop the hypothesis, or say that it is the formal proof's form.

## C04 — Three references have no title, so their locators cannot be found

These are Bertolini–Darmon (1994), Caraiani–Emerton–Gee–Savitt (2022) and Mazur–Rubin (2005), at lines 1359, 1362 and 1368, used in 1.5, 3.7 and 2.1. CEGS has two papers from 2022, arXiv 2207.05237 and 2207.14337. Section 3.1 of the first is "Extensions of Breuil–Kisin modules with descent data". Give the titles and venues.

## C05 — The Summary says the local bound "does not depend on the rank of the lattice in the essential cases"

That is the Summary at line 20. The bound of 4.6 is `[G_{ℚ_ℓ} : j(Γ)]·rank(L_x)·B_ℓ/x′`, linear in the rank, as Layer 4's introduction says ("per unit of rank"). What is rank-free is the cup exponent of 3.3, 3.4 and 3.7. Would read: "the power of `ℓ` that makes the cup products vanish does not depend on the rank in the essential cases; the bound is linear in the rank and uniform in `ℓ`".

## C06 — A sentence of the description does not hold for this roadmap

The description says: "Where an existing section states a fuller or differently normalised form, the roadmap says so and does not cite it as a supplier." This roadmap does not say so for SelmerLengthBoundsAndLocalLifting (R04). Either the README says so, as R04 asks, or the sentence names the members for which it holds.

## N01 — No section has a Check, and no layer ends with Examples and Dependencies

A Check worth having would be one for "character for `Q` relative to `S`" (Conventions, line 47): the cyclotomic character is unramified outside `ℓ` but is not anticyclotomic, since `χ(cgc) = χ(g)`, so it is not such a character.

## Questions for the author

- In 4.8 (a), is "every polynomial vanishing on `M`" counted with multiplicity? If it is, `X^e − 1` is separable and does not vanish on a multiset with a repeated element, so `K(X^e − 1)` would not follow. I could read the formal statement only in short fragments.
- The method paragraph of 1.5 says the tilting lemma excludes "at most `n` residue classes". The formal lemma excludes at most as many classes as the evaluation has coordinates, which is `2n` when the values at `φ` and `φ^{−c}` are taken together. Which is meant?
- 3.1 defines the cup coboundary condition with "`j` is injective", while 3.2 makes the scaled condition vacuous when `j` is not injective. What does `L^{⊥𝒬}` mean for a non-injective `j`?

## Verified sound

| Statement | Instances tried | README side | Computed or source side | Result | Change |
|---|---|---|---|---|---|
| 1.1 conjugate-dual action | `g, h ∈ G_E` | `(gh)·y = χ((gh)^c)·y∘ρ(((gh)^c)^{−1})` | `g·(h·y) = χ(g^c)χ(h^c)·y∘ρ((h^c)^{−1})ρ((g^c)^{−1})`; equal | holds | none |
| 1.1 rank field of a Selmer datum | formal field | `Σ rank Z_w ≤ (#{w∣ℓ} + f)·n` | `Σ finrank ≤ (card placesDividing + numInfPlaces)·card n` | agrees | none |
| 1.2 auxiliary primes | formal statement | `z` in normal closure of inertia above `R∖(S∪S̄∪{w∣ℓ})`; `P ∉ R∪R̄`; all `T′ ⊆ S∪{w∣ℓ}` | the same three conditions | agrees | Origin not verifiable |
| 1.3 (a), (b) | cocycle with `z(γ)=0` | `z([g,γ]) = (1−ζ)z(g)`; vanishing on `H_T` forces `z=0` | expansion gives `z(g) − ζz(g)`; `1−ζ` a unit as `ζ²−1 = (ζ−1)(ζ+1)` | holds | none |
| 1.3 (b), `ρ(H_T)=1` | scalar `ζ` | `ρ([g,γ]) = 1` | `ρ(g)ζρ(g)^{−1}ζ^{−1} = 1`; `ζ` a unit since `ρ(γ)` is invertible | holds | none |
| 1.4 (a) | `v ≠ w` in `J` | `λ_w(γ_v) = 0`, `λ_v(γ_v) = 1` | `λ_w` unramified off `{w, w̄}`, `v̄ ∉ J`, so 0; 1 by the prime data | holds | none |
| 1.5 descent | formal statement; `M = 0` | `#k_O > 2n·v_O(ℓ^M)+1`; length ≤ global + places | `2·card n·addVal(ℓ^M)+1 < card k_O`; same bound; `M=0`: module 0 | agrees | none |
| 2.1 (a) | `φ_v^{−c}`, `v ≠ P₀` | `ψ_X(φ_v^{−c}) = 1+X_{P₀}` | anticyclotomic `λ(g^{−c}) = λ(g)`, so equal to `ψ_X(φ_v)` | holds | none |
| 2.2 (a), (b) | formal statement | condition on `y`; `N ≥ 1`; `M ≤ N`; `P¹` over `J∖{P₀}` and both elements | `h_geom_sum`, `N ≠ 0`, `hMN`, product over both Booleans | agrees | none |
| 2.4 (b) | `Q=∅`, `P=P₀`, `ψ=1` | `v(1(Θ_{P₀})) ≤ β_Y` | each factor `≡ 1−ϑ(g₀)^{±1}` mod `ℓ^M`, valuation `v(ϑ(g₀)−1) < M`; total `β_Y` | holds | none |
| 2.4 (c) | the hypotheses | `β+1 < M ≤ Nρ`, `s₀ρ < 1`, `2r#J ≤ s₀` | forces `N > 1/ρ > s₀ ≥ 1`; formal hypotheses identical | agrees | none |
| 2.5 | formal statement | `2#Q ≤ s₀`; `v(x⁰) ≥ r`; Selmer bound only if `v(P(x)) < β+1` | `two_mul_card_le`, `le_ellVal_datumPoint`, `h_lt` | agrees | none |
| 2.6 (a) | `g = Y`; `ℓ=2`, `h=1` | `v(g(ζ−1)) ≤ v_{ρ_h}(g) + δ` | `v(ζ−1) = 1/φ(ℓ^h) = v_{ρ_h}(Y)`; `v(−2) = 1 = 1/φ(2)` | holds | none |
| 2.7 (a), (d), general twisting | `j ≤ m` | `ψ^j` ramified on all of `Q`; tame sum ≤ `ε` | `v(ζ−1) ≤ r/m < 1/m` forces order `> m`; `2#Q·r ≤ s₀r ≤ ε/2` | holds | R04 |
| 3.1 sign of jumps | `L = O(χ)`, `O = ℤ_p` | cyclotomic character has jump `−1` | `f(x)=cx` needs `g(c) = χ(g)^{1+u}c`; a nonzero line only for `u = −1` | holds | none |
| 3.5 | formal statement | windows `ε(i)` and `−ε(i)`; colength `11Σ(n(a+1)+r(W+1))` over `ℤ_p`; exponent 0 | hypotheses and conclusion identical | agrees | R05 titles |
| 3.6 (a) | formal statement | `δ ≤ 11f(m(a+1)+rank·(W+1))·len(O/p)` | same expression | agrees | none |
| 3.7 | formal statement | `p > b+6(W+η)+r²(N+1)²+2`; exponent `3r²(N+1)²+150(η+W+1)` | identical; `j` surjective | agrees | R04 |
| 4.1 | formal statement | low: `Δ ≤ 4|u| ≤ 8mΔ`; at most `r′m/k_D` small; `B_ℓ = 10⁶(m/k)(…)` | `Δ ≤ 4|u| ∧ |u| ≤ 2mΔ`; `countP·k ≤ rm`; value in `NNReal`, so real division | agrees | none |
| 4.2 | formal statement | `ℓ ≤ k_D t`, `0 < i < n < l₀(s)`; `ℓ ∣ q₁d` | `hℓ_le`, `hi_pos`, `hi_lt`, `hn_lt`; condition on conductor `q₁d` | agrees | none |
| 4.4 (a) | `ℤ_ℓ(1)`, `ℤ_ℓ(−1)` over `ℚ_ℓ` | ranks 2 and 1 | `dim H¹_f + dim B¹`: `1+1 = 2`, `0+1 = 1` | holds | C03 |
| 4.4 (b) | cup exponent `k` | `len_ℓ δ ≤ [G:j(Γ)]·y` for `y ≥ 2k·rank L` | `δ ≤ k·rank Z_f ≤ k·2[G:j(Γ)]·rank L` | holds | none |
| 4.6, headline | `x = ∗` and `x = c` | `[G:j(Γ)]·rank(L_x)·B_ℓ/x′` | linear in `rank(L_x)` | holds | C05 |
| 4.7 | formal statement | all `u_x∘η` and `ρ∘η` in the class; bound `δ_𝒞(L^∨(1))` | identical | agrees | R04 |
| 5.2 | formal statement; `δ = ±1` | `(I,m₀) = ({z},0)` or `({0,1},1)`; `F(ϑ) = F(1)N^{m₀}r^{m₀+1}` | identical; the factor is symmetric under `a ↔ a^{−1}` | agrees | none |
| 5.3 (a), (c) | `ϑ(g₀)` a root of unity of order `d ∣ Nw−1` | `β_Y ≤ v(1(Θ_∅)) + 4v(Nw−1)` | `r ≤ 2`; `v(ζ−1) = 0` unless `d = ℓ^k`, then `1/φ(ℓ^k) ≤ k ≤ v(Nw−1)` | holds | none |
| 5.4, headline | `c = (4f_D+3)r·v_ℓ(n_GL)` | torsion level `c+2`; `4v(p−1) + 2^{−ℓ} ≤ e′_ℓ` | `c+2 > c+1`; `v_ℓ(n_GL) ≥ rt·v_ℓ(p−1)`, so `7r²t·v(p−1) ≥ 4v(p−1)` | holds | none |
| Supply direction | *Needs:* lines | 5.1 needs Congruences §1.3 | Congruences §1.3 needs §4.1: a cycle of roadmaps | fails | R02 |
| Conventions, line 28 | 4.3, 4.5, 4.7 | "Layers 4 and 5 are stated on the data" | any noetherian ring; any open embedding | fails | C02 |

- Source locators checked: the [ShortProof] declarations of 1.1–1.5, 2.2–2.5, 3.5, 3.6 (a), 3.7, 4.1–4.4, 4.7, 5.2 and 5.3 at the pinned commit. Also read: the formal proof's `README.md`, `INDEX.md` and `CONTENTS.md`, and the contents of arXiv 2207.05237.
- Library: Mathlib `WittVector.teichmuller` (`RingTheory/WittVector/Teichmuller.lean`, line 93); the pinned Tau Ceti has no crystalline or Bloch–Kato carriers.
- Cross-roadmap citations resolved: OneSided §§2.1, 2.2, 3.1–3.4; Divisibility §§1.5, 1.6; Determinants §1.1; Norms §§2.5, 2.7, 6.1; ThetaLift §2.10; Congruences §§1.1, 1.2, 1.3, 1.5, 3.1, 4.1, all of which exist at this head. Owners on main read: Chebotarev, ClassFieldTheory, ArithmeticGaloisDuality, NewtonPolygons §2.2, PadicPeriodRings, PadicHodgeRegulators §1.5, SelmerIwasawaCohomology §§2.17, 4.9, and SelmerLengthBoundsAndLocalLifting §§3.22–3.26, 4.10b, 4.10f (the same ids at its open revision).
- Automatic checks: one failure, the missing `Suggested.lean`, which is real (R01). Dependency check output: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`. It cannot see the cycle with members that are not yet in the merge order.
- Elaboration: no Lean file to elaborate; the targeted build fails because the module's file is missing.
- Overlap check: read SelmerLengthBoundsAndLocalLifting, on main and at its open revision, which is the only roadmap in the three closest-roadmap lists. Shared: twist selection, the specialisation at roots of unity, the defect under local duality and the tame-type bound. Owner: SelmerLengthBoundsAndLocalLifting (R04). Ownership against open pull requests was checked by searching for objects (Chebotarev, Greenberg–Wiles, `B_max`, Breuil–Kisin modules, `H¹_f`).
- Source independence: 14 passages compared with 1 source ([ShortProof] statements and docstrings); no shared wording beyond what the mathematics forces (the longest is the hypothesis list of 4.7, about 14 words). Largest share: ShortProof, 51 of 60 locators. Contents compared with ShortProof `CONTENTS.md`: the sections follow its file division and titles, in an order the *Needs:* lines force (R05).
- Research link: 5.4 is the twisting step that Ribet's method needs on the ShortGRH route to GRH for Dirichlet `L`-functions (README Summary). Its neighbours are the theta elements of Bertolini–Darmon (1996) and Chida–Hsieh (2018), Katz's (1978) `p`-adic `L`-functions, and the finite classes of Bloch–Kato (1990). This line rests on the README.

## Not verifiable

- Gras–Munnier (1998), Théorème 1.1 (Origin of 1.2): the PDF on the Centre Mersenne host is an image-only scan, and the sources service places that host in no licence class, so there was no text and no OCR.
- Bertolini–Darmon (1994), Lemma 2.21, Definition 2.22 and Lemma 2.23 (Origin of 1.5): no title is given, and I could not identify the work.
- Katz (1978), Bertolini–Darmon (1996) and Chida–Hsieh (2018) (Origin of 5.2): cited without locators, and not opened.
- The [ShortProof] files were read at the pinned commit through a fetcher that quotes only short fragments, so the statements were compared clause by clause, not verbatim. The sources service could not cache them because the disk was full during the run.

## Source issues

- none

## For the human reviewers

- Scope: the main source, [ShortProof] (51 of 60 locators), is an unrefereed Lean repository marked "Research artifact". Its README credits the proof to Levent Alpöge with Claude and the Lean text to Claude. Most sections' Origin reads "particular to this proof".
- Licence: the source repository is Apache 2.0 with NOTICE and ATTRIBUTION files (the License section of its README). The roadmap restates its statements and names 181 of its declarations.
