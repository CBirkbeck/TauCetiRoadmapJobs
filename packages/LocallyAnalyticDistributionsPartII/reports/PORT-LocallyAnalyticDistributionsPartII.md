# PORT-LocallyAnalyticDistributionsPartII

- Branch: `roadmap/locally-analytic-distributions-part-ii`, from main at 45f58db.
- Head commit: d3a91925, "LocallyAnalyticDistributionsPartII: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/LocallyAnalyticDistributionsPartII/README.md` (780 lines), `Suggested.lean` (113 lines), `metadata.toml` (`topic = "math.NT"`). Nothing outside the folder changed.
- Build (`lake build TauCetiRoadmap.LocallyAnalyticDistributionsPartII.Suggested`): `Build completed successfully (18286 jobs).` 2 warnings, both `declaration uses 'sorry'` (lines 79 and 99). No other warnings.
- Gate: `gate LocallyAnalyticDistributionsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 225 roadmaps, 1990 edges, 0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines.
- `roadmaps resolve` on the ported README: no cross-roadmap citation and no Lean name found nowhere.

## Which package version was ported

The board copy at `packages/LocallyAnalyticDistributionsPartII/` is the original submission. It is the version after FIX-PKG~2, and its `review.json` still says `needs_changes` (17 findings). Rounds 3–8 of repairs were made on the open package-fix pull request in the jobs repository: reviews ~3 to ~7 reviewed those heads, and FIX-PKG~8 at head d03e189 applied ~7's three findings (the quotient manifold G/TN in §4.4, the radius and lattice hypotheses in §4.1, and stale locators). The board copy has none of these repairs. Porting it would have reintroduced, among other things, the false claim B = TN and the unconstructed analytic quotient G/B.

I therefore ported the package at d03e189. I fetched it read-only into the scratch directory. It has 736 README lines, and its `Suggested.lean` has four declarations, including the algebraic Peter–Weyl headline. No review has run on d03e189 itself. The worker should confirm that this is the version meant to be accepted.

## Draft pull request body

This roadmap continues *Locally analytic distributions* to groups that need not be commutative. It relates Iwasawa algebras of compact p-adic Lie groups to completed enveloping algebras. It builds on:

- the distribution algebra D(G, K) of PadicLocalLanglandsForGL2Qp §0.1;
- the uniform groups, p-valuations and Lazard Lie algebras of NoncommutativeAndEquivariantIwasawa Layer 0.

On these it builds the following:

- the lattice-level theory of Lazard's Lie lattice, and the embedding U(g_K) ⊂ D(G, K) with central Z(g);
- the coadmissible-module theory of an arbitrary Fréchet–Stein algebra, and the Banach radius algebras D_r(G, K) in ordered coordinates;
- the p-adically completed enveloping algebras Û(h)_K, Frommer's closures U_r(g, K) and the Arens–Michael envelope;
- the Ardakov–Wadsley microlocalisation K[[G]] → Û(g_R)_K, with Lie modules and the comparison of isotypic quotients;
- central specialisation along infinitesimal characters, including the locally analytic principal series on the quotient manifold G/TN;
- the algebraic Peter–Weyl theorem on first congruence subgroups.

The end theorem is Fu's injectivity theorem: for p odd, G = G₁^m a product of first congruence subgroups of SL₂(ℤ_p), and every λ ∈ ℤ_p^m, the composite ℚ_p[[G]] → Û(g) → Û(g)_λ is injective. It is proved through the faithfulness of affinoid Verma modules, and Fu's direct route through distributions is laid out alongside it. These are the algebraic inputs of Fu's sharp multiplicity bounds for Bianchi modular forms. `Suggested.lean` states the two headlines that are statable at the pins:

- the semisimplicity of finite-dimensional modules over ℚ_p ⊗ ℤ_p[[G₁^m]] (Ardakov–Wadsley 2013, Theorem 11.1(a));
- the algebraic Peter–Weyl theorem K[[G₁^m]]/Ann(W_k) ≅ End_K(W_k) (Fu, (32)).

Its docstring names the headlines that need carriers absent at the pins, among them Û(g) as a ring, D(G, K) and its Banach stages.

## Dependencies still in pull requests

- PadicLocalLanglandsForGL2Qp (§0.1)
- NoncommutativeAndEquivariantIwasawa (§§0.1–0.3, 0.5–0.8, 0.13a, F.1)
- LocallyAnalyticDistributions (§§0.0, 0.2, 0.3)
- DeformationAndDerivedPatchingAlgebra (§1.10)

Suppliers on main: PadicMeasuresIwasawaAlgebras (Layer 0, §§1.2, 1.7), PadicFunctionalAnalysis (§§4.4, 4.7), LieHighestWeight (§9.2, Worked examples), ReductiveGroups (§9B.1, Layer 9D) and ReductiveGroupsPartII (RG2.0.2). All of them are earlier in the merge order or on main.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already met the Lean form:

- one docstring that lists what is not statable, with the carrier each one lacks;
- two definitions with real bodies, on native carriers;
- two headline theorems stated with `sorry`;
- no padding, no sorry'd data and no `set_option`;
- `public import Mathlib` followed by two `TauCeti.*` modules, both of which exist at the pin.

It is byte-identical to the d03e189 file. I found no further headline that is statable at the pins. There is no uniform pro-p predicate, Fréchet–Stein notion or noncommutative p-adic completion at the pins: `AdicCompletion` is a ring only for a commutative ring at an ideal of itself (`Mathlib/RingTheory/AdicCompletion/Algebra.lean`, line 97).

**Signature check.** I appended `#check @name` for all four declarations, and for 71 library names the README cites, to the module and built it once with the permitted command. All of them elaborated. Two cited modules were not prebuilt (`TauCeti.LinearAlgebra.TensorProduct.Balanced.Associator`, `TauCeti.RepresentationTheory.SymmetricAlgebra.FiniteType`), so I confirmed their two declarations at the pinned source instead. Then I restored the file.

