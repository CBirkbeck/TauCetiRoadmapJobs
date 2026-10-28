# GeometryOfNumbersAndQuadraticArithmeticPartII repair report

This report settles red-team round 1, passes a and b, at head 6d65613. The first six finding sections refer to pass a (its F01–F06); the following four refer to pass b (its F01–F04). Repeated identifiers keep each review's numbering. Pass a F01 and pass b F01 are the same missing ℚ₂ headline, and pass a F02 and pass b F02 are the same Hasse sign. Each pair is settled once, and each finding keeps its own verdict below.

## F01 (P2) — applied

Pass a. `Suggested.lean` imports `TauCeti.LinearAlgebra.QuadraticForm.Witt.FundamentalIdeal` and has a Layer 4 section with two theorems. `wittRing_padicTwo_coordinates` says that (a,b,e)↦a·1+b⟨⟨2⟩⟩+e⟨⟨−3⟩⟩ underlies an additive equivalence ℤ/8×ℤ/2×ℤ/2≃W(ℚ₂). `wittRing_padicTwo_mul_c` says that c(au+bv+ec)=ac+4bu. Both are named in README §4.1 and in the module docstring.

## F02 (P3) — applied

Pass a. The §4.1 Check now reads: ⟨1,3,−2,−6⟩ has rank 4, determinant 36 and Hasse invariant (3,−2)(3,−6)(−2,−6)=+1, the invariants of ⟨1,1,1,1⟩, so cv=4u. The hyperbolic ⟨1,−1,1,−1⟩ has Hasse invariant −1, so 4u≠0. Conventions now fix Hasse=Π_(i<j)(aᵢ,aⱼ), and say that adding H multiplies it by (d,−1).

## F03 (P3) — applied differently

Pass a. StableHomotopyKTheory §§5.5 and 5.7–5.9 are indeed symmetric-spectrum adapters. But the L-spectra of §6.8a live in GeometryOfNumbersAndQuadraticArithmetic §6.1a's shared `Spectrum`, which also supplies homotopy groups, fibres, cofibres, the long exact sequence and detection of equivalences. So that section is cited instead of GeneralizedCohomology G2.4–G2.6, in Scope, Conventions, the supplier contract and the §§2.2 and 2.4 Needs lines.

## F04 (P3) — applied

Pass a. §2.3 now states the sesquilinearity φ(xa,yb)=α(a)φ(x,y)b and has three new Checks. (1) Over ℚ with u=−1, xy gives φ+Tφ=0, whereas omitting u gives 2xy. (2) For [[0,1],[0,0]], u=−1 gives determinant 1 and u=1 gives −1. (3) Under transpose on M₂(ℚ), α(E₁₂E₂₁)=E₁₁=α(E₂₁)α(E₁₂), whereas the order-preserving product is E₂₂.

## F05 (P1) — applied differently

Pass a. Right: SchemeAndStackFoundations §0.21 has completion regularity only for local G-rings. I declared `gap:henselian-pair-completion-regular` (§0.21) in plan.json and the README contracts. It is stated for Noetherian G-rings (Stacks 0AH2, 0AH3), which include finitely presented ℤ-algebras by §0.21. The §2.5 route and Needs line were rewritten, and a nonlocal ℤ[x],(2) Check was added.

## F06 (P3) — applied

Pass a. "The maps of units send (1,1) to 1−1=0" now reads: the additive difference map ℤ[1/2]⊕ℤ₂→ℚ₂, (a,b)↦a−b, sends (1,1) to 0 and (2,1) to 1, so ℤ→ℤ[1/2]⊕ℤ₂→ℚ₂ composes to zero, whereas the sum map gives 2. To repair the pattern, the same witness in the supplier paragraph moved into Conventions, next to the difference convention it pins.

## F01 (P2) — applied

