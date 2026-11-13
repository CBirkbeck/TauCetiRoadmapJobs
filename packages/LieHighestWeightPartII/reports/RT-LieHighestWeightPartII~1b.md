<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12954#issuecomment-6856637926 -->
Red team round 1 pass b (claude) of baef69d

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) Chevalley restriction is cited to LieHighestWeight Layer 7 as owner; it is at the pin and main no longer plans it

   **Location.** `packages/LieHighestWeightPartII/README.md:14` ("LieHighestWeight Layer 7 owns
   Chevalley restriction, by which the `L`-invariant polynomial functions on `L` restrict
   isomorphically onto the `W`-invariant polynomials"), `:92` (supplier contract, "Layer 7: Chevalley
   restriction"), `:381` (proof plan of §3.1), `:389` (`*Needs:*` "LieHighestWeight Layers 1, 7
   (Chevalley restriction)"), `:472` (Layer 3 Dependencies).

   **Claim.** The surjectivity of restriction onto the `W`-invariants is a target of LieHighestWeight
   Layer 7.

   **Witness.** Pinned Tau Ceti `TauCeti/Algebra/Lie/HighestWeight/ChevalleyRestriction.lean:136`
   `LieSubalgebra.map_lieInvariants_lieCartanRestriction` and `:151`
   `LieSubalgebra.lieChevalleyRestrictionIso`. LieHighestWeight on main, Scope (README lines 35–38)
   lists them as inputs and says a consumer cites the declaration, not a layer.

   **Repair.**

   - Line 14: replace the clause "LieHighestWeight Layer 7 owns Chevalley restriction, by which … of
     which §3.1 uses the surjectivity; and the Serre presentation" by "Chevalley restriction is Tau
     Ceti's (`LieSubalgebra.map_lieInvariants_lieCartanRestriction`,
     `LieSubalgebra.lieChevalleyRestrictionIso`, below), of which §3.1 uses the surjectivity.
     LieHighestWeight Layer 7 owns the Serre presentation".
   - Under `### From Tau Ceti` add: "From `TauCeti/Algebra/Lie/HighestWeight/ChevalleyRestriction.lean`,
     for a finite-dimensional Killing Lie algebra over an algebraically closed field of characteristic
     zero with a splitting Cartan subalgebra `H`:
     `LieSubalgebra.map_lieInvariants_lieCartanRestriction`, the image of the invariants
     `TauCeti.SymmetricAlgebra.lieInvariants K L L` under `TauCeti.lieCartanRestriction H` is the
     algebra `TauCeti.linearInvariants H` of Weyl invariants, and
     `LieSubalgebra.lieChevalleyRestrictionIso`, the resulting isomorphism."
   - Line 92: delete "Chevalley restriction (the `L`-invariant polynomials … is such a restriction),
     and" so that the Layer 7 entry begins "Layer 7: the Serre presentation of a simple algebra …",
     and add Chevalley restriction to the list of what is "consumed from Tau Ceti (above)".
   - Line 381: replace "(Chevalley restriction, LieHighestWeight Layer 7)" by
     "(`LieSubalgebra.map_lieInvariants_lieCartanRestriction`)".
   - Lines 389 and 472: replace "LieHighestWeight Layers 1, 7 (Chevalley restriction)" and
     "LieHighestWeight Layers 1, 7, 8" by the same lists without the Chevalley attribution, adding
     `LieSubalgebra.map_lieInvariants_lieCartanRestriction` to the Tau Ceti names (§3.1 keeps Layer 7
     only if it still uses the Serre presentation; it does not, so §3.1 needs Layer 1's replacement of
     R04 only).

   The pinned statement is on `SymmetricAlgebra K L` through the Killing identification
   (`TauCeti.lieCartanRestriction`), while `TauCeti.SymmetricAlgebra.lift_eval_smul_of_mem_intLieAlgebra`
   is cited at line 80 for the symmetric algebra of `L*`; the repair worker states which
   identification §3.1 uses (`TauCeti.killingSymmetricEquiv`, named in LieHighestWeight's
   former-statement table, main README line 96).