The four elaborated types match the README statements:

- `firstCongruenceSL2` and `firstCongruenceProduct` keep `p`, `[Fact p.Prime]` and `m`.
- `isSemisimpleModule_of_finiteDimensional` keeps `p ≠ 2`, both module structures, the scalar tower and `FiniteDimensional ℚ_[p] M`.
- `exists_surjective_algHom_end_symPower` keeps `p ≠ 2`, `m`, `k`, `[Field K]`, both algebra structures, `FiniteDimensional ℚ_[p] K` and the scalar tower.

Nothing changed.

## Supplier replacements, moves and duplication removals

The package left three "What X must provide (gap:…)" requests on suppliers. None of the three suppliers plans what was requested, so each request was a gap. All three are resolved:

1. **Radius algebras.** PadicLocalLanglandsForGL2Qp §0.1 proves that D(H, L) is Fréchet–Stein "with noetherian Banach radius algebras". It never describes those algebras in coordinates. NoncommutativeAndEquivariantIwasawa §0.7 defines saturation but does not prove that ω_U is saturated. Changes:
   - New README §1.5 owns the radius algebras D_r(H, K) in ordered coordinates: the expansions, the norms, submultiplicativity, the graded rings, multiplicativity, noetherianity for r ∈ p^ℚ, flat transitions and the Fréchet–Stein presentation (Schneider–Teitelbaum 2003, Lemma 4.1 to Theorem 4.10, pp. 16–25). It also owns Amice's theorem in d variables; the case d = 1 is PadicFunctionalAnalysis §4.4.
   - §0.1 gains a target: (G, ω_U) is saturated and satisfies (HYP) for odd p (ST03, the Remark after (HYP), p. 20, citing DDMS Lemma 4.10).
   - The Fréchet–Stein property of D(H, L) itself stays with §0.1.