Pass b. This is the same defect as pass a F01 and is settled there. The suggested local `diag` definition and `Invertible (2 : ℚ_[2])` instance are not needed. `TauCeti.oneFoldPfisterClass` (⟨⟨a⟩⟩=⟨1,−a⟩, `Witt/FundamentalIdeal.lean:89`) gives v=⟨⟨2⟩⟩ and c=⟨⟨−3⟩⟩, and Mathlib's global `invertibleTwo` (`Algebra/CharP/Invertible.lean:124`) covers ℚ₂. The annihilator ⟨2u,c⟩ is in the docstring of `wittRing_padicTwo_mul_c`.

## F02 (P3) — applied

Pass b. This is the same defect as pass a F02 and is settled there; b's convention sentence was adopted in Conventions. As a pattern repair, the §5.2 Check that 4u=0 over ℚ(√−3) now computes it: 4u and ⟨1,−1,1,−1⟩ have determinant 1 and Hasse invariant +1 at every place, since (−1,−1)_E=(−1,N(−1))_(ℚ₂)=+1. The §4.3 Check ⟨2,3/2⟩=c+4u was recomputed and is unchanged.

## F03 (P3) — applied differently

Pass b. Remark 2.2.8 begins on page 39 (CDHHLMNNS-III-v4 line 1807, before the page-40 marker at line 1811). The cited content, the Lq₂(ℤ)=0 contradiction and nondyadic dévissage, sits at lines 1813–1818 on page 40. So the §3.4 locator is "Remark 2.2.8, pp. 39–40", with lines 1807–1818, rather than "p. 39" alone.

## F04 (P3) — applied

Pass b. §5.5's route now identifies Lq₀(R) with the Mayer–Vietoris kernel. The boundary from Ls₁(O) vanishes because Ls₁(R)→Ls₁(O) is the identity of Ws(𝔽₄) (§1.2; CDHHLMNNS-III-v4 line 2070, step iv). Both maps into Ws(O) are injective, ℤ/4 onto ⟨u⟩ and ℤ/2 onto ⟨t⟩, so ⟨u⟩∩⟨t⟩=0 gives zero. §1.2 was added to the §5.5 Needs line.

## Checks run

- **Elaboration.** I ran `lake env lean` on `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean` from the content checkout. It prints three warnings, "declaration uses `sorry`" at lines 51, 82 and 95, and no errors. The imported Tau Ceti module's object file was already built.
- **Signatures.** I elaborated `#check @arf_trace_classifies`, `#check @wittRing_padicTwo_coordinates` and `#check @wittRing_padicTwo_mul_c` together in one scratch file.
  - The first is identical to the worker's `signatures.md` entry.
  - The other two have no binders beyond their own; the file has no `variable` block. They match README §4.1, with u=1, v=`oneFoldPfisterClass (Units.mk0 2 _)`, c=`oneFoldPfisterClass (Units.mk0 (-3) _)`, and nsmul by `ZMod.val`.
  - Their `Invertible (2 : ℚ_[2])` instance resolves from the library.

  Nothing changed as a result of the comparison.