2. **F02** (P2) The parity of the invariant form on `V(n)` has an owner on main

   **Location.** `packages/LieHighestWeightPartII/README.md:7` ("This roadmap owns … the explicit
   invariant forms on the standard `sl₂`-modules and their parity") and `:302` (§2.1, third API
   bullet: "`β_n` is symmetric when `n` is even and alternating when `n` is odd").

   **Claim.** The symmetry type of the invariant form on `V(n)` is owned here.

   **Witness.** LieHighestWeight on main, §5.1 (README lines 1484–1503) and
   `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/Suggested.lean:210`
   `invariantForm_isSymm_iff_tits_sign`: a nonzero invariant form on `L(λ)` is symmetric iff
   `(−1)^(λ(2ρ∨)) = 1`. For `sl₂`, `2ρ∨ = h`, `λ(h) = n`: sign `(−1)^n`; its Checks compute `V(1)`, `V(2)`.

   **Repair.**

   - Line 7: replace "the explicit invariant forms on the standard `sl₂`-modules and their parity" by
     "the explicit invariant forms `β_n` on the standard `sl₂`-modules (their symmetry sign is the
     rank-one case of LieHighestWeight §5.1)".
   - Add to the ownership list: "LieHighestWeight §5.1 owns the symmetry sign of the invariant form on
     a finite-dimensional irreducible module (`invariantForm_isSymm_iff_tits_sign`): symmetric exactly
     when `(−1)^(λ(2ρ∨)) = 1`. §2.1 consumes its `sl₂` case, where `2ρ∨ = h` and the sign is `(−1)^n`,
     and adds only the explicit Gram matrix."
   - Line 302: append "This is the case `L = sl₂`, `λ(h) = n` of LieHighestWeight §5.1; the Gram
     matrix gives it directly, `β_n(w_k, w_j) = (−1)^n β_n(w_j, w_k)`, and the two agree: `n = 1`
     gives `−1` (alternating), `n = 2` gives `+1` (symmetric)."
   - Line 312 (`*Needs:*` of §2.1) and line 371: add "LieHighestWeight §5.1 (symmetry sign)".

   Tested on the instance: `β_1 = [[0, 1], [−1, 0]]` is alternating and `(−1)^1 = −1`; `β_2` is
   anti-diagonal `(1, −1, 1)`, symmetric, and `(−1)^2 = 1`.