2. **General Fréchet–Stein theory.** The general Fréchet–Stein and coadmissible interface, for an arbitrary noncommutative algebra, is owned by RelativeFarguesFontainePartII §8.4. That roadmap is position 349 in the merge order, later than this one (200). The notion therefore moves down to new README §1.4 here (ST03 §3, pp. 7–12, with exact locators). §1.4 has three Checks, each with computed values. RelativeFarguesFontainePartII §8.4 should cite this roadmap's §1.4 rather than restate it.
3. **Reductive centre.** LieHighestWeight on main has gained §9.2, which gives U(L) ≅ S(z) ⊗ U([L, L]) and Z(U(L)) ≅ S(z) ⊗ Z(U([L, L])) over any field of characteristic zero. That decomposition is now cited. The two statements §9.2 lacks over ℚ_p are now targets here:
   - finite generation of Z(g) (§4.1), by descent from ℚ̄_p with `TauCeti.harishChandraLinearIso`, `TauCeti.linearInvariants_eq_symmetricAlgebraInvariants` and `Representation.finiteType_symmetricAlgebraInvariants`;
   - the split reductive Harish-Chandra homomorphism (§4.2).

Other supplier corrections:

- **LieHighestWeight citations.** That roadmap was restructured on main (its table of former layer numbering). The package's citations of its Layers 0, 3, 5 and 7 now name the native Tau Ceti declarations:
  - `TauCeti.exists_isIrreducible_hasPrimitiveVectorWith`, `TauCeti.exists_hasPrimitiveVectorWith`, `TauCeti.finrank_eq_of_hasPrimitiveVectorWith` and `TauCeti.lieModuleEquivOfHasPrimitiveVectorWith`;
  - `TauCeti.VermaModule` and `TauCeti.vermaCentralCharacter`;
  - `TauCeti.exists_isCompl_of_isKilling`.

  These were added to the Tau Ceti supplier contract (§§3.8–3.10, 4.13, 5.2 and the Dependencies of each layer). "Worked examples, the centre of U(sl₂)" was checked on main and kept.
- **Amice's theorem.** It was cited as LocallyAnalyticDistributions §0.1, which itself takes it from PadicFunctionalAnalysis §4.4 on main. It is now cited there, with a new "From TauCetiRoadmap.PadicFunctionalAnalysis" contract.