- **Dependency check.** `gate --depcheck … --movable` printed:

  ```text
  depcheck: 53 roadmaps, 595 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citations and no Lean names found nowhere. It does not check library names on this host, so I checked the new ones at the pins by hand:
  - `TauCeti.oneFoldPfisterClass` (`Witt/FundamentalIdeal.lean:89`);
  - `TauCeti.RegularFormClass.localHasse` (`NumberTheory/LocalField/QuadraticForm/Hasse.lean:91`, whose docstring gives Π_(i<j));
  - Mathlib `invertibleTwo` (`Algebra/CharP/Invertible.lean:124`, for division semirings of characteristic zero).
- **Locator correction.** The Lean docstring of `wittRing_padicTwo_coordinates` cited Example 2.3.14 (lines 2175–2182), which concerns c only. The order 32 and the abstract group are in Example 2.3.13, p. 46, lines 2120–2124, which cite Lam-2005, VI Theorem 2.29. The docstring and the README §4.1 locator now give both, and the Lam-2005 entry in `sources.toml` lists 4.1 under `cited_for`.
- **Sources.** The key `Stacks` (Chapter 15, certified, open repository) records Lemma 15.51.14 (0AH2) at Stacks line 6106, p. 130, and Lemma 15.51.15 (0AH3) at line 6126, pp. 130–131. Both are stated for G-rings, which are Noetherian by Definition 15.51.1. No text is missing, and no `needs-references.toml` was written.

## Adversarial pass on changed or added statements

The W(ℚ₂) rows use exact Hilbert symbols at 2, (−1)^(ε(u)ε(v)+αω(v)+βω(u)). Each form is stabilized with ⟨1,−1⟩ to dimension 40 or 41 of the right parity and compared by (parity, determinant square class, Π_(i<j)).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `wittRing_padicTwo_coordinates` | all 32 triples (a,b,e) | 32 distinct invariant triples; 8u, 2v and 2c each equal the class of 0; 4u≠0 | Injective and well defined. With \|W(ℚ₂)\|=32 (CDHHLMNNS-III-v4 line 2120) it is bijective; true as stated |
| `wittRing_padicTwo_mul_c` | all 32 triples | c(au+bv+ec) and ac+4bu agree in 32 of 32; cv↦(4,0,0), c²↦(0,0,0) | Image {0,c,4u,c+4u} of size 4; kernel of size 8, consisting of the 8 triples with a even and b=0, i.e. ⟨2u,c⟩ |
| Coordinates convention | ⟨⟨a⟩⟩ at the pin | `oneFoldPfisterClass a = wittClass(1 + ⟨-a⟩)`; a=2 gives ⟨1,−2⟩, a=−3 gives ⟨1,3⟩ | v and c are as in README §4.1, not their negatives |
| Hasse convention s(q⊥H)=s(q)(d,−1) | ⟨1⟩, ⟨3⟩, ⟨2⟩, ⟨−1⟩, ⟨5⟩, ⟨1,3⟩, ⟨1,−2⟩, ⟨2,6⟩, ⟨1,3,−2,−6⟩, ⟨1,1,1⟩, ⟨6,10,−7⟩ | 0 failures in 11; ⟨3⟩ goes +1→−1 and ⟨1⟩ stays +1 | Stated as multiplication by (d,−1), not as "adding H flips the sign" |
| §4.1 Check on c·v (rank 4, no stabilization) | ⟨1,−2,3,−6⟩, ⟨1,1,1,1⟩, ⟨1,−1,1,−1⟩ | (3,−2)=+1, (3,−6)=−1, (−2,−6)=−1; Hasse +1, +1, −1; all determinants square | cv=4u≠0 |
| Other §4.1 Checks | ⟨1,−5⟩, ⟨1,−3⟩, ⟨−1,2⟩, c·c | (0,0,1)=c, (2,0,1)=2u+c, (0,1,0)=v, 0 | Unchanged and consistent |
| §4.3 and §5.5 Checks | ⟨2,3/2⟩; ⟨1,−21⟩ and ⟨1,−1,4,−21/4⟩ | (4,0,1)=c+4u; both (0,0,1)=c | Unchanged and consistent |
| Hilbert formula witnesses (Conventions) | (−1,−1), (2,5), (−1,2) | −1, −1, +1 | As stated |
| §5.2 Check, 4u=0 over ℚ(√−3) | odd v; dyadic E=ℚ₂(√−3); ℚ₂ | (−1,−1)_v=+1 (units, odd residue); (−1,−1)_E=(−1,N(−1))=(−1,1)=+1; (−1,−1)_(ℚ₂)=−1 | No real places, so 4u=0 in W(K) while 4u≠0 in W(ℚ₂) |
| §2.3 sesquilinearity and T | general check, then α=id, u=−1 on ℚ | Tφ(xa,yb)=α(a)α(φ(y,x))α²(b)u=α(a)Tφ(x,y)b using α²(b)=ubu⁻¹; α(−1)=−1=u⁻¹ | T preserves sesquilinear maps; the anti-structure axioms hold |
| §2.3 new Checks | xy on ℚ, u=±1; [[0,1],[0,0]] on ℚ²; E₁₂, E₂₁ in M₂(ℚ) | xy−yx=0 against 2xy; det[[0,1],[−1,0]]=1 against det[[0,1],[1,0]]=−1; E₁₂E₂₁=E₁₁ against E₂₁E₁₂=E₂₂ | Each Check separates the stated convention from the wrong one |
| §2.2 additive difference Check | (1,1), (2,1), and the sum map | a−b gives 0 and 1; a+b gives 2 and 3; composite 1↦(1,1)↦0 | A complex only for the difference |
| §2.5 gap and ℤ[x],(2) Check | H the henselization of (ℤ[x],(2)) | H/2H=𝔽₂[x] has infinitely many maximal ideals; 2H lies in every maximal ideal | H is not local, so the local §0.21 statement does not apply and the gap is needed |
| §2.5 route | A finitely presented ℤ-algebra | A is a G-ring (§0.21 `IsGRing.of_finiteType`); H is a G-ring (0AH3); H→Ĥ_(IH) is regular (0AH2); Ĥ=Â since H/IⁿH=A/Iⁿ (§0.13) | Néron–Popescu (§0.15) applies, as in CMM line 1665 |
| §5.5 degree-zero step | Mayer–Vietoris in degrees 1 and 0 | Lq₁(O)=0 (line 2067); Ls₁(R)=⊕_(p\|2)Ws(k_p)=ℤ/2 and Ls₁(O)=Ws(𝔽₄)=ℤ/2 (§1.2), identity; \|Ws(R)\|=4=\|⟨u⟩\|; \|Wq(O)\|=2=\|⟨t⟩\| | Lq₀(R)=0 |
| §3.4 locator | source lines 1763, 1807, 1811, 1813–1818 | page-39 marker, start of the remark, page-40 marker, cited content | pp. 39–40 |
| §4.1 docstring locator | source lines 2120–2124, 2175–2182 | order 32 and ℤ/8⊕(ℤ/2)² in Example 2.3.13; c=⟨1,−5⟩ and ann(c) in Example 2.3.14 | Both are cited |

## Ownership and maintainer notes

- **Ownership of §4.1.** I searched for W(ℚ₂) with `roadmaps grep` over main and every open head, and grepped the board packages. There is no other statement of it; QuadraticFormInvariants has only the general Pfister API, which is consumed. This roadmap remains the owner of the explicit presentation.
- **Ownership of the new gap.**
  - SchemeAndStackFoundations §0.21 owns G-rings, so the contract is placed there.
  - ResolutionOfSingularitiesCharacteristicZero (`adicCompletion_quasiExcellent`, earlier in the order) mentions regularity of A→Â_I for a Noetherian G-ring, but inside a paragraph about Noetherian ℚ-algebras, and it has no henselization statement. So it does not cover ℤ[x], (2).
  - AlgebraicModuliForArithmeticGeometry has only local G-ring results.
  - Ownership against open pull requests was checked only through `roadmaps grep` and the sibling checkouts listed in the brief.
- **Supplier change.** StableHomotopyKTheory is no longer a supplier named in the README; GeometryOfNumbersAndQuadraticArithmetic §6.1a takes its place. The design file `design/plan.json` still names StableHomotopyKTheory outside its `gaps` list (lines 863 and 1836). This job may edit only that list, so those entries were left.
- **New Lean names.** `TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmeticPartII.wittRing_padicTwo_coordinates` and `…wittRing_padicTwo_mul_c` are new. No existing name changed.
- **Source issue.** Both reviews recorded that CDHHLMNNS-III-v4 lines 2180–2181 give 2⟨1⟩ and ⟨1,−2⟩ as generators of ann(⟨1,3⟩). That is wrong, since ⟨1,−2⟩·⟨1,3⟩=4u≠0; the correct generators are 2u and c. The README and the docstring of `wittRing_padicTwo_mul_c` use the corrected generators.
- **Untrusted text.** The reviews contain no instruction-like text.