3. **F03** (P2) GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 is described as a consumer; at its head it plans the same recognition independently

   **Location.** `packages/LieHighestWeightPartII/README.md:24` ("The weight recognition of real
   Satake classes in GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 is a consumer of them, not a
   second owner: it keeps only what is particular to Satake parameters") and `:612` ("§8.0 is such a
   consumer").

   **Claim.** That section consumes §§5.3–5.5 and adds three items only.

   **Witness.** GlobalShtukasAndFunctionFieldLanglandsPartII README at its head, §8.0 (lines
   1205–1232): it defines `n_(ν,τ)`, proves recognition by its own route (characters, "ReductiveGroups
   §§10A–10B"), cites the same CH Proposition 10.2, and its `*Needs:*` line does not name
   LieHighestWeightPartII (0 occurrences in the file).

   **Repair.** This roadmap is earlier in the merge order (position 241 against 367), so it stays the
   owner; the sentences must describe the sibling as it is. Line 24, replace the two sentences from
   "The weight recognition of real Satake classes" to "the Aubert-involution identity of that
   section." by: "GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 states the same recognition for
   Frobenius-fixed real parts `ν`, with its own proof from Weyl characters. This roadmap, earlier in
   the merge order, owns the absolute statement of §5.5, and the reduction of that section's
   statement to §5.5 is given under Downstream consumers; what is particular to that section is the
   normalization of real parts by the residue cardinality, which compares places with different `q`,
   the passage from absolute Weyl conjugacy to conjugacy under the relative Weyl group on the
   Frobenius-fixed real space, and its Aubert-involution identity." Line 612, replace
   "GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 is such a consumer." by "The recognition of
   GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 follows from §5.5 as follows." The repair report
   records that the sibling's §8.0 must cite §§5.3–5.5 instead of proving recognition again; that
   edit is outside this package.

4. **F04** (P3) Citations by LieHighestWeight's and RootSystems' former numbering describe layers that now hold other mathematics

   **Location.** `packages/LieHighestWeightPartII/README.md:14` ("Its Layer 9 owns the diagonal Cartan
   subalgebra of `gl_n` and `sl_n` … Its Layers 0–6 own `sl₂` theory, root-space decompositions,
   weights, Verma modules, the classification … Weyl's theorem and characters"), `:92` (the Layer 0–9
   contract), `:22` and `:100` (RootSystems Layers 4–6), and the `*Needs:*` lines that repeat them.

   **Claim.** Each cited layer states what the contract paragraph attributes to it.

   **Witness.** LieHighestWeight on main, lines 74–81: former Layers 0, 1, 2, 4, 5 are now pinned
   declarations; the present Layer 0 is "normalized rank-one tensor comparisons", Layer 3 the PBW Rees
   algebra, Layer 5 "opposition and invariant forms", Layer 9 `gl_n` only. RootSystems on main, lines
   1128–1139: old Layers 4–6 are native.

   **Repair.** The mapping tables keep the former labels resolvable, so no citation is dead; the
   descriptions are what is wrong. In line 92 rewrite the entries as the suppliers now give them:

   - "Layer 0" → "`sl₂` theory (former Layer 0): Tau Ceti `TauCeti.exists_int_of_hasEigenvalue`,
     `TauCeti.Sl2Std.exists_isInternal_lieModuleEquiv` (above)";
   - "Layer 1" → "root-space decomposition (former Layer 1): Mathlib `LieAlgebra.IsKilling.rootSystem`,
     `LieAlgebra.IsKilling.finrank_rootSpace_eq_one`";
   - "Layer 2" → "weights (former Layer 2): Mathlib `LieModule.genWeightSpace`; the additivity of
     `ρ(h)`-eigenvalues on `M ⊗ N` and their sign change on `M*` used in §1.4 are elementary and are
     proved there";
   - "Layer 3" → delete the entry (the weight statement is the Tau Ceti lemma already cited);
   - "Layer 4" → "finite-dimensional irreducibles (former Layer 4): Tau Ceti
     `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`,
     `TauCeti.irreducibleQuotient`, `TauCeti.finiteDimensional_irreducibleQuotient_of_isDominantIntegral`";
   - "Layer 5" → "complete reducibility (former Layer 5): Tau Ceti `TauCeti.exists_isCompl_of_isKilling`;
     the present §5.1 is cited for the invariant-form sign (R02)";
   - "Layer 9" → "the diagonal Cartan subalgebra of `sl (Fin (r+1)) K`: Tau Ceti
     `TauCeti.specialLinearDiagonalCartan` in `TauCeti/Algebra/Lie/SpecialLinear/Diagonal.lean`; that
     its root system has type `A_r` is part of the target §2.0, not of LieHighestWeight Layer 9".

   Make the same substitutions in line 14 and in the `*Needs:*` and Dependencies lines of §§1.3, 1.4,
   2.1, 2.2, 2.3, 2.4, 3.2 and 4.1. For RootSystems (lines 22, 100) write "former Layers 4–6" and name
   the native replacements of its table (main README lines 1136–1138). All pinned names above were
   found at the pin (files listed under Verified sound).

5. **F05** (P3) §2.0 attributes the Killing property of `sp` and `typeB` to ReductiveGroups only; it is at the pin

   **Location.** `packages/LieHighestWeightPartII/README.md:17` ("Tau Ceti owns the same for
   `LieAlgebra.Orthogonal.typeD (Fin n) K`, `n ≥ 4`") and `:282` ("For `sp`,
   `LieAlgebra.Orthogonal.typeB` and `LieAlgebra.Orthogonal.typeD` the matrix root bases, Killing
   nondegeneracy and simplicity are ReductiveGroups Layer 9A").

   **Claim.** At the pin only type `D` has its Killing property.

   **Witness.** Pinned `TauCeti/Algebra/Lie/Orthogonal/TypeB/Killing.lean:41` `TauCeti.isKilling_typeB`
   (every finite index type, characteristic zero); `TauCeti/Algebra/Lie/Symplectic/Killing.lean:160`
   `TauCeti.hasTrivialRadical_sp`; `TauCeti/Algebra/Lie/GeneralLinear/Radical.lean:383`
   `TauCeti.SpecialLinear.instHasTrivialRadicalSl`.

   **Repair.** Line 282, after the sentence on `TauCeti.TypeDStd.isKilling_typeD`, add: "Killing
   nondegeneracy alone is in Tau Ceti for the other families over every field of characteristic zero:
   `TauCeti.isKilling_typeB` for `LieAlgebra.Orthogonal.typeB ι K`, and trivial radical, hence
   Killing by Mathlib's `LieAlgebra.HasTrivialRadical.instIsKilling`, for `sp` and `sl`
   (`TauCeti.hasTrivialRadical_sp`, `TauCeti.SpecialLinear.instHasTrivialRadicalSl`).
   ReductiveGroups §9A.1b supplies the matrix root bases and simplicity." Line 17: replace "Tau Ceti
   owns the same for `LieAlgebra.Orthogonal.typeD (Fin n) K`, `n ≥ 4`" by "Tau Ceti owns the Killing
   property of `sp`, `sl` and `LieAlgebra.Orthogonal.typeB`, and Killing nondegeneracy with simplicity
   for `LieAlgebra.Orthogonal.typeD (Fin n) K`, `n ≥ 4`". Add the three names to the `*Needs:*` line of
   §2.0 and to the From Tau Ceti contract.

6. **F06** (P3) Page range of the Ciubotaru–Harris tables

   **Location.** `packages/LieHighestWeightPartII/README.md:454` ("CH Tables 2–4 (`E₈`, `F₄`, `G₂`;
   pp.36–37, CH lines 1734–1837)") and `:625`.

   **Claim.** The tables are on pp.36–37.

   **Witness.** CH line 1734 (the header row of Table 2) precedes the page marker of p.36 at CH line
   1735: Table 2 begins on p.35.

   **Repair.** Write "pp.35–37" in both places and in the `locator` of `CH` in `sources.toml`.

No statement of `Suggested.lean` or bold README target was found false. The blocking findings are
supplier drift against LieHighestWeight as it is on main since its last revision, one object with a
second owner on main, and a sibling described as a consumer that plans the same theorem itself.

## Verified sound

**Dependency check** (the command of the brief): `depcheck: 223 roadmaps, 1977 edges, 0 problem(s)`;
no UPWARD or CYCLE line.

**Counts.** Declarations read: 14 of 14 (the structure `IsSl2TripleOrZero`, the definitions
`weightFiltration`, `weightPattern`, `IsGeometricPoint`, `IsPositiveRealPart`, and 9 theorems).
README: all 628 lines, 23 subsections, 9 named theorem targets. Locators verified against the
cached texts: 33 (CH 19, DG 6, SOM 2, KIR 6). Checks: all 107 Check bullets read; every one with a
numerical value was recomputed (the exceptional ones by an independent root-system computation),
none found false. Library names resolved at the pins: all 104 backticked Mathlib and Tau Ceti
names of the README, and the 11 further names used in the repairs above. Sibling citations checked:
LieHighestWeight (main), NilpotentOrbits N0.2, N0.3, N2.1, N2.2, N2.4, N4 (main; they are items 2,
3 of N0 and 1, 2, 4 of N2), ReductiveGroups Layers 1–7, 5P, 9A, §9A.1, 9B, 9D, 10B (main),
ReductiveGroupsPartIII §0.3 and §0.5 (open head), RootSystems (main), SpinRepresentations Layer 5
(main), NoncompactQuantumSymmetry Layer 3 (open head, line 1038), SmoothRepresentationsOfLocalGroupsPartII
(open head). The `#check @name` comparison was made on the elaborated signatures supplied with the
job (no Lean was run in this pass): each of the 14 types keeps every binder its README statement
needs; nothing changed.

**Imports and form.** `import Mathlib` and six `TauCeti.*` modules, each present at the pin and
each used. No `lemma`, `set_option`, `#check`, `#eval`, `True`, sorry'd data; 277 lines. No
pull-request number or process word in the README or docstrings. Only the package folder is
changed by the pull request.

**Headline theorems.** Filtration recognition (§4.1), classical recognition in types `A`, `C`,
`B`/`D` away from very even partitions and split `D` with `S⁺` (§2.4), exceptional adjoint
recognition (§3.4), the filtration–restriction equivalence (§1.3), the half-integrality test
(§5.2, Lie form), recognition of the positive real part (§5.5): all stated. Not statable and named
in the module docstring: the finite test family of §4.1; the group form of §5.2. No declaration is
padding: none follows from one library lemma (the half-integrality test needs the cone lemma, an
induction over `TauCeti.posRootCone` and `genWeightSpace_ne_bot`).

**Adversarial table (statements).**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsSl2TripleOrZero` | `(0,0,0)`; `(H,E,F)`; `(0,E,0)`; `(−H,F,E)`; `sl(2,𝔽₂)` `(0,E₁₂,0)`, `(0,E₁₂,E₂₁)` | holds; holds; `[0,E]=0≠2E`; `[F,E]=−H`, `[−H,F]=2F`; all brackets `0`; `[E₁₂,E₂₁]=diag(1,1)≠0` | sound |
| `weightFiltration` | adjoint of `sl₂`; `V(1)`; zero module; zero triple | `1,1,2,2,3` at `−2..2`; `0,1,1,2`; all `0`; `0` for `i<0`, `M` for `i≥0` | sound |
| `finrank_weightFiltration_eq_iff_exists_intertwiner` | `V(2)` vs `V(0)⊕V(1)`; zero triple on `M` vs trivial `K^dim M`; `M=M'=0` | `(1,1,2,2,3)` vs `(0,1,2,3,3)`, no intertwiner; equal, any linear iso intertwines; both sides true | sound both directions; `IsAlgClosed` not needed (note only) |
| `…_sl` | `n=∅`, `n=1`; `sl(3)` zero/minimal/regular | `sl=0`; jumps `3@0`, `1@−1,0,1`, `1@−2,0,2` pairwise distinct | sound |
| `…_sp` | `l=∅`; `sp(2)`; `sp(4)` `(3,1)` excluded, `(2,2)` | zero algebra; `2@0` vs `1@±1`; parity of odd parts | sound |
| `…_so` | `n=0`; `n=1,2`; `n=4` `(2,2)`, `(3,1)`; `so(8)` `(4,4)` | `ker h = ⊥`, vacuous; only zero triple; `(2,2)`: `ker h = 0` excluded, `(3,1)`: kernel `≠0`, one class; `(4,4)` excluded | sound |
| `…_typeD` | `|ι|=0,1`; `|ι|=2` four classes `(0,0),(t,0),(0,t),(t,t)`; `|ι|=3`; `ι=Fin 4`, `(4,4)` and `(2,2,2,2)` | zero triple only; standard `4V(0)`, `2V(1)`, `2V(1)`, `V(2)⊕V(0)` and `S⁺` separates `(t,0)`,`(0,t)`; no very even partition of `6`; tops `4`/`3` and `2`/`1` | sound |
| `…_adjoint_exceptional` | candidate sets recomputed for all five types | `|C_T| = 7, 28, 34, 274, 245`, distinct profiles `7, 28, 34, 274, 245`; `|Φ| = 12, 48, 72, 126, 240`; `ht θ = 5, 11, 11, 17, 29` | sound |
| `exists_innerAut_iff_finrank_weightFiltration` | `L=0`; `sl₂×sl₂` `(t,0)` vs `(0,t)`; `so(8)` `(4,4)` | trivial; first-factor standard pullback `1@±1` vs `2@0`; `L(ω₄)` tops `4`, `3` | sound (also follows from the pinned Chevalley restriction and §0.3 without case analysis) |
| `forall_weight_halfIntegral_iff_highestWeight` | `sl₂`, `ν(α)=½`: `V(1)`, `V(3)`, Verma `λ(H)=−2,−1`; `ν(α)=⅓`, `V(3)`; reducible `V(1)⊕V(0)` | `±¼∉½ℤ` both sides false; `¾`,`¼` both false; `−(k+1)/2` both true; `−¼−k/2` both false; hypothesis fails; irreducibility fails | sound |
| `weightPattern` | `diag(q^½,q^−½)`; tensor square; Jordan block at `q^½`; `q≤0` | `1@±1`; `1,2,1@2,0,−2`; `1` at `i=1`; `√q=0`, only `i=0` matches norm `1` | sound; junk values harmless |
| `IsGeometricPoint` | `diag(2,½)` at `q=4`, `q=3` | `2=4^½` yes; `2∉3^(ℤ/2)` no | sound |
| `IsPositiveRealPart` | `G_m`, `s=2i`; unipotent `u`; `μ=0` | `r=2`; both `u` and `1` satisfy it; eigenspace `0` trivial | sound; determines `r` only for semisimple `s`, as stated |
| `exists_conj_positiveRealPart_of_weightPattern_eq` | `SL₂` `diag(i,−i)` vs `1`; `diag(q^½,q^−½)` vs inverse; `G_m` `2i` vs `2`; trivial group; `q=3`, `diag(2,½)` vs `diag(5,⅕)` | `r=r'=1`; Weyl conjugate; `r=r'=2`; `g=1`; equal patterns but geometric hypothesis fails | sound; `1<q` not needed for truth (note only) |

**README computations recomputed.** §1.3–1.4 multiplicities and the dual index shift
(`W_i(M*) = Ann W_(−i−1)(M)`, on `V(1)` at `i=−1,0`); `sl(3)` adjoint `(1,2,2,2,1)` and
`4,2,2,0,0,−2,−2,−4`; §2.1 invariance of `β_n` under `h`, `e`, `f`, determinant `1`, the trace form
`= −2β_2`; KIR (5.4) gives `w_j = j! v_j` and `ρ(e)w_j = j(n−j+1)w_(j−1)`; §2.2 parity conditions
and the determinant `(−1)^(n+1)`; §2.3 tops `A`, `A−a_r` and the minuscule Check; §3.1 `G₂`
`(2,0)`: `4,0,2,0,1,0,2`; §3.2 all profiles listed; §3.3 `E₆` without opposition: `212` vectors,
`123` profiles; §3.5: every one of the `70 + 16 + 5` rows of CH Tables 2–4 equals `D_T(a)` for a
candidate `a`, with `i_max` equal to the row length minus one and all rows distinct; §5.2 Verma
computations; §5.3–5.5 Checks. Conventions: pinned `TauCeti.DynkinType.cartanMatrix` is
`CartanMatrix.G₂ᵀ = [[2,−1],[−3,2]]` and `CartanMatrix.F₄` with `A₂₃ = −2`, as the README says.

**Ownership.** No declaration of `Suggested.lean` has the fully qualified name of a declaration of
another roadmap. §0.3 against NilpotentOrbits N2.2/N2.4 (over `ℂ`, adjoint `G`) and §0.2 against
NoncompactQuantumSymmetry Layer 3 (real Lie groups) are kept variants with a stated difference.
The pins contain no weight filtration, zero-inclusive triple, weight pattern or positive real part.

**Note (not a finding).** Open roadmaps declare contracts against this roadmap that it does not
plan: SmoothRepresentationsOfLocalGroupsPartII (reductive centralizer of a triple, graded open
orbit, Bala–Carter lists with centralizer types), SheafConvolutionOnAbelianVarieties
(`gap:minuscule-weight-table`), TwistedAutomorphicDescents (`gap:rational-nilpotent-orbits`,
`gap:classical-dominance`; the Scope here already says the last two are not treated).

## Not verifiable

- That each named row of CH Tables 2–4 carries the weighted diagram DG assigns to the orbit of that
  name (§3.5): checked for the `G₂` rows and the `F₄` rows `A1`, `~A1`, principal and zero by orbit
  dimension `dim L − D_0 − D_1`; the other rows were only matched to some candidate profile.
- ReductiveGroups Layers 2, 3, 5P, 6, 9B, 9D, 10B and ReductiveGroupsPartIII §§0.3, 0.5: the
  sections exist with the cited subject; their hypotheses were not compared line by line with each
  use in §§0.2, 0.3, 5.4, 5.5.
- The numbering of the published versions of CH, DG and KIR (the README cites the preprint and
  draft numbering and says so).
- No Lean was elaborated in this pass (read-only brief); the signature comparison rests on the
  supplied elaborated types.

Source independence: 12 passages compared with 4 sources, none shared; largest share CH, 24 of 37 locators; contents compared with CH: independent (CH's sections 2, 6.12, 10.1 and its appendix are spread over Layers 0–5, which are ordered by the dependency lines §0.3 → §3.4 → §4.1 and §5.4 → §5.5; no layer is a CH section).

## Source issues

- **Misprint** in CH at Appendix, proof of Lemma 10.9, p.35 (CH lines 1720–1725): the source says the simple roots are `±ε₁+ε₂, ε₂−ε₃, …` and takes neutral elements with ascending positive odd coordinates as dominant; it should be `±ε₁+ε₂, ε₃−ε₂, …, ε_n−ε_(n−1)` for ascending coordinates; affects nothing.
- **Misprint** in CH at Tables 2–4, pp.35–37 (CH lines 1734, 1813, 1831): the source heads the columns as dimensions of the filtration steps; it should be dimensions of the graded pieces, the entries not being increasing; affects nothing.
- **Gap** in CH at Appendix, proof of Lemma 10.9, p.35 (CH lines 1731–1733): the source says the adjoint statement for `E₈` implies it for the Levi subalgebras `E₆`, `E₇`; it should be proved in each type, equality on a Levi summand not controlling the rest nor Levi conjugacy; affects the proof.

## For the human reviewers

- **Licence.** `SOM` is a set of preliminary notes of 2009 by one author, read from another mathematician's university page (`sources.toml`, `licence_class = "institutional"`); it is cited twice (§0.3, §3.1), each time beside DG.
- **Scope.** `KIR` is cited from the lecture-notes draft on the author's page; `sources.toml` records that the published book (Cambridge University Press, 2008) was not collated.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "baef69de84a1b8f323e359e3be89e7d29b0670f6", "job": "RT-LieHighestWeightPartII~1b", "model": "fable", "worker": "chris-x12"} -->