The duplication sweep was done by object (completed enveloping algebras, microlocalisation, Arens–Michael, Frommer, radius algebras, Fréchet–Stein, Lazard lattices, principal series, Peter–Weyl, Lie modules, Fu's theorems). It covered main and the open heads via `roadmaps grep`, and the pinned Mathlib and Tau Ceti. It found no other second owner:

- Tau Ceti has congruence subgroups only for Hopf-algebra points (`TauCeti.HopfAlgebra.congruenceSubgroup`) and for SL(ι, ℤ) inline. The `Matrix.SpecialLinearGroup` definition over ℤ_p that `TauCeti.symPowerRep` needs is therefore kept.
- The Peter–Weyl hits elsewhere are real compact groups.
- CompletedCohomologyPartII cites Fu only for completed homology.

No removals were needed, so "Scope and ownership" records the three suppliers above.

Ownership against open pull requests was checked through the tools for all of them.

## Fixes from the final upstream-reviewer read

- §1.4's third Check, in my own first draft, did not compute correctly. I replaced it with a = √p over ℚ_p(√p): stage 0 at q₁ and K from q₂ on.
- §0.1 used (HYP) before §1.5 defined it. The condition is now stated inline.
- The PadicFunctionalAnalysis §4.4 contract claimed a d-variable statement; that section is one-variable, and the contract now says so.
- "The antipode is not optional" (§4.3) became "Without the antipode the statement fails".
- Eight TeX-residue subscripts in the new text were put in code spans.

## Adversarial mathematics pass

The package had computed tables in reviews ~3 to ~7 and FIX~8. I recomputed the items below, with emphasis on new or changed text.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 saturation of ω_U, (HYP) | p = 3, 5; G = ℤ_p; ω = 2 + v_p | p/(p−1) = 3/2, 5/4 < 2 = ω(g_i)+ω(g_j); x ∈ G^{p^n}∖G^{p^{n+1}}, ω = n+1 ≥ 2 ⇒ x = y^p, ω(y) = n; on ℤ_p, ω = 2+v_p gives ω(1) = 2 > 3/2 with 1 ∉ 3ℤ₃ | holds; non-saturated control fails as it should | new target and Check |
| §1.4 Fréchet–Stein, coherent sheaves | A = K; A = K[ε]/(ε²); 𝒪(B°) over ℚ_p(√p), a = √p | q₂((a+bε)(a′+b′ε)) = max(\|aa′\|, \|ab′+a′b\|) ≤ q₂q₂; K ⊗_A (Aε → A) is 0: K → K; q₁(T/a) = p^{−1}/p^{−1/2} = p^{−1/2} < 1, so M₁ = 0 and M_n = K for n ≥ 2 | holds; the nonflat sequence is excluded | new section |
| §1.5 radius algebras | H = 1; ℤ_p at r₁ = p^{−1/p}; null vs bounded; G₁ | ‖T^p/p‖ = p·p^{−1} = 1, ‖T‖ = p^{−1/p}; \|p^{−j}\|·r^{pj} = p^j·p^{−j} = 1 (bounded, not null); ‖exp(px)−1‖_r = r^{ω_U} = r | holds | new section |
| Convention 6, Casimir | sl₂, Sym^k, k = 2 | ef = fe + h ⇒ ½h²−h+2ef = ½h²+h+2fe; on x^k: ½k²+k = ½k(k+2) = 4 at k = 2; κ(h,h) = 8, κ(e,f) = 4, h²/8+(ef+fe)/4 = Δ/4 | holds | none |
| Convention 9, induced parameter | χ = t^c | HC(Δ) = ½h²+h (2fe ∈ n̄U); λ = ½c²+c, 2λ+1 = (c+1)² | holds | none |
| §0.2 index of G₁ | p = 3, 5 | p(p²−1) = 24, 120 | holds | none |
| §2.2/§2.4 norms of log(1+T) | r₁; r_n; p = 3 | terms p^{k−p^{k−n}}: max p^{n−1} at k = n; for k = n+1, p^{n+1−p} ≤ p^{n−2}; \|p^{nk}/k!\|·p^{(n−1)k} ≤ p^{−k(p−2)/(p−1)} → 0 | holds | none |
| §2.2 last Check | p^{−1} < r < p^{−1/(p−1)} | r^p·p < r ⇔ r^{p−1} < 1/p | holds | none |
| §2.5 exp(x) ∉ 𝒰(g) | g = E·x | \|1/n!\|r^n → 0 ⇔ r < p^{−1/(p−1)} < 1 | holds | none |
| §3.1 strictness counterexample | ℚ₃[x, x⁻¹] | Rees ring ℚ₃[t,u,v]/(uv − t²); XY = 0 in gr₂; x⁻¹ has degree 1 in A, −1 in ℚ₃((x⁻¹)) | holds | none |
| §3.3 S₀ for G = 1 | R = ℤ₃ | S₀ = ⋃ 3^a(1+3ℤ₃); 2 ∉ S₀; R_{S₀} = ℚ₃ | holds | none |
| §3.7 functions on G/G^p | b ↦ exp(pu) − 1 | (1+b)^p − 1 = p²u·Σ(p²u)^k/(k+1)!, v_p((k+1)!) ≤ k/(p−1) < 2k, so a unit; M̂ = ℚ_p⟨u⟩/(u) = ℚ_p | holds | none |
| §3.8 PGL₃ example | p = 3 | q = diag(1,1,−2)/3, [q,E₁₃] = (1/3+2/3)E₁₃; det q = −2/27; 1 − 3q = diag(0,0,3); q/3 ∉ 𝔞 (would need 1/3 ∈ ℤ₃) | holds | none |
| §4.1 finite generation (descent) | g = sl₂; G_m; GL₂ | Z(sl₂) = ℚ_p[Δ]; G_m: ℚ_p[x]; GL₂: ℚ_p[I, Δ]; ℚ̄_p ⊗ (Z/B) = 0 ⇒ Z = B | holds | rewritten target |
| §4.1 vanishing quotient | r = p^{−2/3}, λ = p^{−1} | 2/3 > 1/(p−1) for p ≥ 3, so ‖ph‖ = r and ‖h‖ = p^{1/3}; ‖Δ‖ ≤ p^{2/3} < p = \|λ\| | holds | none |
| §4.2 SL₃ antipode | dχ = (1,1,−2), ρ = (1,0,−1) | P(dχ+ρ) = 2·1·(−3) = −6; P(−(dχ+ρ)) = 6; P(ρ) = 0 | holds | none |
| §4.2 GL₂ sign | χ = t₁^{c₁}t₂^{c₂} | S(I) = −I ⇒ λ(I) = −(c₁+c₂) | holds | none |
| §4.2 induced criterion | λ = 1 at p = 3, 5; λ = 3 at p = 3, 7 | 2λ+1 = 3: v₃ = 1, not a square mod 5; 7 ≡ 1 mod 3 is a square in ℤ₃; v₇(7) = 1 | holds | none |
| §4.4 charts and section | G₁ at p = 3; SL₂(ℤ_p); non-normal B | det[(4,3),(3,5/2)] = 10−9 = 1, x = 3/4, lower(3/4)·[(4,3),(0,1/4)] has lower-right 9/4+1/4 = 5/2; L(p)U(p)L(−p) = [(1−p²,p),(−p³,1+p²)], det = 1−p⁴+p⁴ = 1 | holds | none |
| §4.7 symbols | r′ ∈ (1/p, p^{−1/2}) | ‖p log(1+H)‖ = p^{−1}r′ < r′²; \|p²λ\| ≤ p^{−2} < r′²; at r_n the symbol is p^{−2n}(½H²+2EF)^{p^n} | holds | none |
| §4.9 Frobenius pairing | ℚ[u]/(u²−2) over C₂ | α(f) = u/2; β(u/2)(u) = pr₁(1) = 1, β(u/2)(1) = 0; the cocycle-free formula gives 1/2 | holds | none |
| §4.12 | λ = 1, p = 3 | a = −1+√3, a(a+2)/2 = (3−1)/2 = 1 | holds | none |
| §5.1 dimensions | n = 0, 1, 2, 3 | C(n+3,3) − C(n+1,3) = 1, 4, 9, 16 = (n+1)² | holds | none |
| Lean `isSemisimpleModule_of_finiteDimensional` | m = 0; M = 0; I/I² for G₁ | ℚ_p ⊗ ℤ_p[[1]] = ℚ_p; G₁^ab is finite, so I/I² is finite and every ℤ_p-linear map I/I² → ℚ_p is 0 (no wild self-extension of the trivial module) | holds | none |
| Lean `exists_surjective_algHom_end_symPower` | m = 0; k = 0; k = (1), m = 1 | End_K(K) = K (augmentation); dim End(K²) = 4 = (1+1)²; surjective for every Φ by Zariski density and Burnside | holds; `[FiniteDimensional ℚ_[p] K]` is not needed for truth (P3 note) | none |

## Unresolved

- **Which version.** The board's package directory and its `review.json` (`needs_changes`) predate the round 3–8 repairs. The port uses the round-8 head d03e189, which no review has examined. The worker should confirm that this was the accepted version.
- **Fréchet–Stein ownership.** §1.4 now owns the general Fréchet–Stein interface that RelativeFarguesFontainePartII §8.4, later in the merge order, also states. That roadmap should cite §1.4.
- **Radius algebras overlap.** §1.5's Fréchet–Stein presentation overlaps PadicLocalLanglandsForGL2Qp §0.1's "noetherian Banach radius algebras" for D(H, L). The README keeps the Fréchet–Stein property itself with §0.1 and owns only the coordinate description.
- **Untrusted text.** No suspicious instruction-like passages were found in fetched or read material. A sandbox hook declined one local `python3 -c` command that I used to locate a TeX hit; I located it by reading instead.


Pull request: #2283 (roadmap/locally-analytic-distributions-part-ii at d3a9192)
