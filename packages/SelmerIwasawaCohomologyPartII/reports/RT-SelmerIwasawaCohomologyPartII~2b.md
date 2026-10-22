<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/589#issuecomment-6334509995 -->
Red team round 2 pass b (claude) of 120054d

Verdict: needs_changes

1. **F01** (P3) Five of the ten sorried theorems are one tactic each from the pinned Mathlib

   **Location:** `packages/SelmerIwasawaCohomologyPartII/Suggested.lean:86–90` (`definiteDiagonalPeriod_add`), `:94–97` (`_smul`), `:101–105` (`_map`), `:108–113` (`_reindex`), `:126–131` (`_exists_ne_zero`).

   **Claim:** These five are stated as sorried targets, but each is a direct instance of a finite-sum lemma (`Finset.sum_add_distrib`, `Finset.mul_sum`, `map_sum`, `Equiv.sum_comp`, `Finset.sum_eq_zero`). They carry no roadmap content; left sorried they read as work and a port counts them among the open targets. The remaining five (`definiteDiagonalPeriod_fiber` and the four `specialInertPlace` instances) are genuine.

   **Witness:** A probe copy of the file with the five proofs below elaborates under the project's pinned toolchain (`lake env lean`) with exactly the five remaining `sorry` warnings and no other diagnostic.

   **Exact repair text:** replace the five `sorry` bodies by, respectively:
   `simp [definiteDiagonalPeriod, Finset.sum_add_distrib]`;
   `simp [definiteDiagonalPeriod, Finset.mul_sum]`;
   `simp [definiteDiagonalPeriod, map_sum]`;
   `exact Equiv.sum_comp e (fun s => f (a s, b s))`;
   and for `_exists_ne_zero`: `by_contra hne` / `push Not at hne` / `exact h (Finset.sum_eq_zero fun s _ => hne s)`.
   Keep the statements and docstrings; §5.1's API list (README:658–663) stays as written since it already describes them as finite-sum identities.

2. **F02** (P3) The title lower-cases proper names

   **Location:** `packages/SelmerIwasawaCohomologyPartII/README.md:1`: “# Roadmap: arithmetic level raising, diagonal reciprocity and rankin–selberg selmer ranks”.

   **Claim:** Lower-case titles are used on `main`, but they keep proper names capitalised; here “Rankin–Selberg” and “Selmer” are not, while the body of the same README writes them capitalised throughout.

   **Witness:** `TauCetiRoadmap/LocalGaloisGroups/README.md:1` “local Galois groups of p-adic fields” and `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1` “Galois groups of polynomials” (first lines on `main`); README:3 “Rankin–Selberg”, README:21 “Selmer”.

   **Exact repair text:** “# Roadmap: arithmetic level raising, diagonal reciprocity and Rankin–Selberg Selmer ranks”.

3. **F03** (P3) Doubled word

   **Location:** `packages/SelmerIwasawaCohomologyPartII/README.md:921`: “The the one-place annihilator construction of 7.3”.

   **Claim:** A doubled article.

   **Witness:** the quoted text.

   **Exact repair text:** “The one-place annihilator construction of 7.3 produces c₁ …”.

## Verified sound

Read all 982 README lines, all 157 Lean lines and the 6-entry manifest. Elaborated `Suggested.lean` as submitted under the project's pinned toolchain (`import Mathlib` at the pin): the only diagnostics are the ten `sorry` warnings; no error, no linter warning, no `set_option`, no `lemma`, one import.

Counts: 17 Lean declarations read (2 definitions, 10 sorried theorems, 5 proved examples); 40 numbered subsections and 55 bold API targets read; 98 Check bullets read, 24 recomputed; 21 declared gaps checked for an owner and a slug; 24 supplier sections checked against `main` and the merge order; 9 locators verified in the cached legal copies; the pinned `Algebra.IsUnramifiedIn` read at its definition.

Locators verified: ltxzz-published Definition 3.3.2 (reflexive closure, line 1542), Remark 3.3.3 (line 1545) and Definition 3.3.4 (special inert: inert, odd unramified, degree one; very special: splits completely in F⁺rflx; lines 1549–1556), as §1.5 states them; ltxzz Definition 8.1.1 with L1–L7 exactly as §1.6 lists them, including L3 on the characteristic-zero tensor and L4 on the residual factors (lines 6368–6384); Theorem 7.2.8(3) with the factor (p+1)·φΠ₀(I°)·φΠ₁(T°) and the sum over Sh(V°_n,K°_sp) (lines 6044–6050), as §5.5 and the “First normalization” Check state; Proposition 4.5.5 Cartesian for even n with the remark that it fails on the nose for odd n ≥ 3 (lines 2286–2297), as the special-map contract and §6.2 state; the cuspidal concentration and the Hochschild–Serre coboundary before Theorem 8.3.2 (lines 6767–6772), as §4.3 states; liu-tian Theorem 4.7 with its target H¹(𝔽_{p^{2g}}, H^g(…, O_E/λ((g+1)/2))/m) (lines 1496–1500), as §8.5 states.

Lean carriers: `Algebra.IsUnramifiedIn A 𝔭` is “every prime of A over 𝔭 is unramified” (Mathlib/RingTheory/Unramified/Locus.lean), so the `specialInertPlace` clause on `Ideal.span {(v.absNorm : ℤ)}` is “p unramified in F” as README:256 says; prime absolute norm gives residue degree one; a prime extended ideal in a quadratic extension is inertness; the four `specialInertPlace` statements are true as stated (3 inert of norm 9, 5 split, 2 even, p² not prime). The five `definiteDiagonalPeriod` examples mirror the five period Checks of README:678–682 one for one.

Checks recomputed and found correct: weight (n₀−1)+(n₁−1)−2n = −1; arithmetic Frobenius 9 on Eλ(1) at a norm-9 place; hγ = −I for γ = (I,−1)c (the c-conjugate of (I,−1) is (−I,−1)); the C₂ two-point torus trace with 𝔽₂ coefficients; hecke_rank2 (S(I) = 3(10/3+2) = 16, S((q+1)R−I) = 0) and hecke_rank3 (S(T) = 9/2, S(I) = 105/2) against the supplier's displayed even and odd identities; the two reflect identities; Strata normal sign (±16 for a plane quartic); Incidence scalar (−16 and 4 at p = 3); Singular invariants not coinvariants over ℤ₃; the Chern relation η² + ρ*(a+b)η + ρ*(ab) = 0 on ℙ_lines(L₀⊕L₁), the section classes η+ρ*b, η+ρ*a, their restrictions −a, −b, the section normals L₀∨⊗L₁ and L₁∨⊗L₀, ρ!η = 1, ρ!(η²) = −(a+b), and the two exceptional normal bundles O_E(−1) and O_E(−1)⊗ρ*(L₀⊗L₁)∨ (the second via ℙ(N∨) ≅ ℙ(N)); Product quartic section (D₁² = −16, ρ!(η²) = −b); First tensor not factors over 𝔽₁₁ (P₀′(3) = 10, P₀(−1) = 9, P₁′(1) = 10, P₁(−3) = 1, tensor root 3 double); First adjoint negative control over 𝔽₇ ((P−2)f = 0, ⟨(P−2)e₀,f⟩ = 2, Pᵗf = 4f); Second polynomial domain over 𝔽₁₉ (reciprocal pairs, P₀′(3) = 11, P₁′(1) = 13, tensor root 3 simple with derivative 4, P₀(−1) = 0); Detection rank two, primitive kernel, bounded loss and perfect pairing exponent over A₅; Rigid special simple pair ({5,1} in 𝔽₁₁) and double pair ({4,17} twice in 𝔽₁₉); Potential invariants/coinvariants over 𝔽₃; Basic N2/N3 and Diagonal n2 dimensions; the width bound 2n−1 ≤ (ℓ−2)/2 from ℓ > 4n; the Lefschetz exceptions N−2 and 2N−2 for the degree-(p+1) link in the balloon ℙ^{N−1}-bundle.

Merge order and ownership: the package sits at position 141 of 151; every supplier is above it (lowest ReductiveGroupsPartII 20, highest IgusaVarietiesAndTorsionConcentration 140) or on `main` (EtaleCohomologyFoundations, StableReduction, ProfiniteCohomology, Chebotarev, SchemeAndStackFoundations). The dependency gate returned exactly:

```text
depcheck: 8 roadmaps, 69 edges, 0 problem(s)
```

The 21 gaps each name one owner and no object has two owners. The single consumer, PeriodsAndSpecialValues, is an open package on the job board and supplies nothing here. No process words or pull-request numbers in the README or the docstrings. The diff against `main` touches only this package.

Not re-raised: the five findings of round 2 pass a (S01–S05) and the repaired round-1 findings were read and are not repeated; F01 above concerns the sorried period theorems, which no earlier finding addressed (round 1 pass b F08 asked for the definition and its examples, both now present).

## Not verifiable

- **Imported Hecke formulas:** hecke_rank2 and hecke_rank3 were recomputed against a local copy of the SmoothRepresentationsOfLocalGroups README dated 2026-10-12, not against that roadmap's current head.
- **Source-specific geometry:** the incidence matrices of §2.5, the link index count of §2.4 and the three-branch E₁ page of §2.6 were checked for internal consistency (parity, signs at p = 3, column ranges), not re-derived from ltxzz Appendix B and §5.
- **Declared gaps:** the 21 supplier contracts were checked for ownership, direction and slug agreement, not for existence at the suppliers' current heads; acceptance of the package's eventual theorems remains conditional on those contracts.
- **Analytic and geometric carriers:** the unitary moduli, nearby-cycle and Selmer carriers are specified in prose only; no Lean signature for them was tested.
