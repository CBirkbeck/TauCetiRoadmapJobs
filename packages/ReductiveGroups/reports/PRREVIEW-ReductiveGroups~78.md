# Review of ReductiveGroups (pull request #1676 at e6ddc5b)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ReductiveGroups/` at `e6ddc5ba6f121029b1806546a9b62c32b031b3e8`. It is the same head the previous review read, so nothing changed in the folder.

- The gate passes. The dependency check is clean. `Suggested.lean` elaborates with exactly eight `sorry` warnings.
- The seeded sample (§1.1, §8.1, §8.2) and every Milne 2017 locator I could find are correct.
- Seven findings, three of them blocking:
  - **R01, R02 and R06 carry over** from the previous review (pin, Levi headline, description).
  - **R03 is new and blocking.** The README restates theorems the pinned Tau Ceti already proves. Lie–Kolchin is proved even at the branch pin; the rest are proved at main's pin, which the README treats as its pin.
  - **R04, R05 and R07 are new P3s:** a wrong page for the one locator the README flags, an unnamed supplier in §3A.6, and run-together tokens.

**Paths.** `README.md` and `Suggested.lean` mean `TauCetiRoadmap/ReductiveGroups/…`.

**Pins.** The branch pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c` (this head's `lake-manifest.json`). Main pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.

## Previous findings at this head

- **Previous R01 (P2, pin): not repaired.** `lake-manifest.json` still pins `a91d3aaf…`. `git merge-tree --write-tree HEAD origin/main` still reports the two modify/delete conflicts on `OrbitGeometryTargets.lean` and `SpectralWeylTargets.lean`. `Suggested.lean:61–63` still reads "The Tau Ceti revision this file's manifest pins does not contain the module". Raised again as R01, with a full name count.
- **Previous R02 (P2, Levi headline): not repaired.** `Suggested.lean:57–64` still says "the parabolic predicate is the missing carrier here and the decomposition is not stated". Raised again as R02.
- **Previous R03 (P3, description): not repaired.** The description is unchanged. It still says "The new native companion module builds … with one intentional admitted presentation target" and "Existing roadmap bytes are preserved". Raised again as R06.

## R01 (P2) — the branch pins Tau Ceti `a91d3aaf`, where 78 of the README's 182 Tau Ceti names and 7 of the 9 names `Suggested.lean` calls proved do not exist

**Location.**
- `Suggested.lean:32–44`: "Proved in the pinned Tau Ceti, hence consumed and not restated: … `TauCeti.SchemeAction.isLocallyClosed_orbit` … `TauCeti.HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq`".
- `Suggested.lean:53–56`, `:61–64`, `:73–74`, `:99–100`.
- In the README: every supplier contract that names `SchemeAction`, `PointTopology`, `SchemePointTopology`, `FiniteField`, `Parabolic`, `Comodule.induced…` or `weylCoxeterSystem` declarations, for example `README.md:208`, `:227–241`, `:370–403`, `:430–470`, `:1667–1673`, `:3654`.

**Claim.** The cited declarations exist at the pins.

**Witness.** I extracted every backticked `TauCeti.*` name from the README (182 names) and searched both pinned trees:
- 78 exist only at `2fd255d9`.
- Of the nine names in `Suggested.lean:34–44`, seven are absent at `a91d3aaf`: the five `SchemeAction.*` names, `isIso_…_of_reductive` and `IsBorelOverAlgClosed.exists_conjugate_eq`.
- At `a91d3aaf` the only `IsParabolic` is `Matrix.ProjectiveSpecialLinearGroup.IsParabolic` (`ProjectiveSpecialLinearGroup/FinTwo.lean:59`).

**Repair.**
1. Rebase onto current main, so that the manifest pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.
2. Resolve the two conflicts by keeping the deletions.
3. Delete the manifest sentence at `Suggested.lean:61–64`.
4. Then apply R02 and R03. The rebase makes the README's citations true, and it also makes the restatements listed in R03 into duplicates.

The previous rounds established that this `Suggested.lean` elaborates unchanged at main's pins with the same eight warnings.

## R02 (P2) — the Levi-of-parabolic headline is named as not statable, but it is statable at both pins

**Location.**
- `Suggested.lean:57–64`: "the parabolic predicate is the missing carrier here and the decomposition is not stated".
- `README.md:1680–1686`: "In the form of Layer 6A's complement, this headline reads …".

**Claim.** The headline cannot be stated because the parabolic predicate is missing.

**Witness.** I copied the bodies of `IsParabolicOverAlgClosed` and `IsParabolic` from `Parabolic/Basic.lean:82,248` at `2fd255d9`: 9 lines on pinned carriers (`IsBorelOverAlgClosed`, `smoothCommHopfAlgProperty`, `FiniteTypeCommHopfAlgCat.baseChange`, `CommHopfAlgCat.baseChangeHopfIdeal`). With those definitions, the statement below elaborated at the branch pin from a scratch file in 6 s with one `sorry` warning. At `2fd255d9` the predicate is a library declaration.

**Repair.** After R01:
1. Add `import TauCeti.Algebra.AlgebraicGroup.Parabolic.Basic`.
2. Add the following to the Layer 7 section. The name and signature are those of #1797's head, so whichever pull request lands second inherits the same declaration.
3. Move the headline into the "Stated here" paragraph and delete `Suggested.lean:57–64`.
4. Keep the sentences of `:65–70` (diagonalizable groups, the `k`-unipotent radical) as their own paragraph; they are not about the Levi headline.

```lean
/-- Levi decomposition of a parabolic subgroup over an arbitrary field: the geometric unipotent
radical of a parabolic `P` of a connected reductive `G` descends to the `k`-unipotent radical
`U`, and a Hopf ideal `J` of `O(P)` cuts out a Levi `k`-subgroup `L`, so that
`O(P)^U → O(P) → O(P)/J = O(L)` is bijective (Conrad–Feng, §H.1, p. 238). -/
theorem IsParabolic.exists_levi_complement {k : Type v} [Field k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{v, v} k)
    (hred : TauCeti.reductiveCommHopfAlgProperty k H)
    (I : TauCeti.HopfIdeal k H.obj) (hP : TauCeti.HopfIdeal.IsParabolic k H.obj I) :
    ∃ J : TauCeti.HopfIdeal k (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I),
      Function.Bijective ((Ideal.Quotient.mkₐ k J.toIdeal).comp
        (TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal
          (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)).coinvariants.val) := by
  sorry
```

I tested the statement on `B ⊂ GL₂` over `𝔽₂(s)`, on `P = G`, and with the wrong `J = (a−1, d−1)` (table below).

## R03 (P2) — the README restates theorems that the pinned Tau Ceti proves

**Claim.** What Tau Ceti states at the pin is cited, not restated. The README instead states the following as its own targets.

**At the branch pin `a91d3aaf` (and at `2fd255d9`): Lie–Kolchin.**
- README: `README.md:1273–1275` states "A smooth connected solvable group over an algebraically closed field is trigonalizable … (Milne, Theorem 16.30)" as a Layer 5 target. `README.md:1661` lists "Layer 5's Lie–Kolchin" among Layer 7's *Needs:*.
- Pinned: `TauCeti.Comodule.hasNonzeroWeightVector_of_isSolvable` and `TauCeti.Comodule.exists_basis_coefficientMatrix_isUpperTriangular_of_isSolvable` (`Solvable/LieKolchin.lean:391,419` at `a91d3aaf`). Hypotheses: a reduced group with connected spectrum and solvable rational points over an algebraically closed field. Over `k̄`, reduced means smooth, so this is Milne 16.30 exactly.

**At `2fd255d9`, the pin the README cites (see R01):**
- **§10C, `README.md:3493–3513`.**
  - Pinned in `SpecialLinear/BinaryForm/Basic.lean`:
    - the action `f(dx−by, ay−cx)`;
    - uniqueness of the B⁺-stable line `k yᵈ`: `exists_lTensor_coact_eq_tmul_iff_mem_span` (`:293`);
    - the simple socle;
    - `dim = ∏(d_j+1)`: `finrank_binaryFormsSocle_eq_prod_digits` (`:719`);
    - simplicity iff `d = (a+1)pᵐ−1`: `isAtom_binaryForms_iff_of_charP` (`:736`);
    - the char-3 `n = 4` and char-2 `n = 2` examples, in its docstring.
  - Pinned in `BinaryForm/Dual.lean`:
    - the head of `R_d*`: `isCoatom_dualAnnihilator_comap_binaryFormsSocle` (`:126`);
    - generation by `δ_{xᵈ}`: `eq_top_of_lcoeff_comp_subtype_mem` (`:156`);
    - the second B⁺-stable line `δ_{x^{p−1}y}` of `R_p*`.
- **§10D, `README.md:3599–3605`** ("extends uniquely exactly when its coefficient coaction factors through `k[End(V)]`").
  - Pinned: `TauCeti.GeneralLinear.existsUnique_matrixMonoidComodule_iff` and `…_iff_coefficientMatrix` (`GeneralLinear/Polynomial.lean:45,56`), with unit and multiplication laws.
  - These are built on `CoalgHom.existsUnique_comoduleFactor_iff` (`Coalgebra/Comodule/Descent.lean:74`).
- **Layer 7, `README.md:1691–1696`** (representability, smoothness and multiplication isomorphism of `P_G(λ)`, `U_G(λ)`, `Z_G(λ)`).
  - Representability: `parabolicDefiningHopfIdeal`, `unipotentDefiningHopfIdeal` and `leviDefiningHopfIdeal` (`Dynamic/Representability.lean:98`, `Dynamic/Unipotent/Representability.lean:99`, `Dynamic/Levi/Representability.lean:47`).
  - Smoothness: `smoothCommHopfAlgProperty_quotient_{parabolic,unipotent,levi}DefiningHopfIdeal` (`Dynamic/Smooth.lean:212–230`, smooth finite type over a Noetherian ring).
  - The algebra equivalence `O(P) ≃ O(U) ⊗ O(Z)`: `parabolicCoordinateAlgEquiv` (`Dynamic/LeviDecomposition/Coordinate.lean:174`).
  - After the rebase, `README.md:223–225` ("Their documentation does not establish representability of arbitrary dynamic subfunctors") is false.
- **§5P, `README.md:1322`** ("hence U+(C) is contractible and simply connected").
  - Pinned: `contractibleSpace_hopfIdealPointsSubgroup` (`GeneralLinear/Unipotent/Contractible.lean:48`): for every closed subgroup of `GLₙ` over `ℝ` or `ℂ` whose points are all unipotent, the point group is contractible. The contraction is `g ↦ exp((1−t) log g)`.
- **Layer 5, `README.md:1276–1279` and `:1284–1287`** ("prove `G/G_u` a torus"; "Prove that the represented quotient `G/R_u(G)` is reductive"). Over an algebraically closed field these are pinned:
  - `TauCeti.FiniteTypeCommHopfAlgCat.torus_coinvariants_unipotentRadical` (`Solvable/UnipotentRadical.lean:88`);
  - `TauCeti.FiniteTypeCommHopfAlgCat.reductive_coinvariants_unipotentRadical` (`PseudoReductive/Basic.lean:201`).
- **§9D, `README.md:3243–3249`** ("Define pseudo-reductive … Prove reductive implies pseudo-reductive"). Pinned:
  - `TauCeti.pseudoReductiveCommHopfAlgProperty` (`PseudoReductive/Basic.lean:80`);
  - `TauCeti.reductiveCommHopfAlgProperty.pseudoReductive` (`:133`);
  - `TauCeti.FiniteTypeCommHopfAlgCat.pseudoReductive_coinvariants_unipotentRadical` (`:181`);
  - `𝔾_a` not pseudo-reductive: `TauCeti.AdditiveGroup.not_pseudoReductiveCommHopfAlgProperty_coordinateHopfAlgebra`.

**Witness.** The declarations above, opened at the pins.
- `SpecialLinear/Basic.lean` at both pins says it asserts "no polynomial presentation", so `exists_coordinatePresentation` is not among these duplicates.
- Tested on instances in the table: `B ⊂ GL₂` with `λ = diag(t,1)`, binary forms at `p = 3, d = 4` and `p = 2, d = 2`, `det^{±1}` of `GL₁`, and `U(ℂ)` for `GL₂`.

**Repair.** List each declaration above, with its file and hypotheses, in *Exact supplier contracts*. Delete the restated targets. Keep as targets only what the library leaves open:
- Layer 5: Milne 16.33's decomposition and conjugacy, and the perfect-field descent and base change.
- §9D: equality with reductive over perfect fields (the pinned module says it does not prove this), separable extensions, and `Res_(K/k) 𝔾_m`.
- §10C: the identifications `R_n ≃ ∇(n)`, `R_n* ≃ Δ(n)` and socle `= L(n)` against §10B.
- §10D: the monoid-scheme points dictionary and the Schur-algebra comparison.
- Layer 7: the comparison of the pinned dynamic subgroups with the parabolic predicate and Levi complements.
- §5P: the complex exponential comparison and the relation between the analytic and point topologies.

Change Layer 7's *Needs:* from "Layer 5's Lie–Kolchin" to the pinned theorem. I checked only the directories named here among the 1045 Tau Ceti files new between the two pins (see *Not verifiable*). After the rebase, audit the other layers the same way.

## R04 (P3) — the one locator the README flags points at the wrong theorem and page

**Location.**
- `README.md:3718–3719`: "Fadell–Neuwirth, *Configuration spaces*, Math. Scand. 10 (1962), §II, pp. 111–112".
- `README.md:4057–4058`: "(cited by title)".

**Claim.** The source supports, at that locator, the route "the forget-last-point map `PConf_n(ℂ)→PConf_(n−1)(ℂ)` is a locally trivial fibration with fibre the plane minus `n−1` points".

**Witness.** In `fadell-neuwirth` (printed page = scan page + 110):
- pp. 111–112 hold Theorem 1 (lines 22–70), the projection `F_{m,n} → M − Q_m` to the *first* point, whose fibre is `F_{m+1,n−1}`.
- The projection `F_{m,n} → F_{m,r}` to the first `r` points is Theorem 3, line 129, p. 114, still in §II. With `m = 0` and `r = n−1` its fibre is `M` minus `n−1` points.

**Repair.**
- Cite "§II, Theorem 3, p. 114 (Theorem 1 and Corollary 2.2, pp. 111–113, for the fundamental sequence and asphericity)".
- Drop "(cited by title)" from the reference: the text is legally readable from the MSP archive.

Tested on `n = 3`: Theorem 3 gives `PConf₃(ℂ) → PConf₂(ℂ)` with fibre `ℂ ∖ {z₁, z₂}`. Theorem 1 gives `PConf₃(ℂ) → ℂ` with fibre `PConf₂(ℂ ∖ pt)`, a different map.

## R05 (P3) — §3A.6 consumes an unnamed supplier

**Location.** `README.md:1148–1151`: "first consume the actual compact-to-rational GL_n(ℂ) representation dictionary from the existing classical/compact representation suppliers".

**Claim.** Every input of a route is a target, a named supplier section, or a pinned declaration.

**Witness.**
- On main, LieGroups Layer 7, *Representations and holomorphic descent* (`RepresentationTheory/LieGroups/README.md:1013–1016`), owns the restriction equivalence between holomorphic representations of `G_ℂ` and continuous representations of compact `G`.
- ClassicalGroups Layer 0 (`RepresentationTheory/ClassicalGroups/README.md:187–197`) defines rational `GLₙ(ℂ)` representations and leaves the unitarian route out of scope.
- No other main roadmap is plausibly meant.

**Repair.** Replace the phrase with "LieGroups Layer 7's holomorphic-descent equivalence for `U(n)`, with `U(n)_ℂ = GLₙ(ℂ)`". Name the layer that proves that holomorphic representations of `GLₙ(ℂ)` are rational (Layer 3A.5's holomorphic and algebraic comparison, or a target added here), or delete the `U(n)` sentence. Add a *Needs:* line to §3A.6, which has none.

Tested on `n = 1`: the character `z ↦ zᵐ` of `U(1)` extends to `t ↦ tᵐ` on `ℂˣ`, which is rational.

## R06 (P3) — five open pull requests change this roadmap and conflict with this head; the description states no order

**Location.** The pull-request description, unchanged.

**Witness.**
- The overlap index of 2026-11-09 lists #1332, #1797, #1807, #1808 and #1854 as conflicting with this head in `README.md`, `Suggested.lean` or the deleted `*Targets.lean` files.
- #1797's head states `IsParabolic.exists_levi_complement` (its `Suggested.lean:160`), which this head does not state.
- The description's "Existing roadmap bytes are preserved" is false: the folder diff against main is +2898/−2432 lines, with seven files deleted. The description also mentions "one intentional admitted presentation target", but `Suggested.lean` admits eight.

**Repair.**
- State which of these pull requests is rebased on which, and whether this one takes #1797's Levi statement (R02) or #1797 takes this one's.
- Close or retarget #1332 if this pull request supersedes it.
- Replace the validation paragraph with what the head contains.
- Name the follow-up that makes ReductiveGroupsPartII cite Layer 7a. On main that README still calls RG2.3 "the single owner in Tau Ceti of Lang's theorem" (`ReductiveGroupsPartII/README.md:61–62`), while this pull request makes Layer 7a the owner (`README.md:15–17`, `:43–44`).

## R07 (P3) — run-together tokens and ASCII formulas outside code spans

**Location.** About 93 tokens in prose fuse a word with a following digit (the PR reduced main's 111). Examples:
- `README.md:1320`: "from Layers2–5, before the Levi-complement machinery of6A or … of7C";
- `:1426`: "Layer5's";
- `:1759`: "on the open set1+ab≠0";
- `:1773`: "with value1 at z=0 … prove1∈S";
- `:2387`: "diagonal2";
- `:2395`: "norm2 shell".

ASCII formulas also sit outside code spans:
- `:1322`: "exp(X)=sum_(0≤j<d)X^j/j!";
- `:1773`: "2ρ∨=sum_(β>0)β∨".

**Claim.** House style: mathematics in Unicode, with ASCII only inside code spans.

**Witness.** A regex count over the README with code spans removed: `Layer7` 12, `Layer0` 6, `Layer1` 5, `rank0` 4, `norm2` 4, `rank1` 4, …

**Repair.** Insert the missing space ("Layer 7", "rank 0", "of 6A", "value 1"). Put the ASCII formulas of §§5P, 7C and 9A in backticks or write them in Unicode (`exp(X) = ∑_{j<d} Xʲ/j!`).

## Verified sound

**Head, scope, gate.**
- Head `e6ddc5ba…`; worktree clean.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroups'` is empty.
- The folder holds `README.md`, `Suggested.lean`, `PROGRESS.md`, `STATUS.md` and `metadata.toml`.
- Gate re-run at this head: every check 0, `OK`.

**Dependency check** (`--movable`, content main, the board's `ORDER.txt`): `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`, with no UPWARD or CYCLE line. ReductiveGroups is on main and not in `ORDER.txt`.

**Elaboration.**
- `lake env lean` on `Suggested.lean` from the worktree: exit 0 in 6 s.
- Exactly eight warnings, all "declaration uses `sorry`", at lines 120, 133, 153, 175, 191, 213, 377 and 386.
- `halfTwist_injective` and `halfTwistLoop` are fully proved.

**Signatures.** I ran `#check @name` on all 18 declarations in one scratch file. Every elaborated type matches its README statement, and no binder is lost:
- `[CharZero k]` and `AlgebraicClosure k`;
- `[IsAlgClosed k] [CharP k p]` with `hsm`, `hconn`;
- `[IsAlgClosed k]` with `IsMaximalTorus` twice;
- `[Finite k]` with `[IsAlgClosed K]` and `hF`;
- `2 ≤ n`.

**Padding probe.** On a scratch copy I replaced each `sorry` with `first | rfl | (simp; done) | infer_instance | trivial | decide | (simp_all; done) | exact?` (58 s). All eight fail: six with "`exact?` could not close the goal" and two with a `whnf` heartbeat timeout (`exists_conjugate_eq_of_isMaximalTorus`, `lang_surjective`). Nothing is padding.

**Seeded sample.**
- **§1.1** (`README.md:676–787`), checked in `jantzen-1985` (printed page = scan page − 5):
  - §2.8, the comodule map and the equivalence of G-modules with comodules, lines 1100–1136, pp. 36–39;
  - flatness assumed from 3.2 on, line 1487;
  - §3.3 induction, line 1507, p. 52; §3.8 begins line 1647, p. 58;
  - §3.9 Proposition b), every module embeds in an injective via `M → M_tr ⊗ k[G] → I ⊗ k[G]`, lines 1688–1703, p. 60;
  - §4.2, line 1923, pp. 69–70;
  - §4.7, line 1994, p. 72, with Lemma a) at line 2001, p. 73;
  - §4.14, `Cⁿ(G,M) = M ⊗ k[G]^{⊗n}`, line 2102, p. 77; §4.15 line 2123; §4.16 lines 2153–2161, pp. 79–79a.
  - The README's statements (enough injectives over a flat Hopf algebra, the cofree resolution, "cofree is not injective" over a ring, cotensor induction) are what these sections say, at the generality "flat `k`-group scheme over a ring".
- **§8.1** (`README.md:2296–2318`): `conrad-rgs` Definition 5.1.1, line 5651, p. 136, with conditions 1–3 at lines 5654–5659, imposed on disconnected `S` (lines 5661–5667).
- **§8.2** (`README.md:2320–2338`): `conrad-rgs` Definition 6.1.1, line 7725, and Remark 6.1.2, line 7738, both p. 186. The "evident notion of isomorphism" is on p. 187 (line 7754), so "pp. 186–187" is right. The README's `Spec(k×k)` Check is Remark 6.1.2.

**Other locators.** Milne 2017 is the author's page copy `iAG2017.pdf`, read through the sources service; printed page = scan page − 12. Each of the following is at the cited number and page:
- Proposition 1.21 (p. 12), 1.34 (p. 16), Corollary 1.39 (p. 18), 1.65–1.66 (pp. 26–27);
- 3.10, 3.11, 3.15 (pp. 67–68); 4.7, 4.9, 4.10, 4.14 (pp. 86–88);
- 5.14, 5.18 (pp. 102–103), 5.34 (p. 107), 5.58 (p. 114);
- 6.44–6.46 (p. 135); 7.18 (p. 143); 9.17–9.18 (p. 170);
- 10.6 (p. 188), 10.14 (p. 190), 10.23 (p. 193), 10.28–10.29 (p. 195);
- 12.8–12.9 (p. 233), 12.12 (p. 234), 12.23 (p. 240), 12.52, 12.54 (p. 248), 12.56 (p. 249);
- 14.3 (p. 280), 14.5 (p. 281), 14.21 (p. 284);
- 16.30 (p. 334), 16.33 (p. 335);
- 17.6 (p. 353), 17.9, 17.10 (p. 354), 17.15–17.16 (p. 356), 17.62 (p. 372), 17.94, 17.95 (p. 382), 17.96–17.97 (p. 383);
- 19.9 (p. 399), 19.11 (p. 400);
- 21.11 (p. 428), 21.37 (p. 435), 21.45 (p. 438);
- 22.2 (p. 463), 22.4–22.5 (p. 464), 22.27 (p. 470), 22.42 (p. 477), 22.43 (p. 478), 22.48 (p. 479);
- 23.25 (p. 492), 23.58 (p. 501), 23.74 (p. 511).

Also checked:
- `fox-neuwirth` §7, "A presentation of B_n", line 153, pp. 122–126 (§8 on p. 126).
- `birman-brendle` p. 69, lines 2654–2662: Fox–Neuwirth's presentation and asphericity.

**Library declarations opened.**
- At `a91d3aaf`: `LinearlyReductive.lean:64`, `Torus/Basic.lean:107`, `Reductive/Basic.lean:70`, `Connected/CommHopfAlgCat.lean:61`, `Connected/GroupScheme.lean:68`, `Solvable/LieKolchin.lean:391,419`, `SpecialLinear/Basic.lean` (docstring), `Dynamic/LeviDecomposition/Basic.lean:194`.
- At `2fd255d9`: `Parabolic/Basic.lean:82,248`, `Comodule/Descent.lean:74`, `GeneralLinear/Polynomial.lean:45,56`, `GeneralLinear/Unipotent/Contractible.lean:48`, `Dynamic/Representability.lean:98`, `Dynamic/Smooth.lean:212–230`, `Dynamic/LeviDecomposition/Coordinate.lean:174`, `Solvable/UnipotentRadical.lean:88`, `PseudoReductive/Basic.lean:80,133,181,201`, `SpecialLinear/BinaryForm/Basic.lean:293,705,719,736`, `BinaryForm/Dual.lean:126,156`.
- Mathlib at both pins: `ContDiffAt.to_localInverse`, `IsCoveringMap.existsUnique_continuousMap_lifts` (`Topology/Homotopy/Lifting.lean:168`), `IsCoveringMap.eq_of_comp_eq` (`Topology/Covering/Basic.lean:367`), `Rep.indResAdjunction`, `Rep.resIndAdjunction`, `Rep.coindResAdjunction`, `Rep.indCoindIso`, `IsNilpotent.exp`, `skewAdjointMatricesLieSubalgebraEquiv`, `essImage_hopfSpec`, `isCommMonObj_of_isProper_of_geometricallyIntegral`, `smooth_of_grpObj`.
- The README's "native `ArtinGroup.exponentSum`" (`README.md:3734`) is `TauCeti.ArtinGroup.exponentSum` (`GroupTheory/Coxeter/Artin.lean:226` at `a91d3aaf`).

**Ownership and cross-roadmap citations.**
- `roadmaps resolve` finds no missing cross-roadmap citation. The overlap index lists no dropped or revision-only id.
- `roadmaps grep` over the open heads: the headline names occur only in this roadmap's three revisions (#1332, #1676, #1797) and in main's `ReductiveGroupsPartII/Suggested.lean:212` (`lang_surjective`). That is a different fully qualified name.
- On main this roadmap consumed Lang from ReductiveGroupsPartII RG2.3.7 (main's `README.md:692`), while Part II consumes Layers 0–9: a cycle. This pull request breaks it by moving ownership down to Layer 7a, which is the right direction. The Part II side is R06's follow-up.
- Consumers named here are open pull requests or main roadmaps later in supply: IntegralHeckeAndGaloisDeterminants, FormalConnectionsOpers, ComplexComparisonPartII and AdelicAlgebraicGroups (`ORDER.txt` lines 26, 40, 39, 52); CFSGStatement and ReductiveGroupsPartII on main. Suppliers on main: SchemeAndStackFoundations, ModularCurves, LieGroups, LieHighestWeight, IntegralLattices, GroebnerGeometry, ReflectionInvariantTheory, DGFloer, SmoothBundlesConnections, AlgebraicTopology, AlgebraicVectorBundles.
- Neither pin proves the SL polynomial presentation. `SpecialLinear/Basic.lean` at both pins says it asserts "no polynomial presentation", so `exists_coordinatePresentation` is this roadmap's.

**Adversarial table** (values computed this round).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| `linearlyReductive_iff_reductive_identityComponent` | trivial; `𝔾_a`/ℚ; constant `S₃`/ℚ; `O₂`/ℂ | T↔T; `[[1,a],[0,1]]` indecomposable F ↔ `R_u=𝔾_a` F; Maschke T ↔ `G°=1` T; T ↔ `SO₂≅𝔾_m` T | Pass |
| same, control | constant `ℤ/p`/𝔽_p | `k[u]/(u^p)` indecomposable: F; `G°=1`: T; excluded by `[CharZero k]` | Pass |
| `linearlyReductive_iff_torus` | `𝔽̄_p`: trivial, `𝔾_m`, `SL₂`, `𝔾_a` | trivial T ↔ rank-0 torus (`n = 0` in `torusCommHopfAlgProperty_iff`) T; T↔T; `⟨x^p,y^p⟩⊂R_p` uncomplemented F ↔ F; F↔F | Pass |
| same, control | `μ_p` | LR T (12.54), torus F; excluded by `hsm` | Pass |
| `exists_levi_complement` | `B⊂GL₂`/ℚ; `G=𝔾_a`; `G=GL₂` | `[[a,b],[0,d]][[1,c],[0,1]]=[[a,b+ac],[0,d]]` ⇒ `O(B)^U=ℚ[a^±,d^±]`, `J=(b)` bijective; radical ideal 0, coinvariants ℚ, `J=(b)`: ℚ→ℚ; radical ideal = augmentation, `J=0` | Pass |
| same, wrong `J` | `B`, `J=(a−1,d−1)` | `a−1↦0`: not injective | Pass |
| `exists_conjugate_eq_of_isMaximalTorus` | `SL₂`/ℂ, `u=[[1,1],[0,1]]`; `μ_p`/`𝔽̄_p` | `u·diag(t,t⁻¹)·u⁻¹=[[t,t⁻¹−t],[0,t⁻¹]]`, `g=u`; only torus trivial, `I=J`=augmentation, `g=1` | Pass |
| same, control | `SL₂`/ℝ, diagonal vs `SO₂` | unbounded vs compact points; excluded by `[IsAlgClosed k]` | Pass |
| `lang_surjective` | `𝔾_a`/𝔽₂, `θ²+θ+1=0`; `𝔾_m`; `K` transcendental | `θ²−θ=1`; `θ⁻¹θ²=θ`; `T^q−T−a` has a root in `K` | Pass |
| same, control | constant `C₂`/𝔽_q | Frobenius trivial, every Lang value 1, misses the other element; excluded by `hconn` | Pass |
| `exists_coordinatePresentation` | `n=0,1,2`; ℤ/4 | `det ∅−1=0`, ℤ; `x−1`, ℤ; `ad−bc−1`; `[[1,1],[0,1]]⁻¹` upper right `−1=3` | Pass |
| `plane_braid` | `n=0,1,2`; `n=2,i=0,t=½` | trivial = trivial; `π₁(Conf₂)=ℤ=B₂`; `½−e^{iπ/2}/2=½−I/2`, `½+I/2`; `σᵢ↦σᵢ⁻¹` preserves the braid relations, so existence does not depend on orientation | Pass |
| `permutation_nonsplit` | `n=2`; `n=3`; `n≤1` | `B₂=ℤ→C₂`: `2m=0` with `m` odd impossible; lift of `(12)` has order 2, exponent sum 0, sign odd; both trivial, excluded by `2≤n` | Pass |
| §1.1 (sample) | weight-one line of `𝔾_m`/ℤ; trivial group; `C₂⊂S₃` | `1↦1⊗t`, at `2∈ℚˣ` ×2, `3·2=6`; `d¹(t−1)=t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1=0`; differentials `0,id,0`; equalizer rank `3=\|S₃/C₂\|` | Pass |
| §8.1 (sample) | `SL₂` vs `PGL₂`; `SL₂`/𝔽₂ | root `2ϖ` vs generator; centre `𝔽₂[t]/(t−1)²`, length 2 | Pass |
| §8.2 (sample) | `x_α(2t)`/ℤ and /ℚ; `Spec(k×k)` | `2E₁₂` not a generator of `ℤE₁₂`, a different pinning over ℚ; `B⁺⊔B⁻` gives signs `(+,−)` | Pass |
| Elementary subgroups (§9B) | `SL₂(ℤ/4)`; `𝔾_m`/ℚ; `SL₂→PGL₂`/ℚ; ℤ | `x(1)x₋(−1)x(1)=[[0,1],[−1,0]]≡[[0,1],[3,0]]`, in `D(c)`; `E=1`, `GE=ℚˣ`; `diag(2,1)` det class 2, no lift; `[[2,1],[3,2]]` in no chart | Pass |
| §9B.1 chart | `SL₂`, `Ω=D(a)` | `u₋(c/a)·diag(a,a⁻¹)·u₊(b/a)` has lower right `(1+bc)/a=d` | Pass |
| Levi of parabolic (R02) | `B⊂GL₂`/`𝔽₂(s)`; `P=G` | `O(B)^U=k[a^±,d^±]`, `J=(b)` bijective over the imperfect field; `R_{u,k}=1`, `J=0` | Pass (statable: R02) |
| Lie–Kolchin (R03) | `B⊂GL₂`; constant `S₃`/ℂ; `SO₂`/ℝ | `[[a,b],[0,d]]e₁=ae₁`; 2-dim irreducible has no common line; rotation by 90° has no real eigenvector | Pinned: R03 |
| §10C (R03) | `p=3,d=4`; `p=2,d=2`; `p=3,d=5` | `C(4,i)≡1,1,0,1,1`: socle dim `4=2·2`, misses `x²y²`; `1,0,1`: dim `2`, misses `xy`; `5=2·3−1`, `C(5,i)≡1,2,1,1,2,1`: simple | Pinned: R03 |
| §10D (R03) | `GL₁`, `det` and `det⁻¹` | coaction `t∈k[t]`: extends; `t⁻¹∉k[t]`: no extension | Pinned: R03 |
| Layer 7 dynamic (R03) | `GL₂`, `λ=diag(t,1)` | `λgλ⁻¹=[[a,tb],[t⁻¹c,d]]`: `P={c=0}`, `U={a=d=1,c=0}`, `Z=T`; `[[1,u],[0,1]]diag(a,d)=[[a,ud],[0,d]]` gives `O(P)≅O(U)⊗O(Z)` | Pinned: R03 |
| §5P (R03) | `U={[[1,a],[0,1]]}`/ℂ | `exp((1−t)log g)=[[1,(1−t)a],[0,1]]` | Pinned: R03 |
| §9D (R03) | `𝔾_a`; `Res_{K/k}𝔾_m`, `K=k(a^{1/p})` | not pseudo-reductive; dim `p`, geometric unipotent kernel dim `p−1`, `R_{u,k}=1` | Pinned: R03 |
| Fadell–Neuwirth (R04) | `n=3` | Thm 3: `PConf₃→PConf₂`, fibre `ℂ∖{z₁,z₂}`; Thm 1: `PConf₃→ℂ`, fibre `PConf₂(ℂ∖pt)` | Fail: R04 |
| §3A.6 (R05) | `U(1)` | `z↦zᵐ` extends to `t↦tᵐ` on `ℂˣ` | Supplier unnamed: R05 |
| §6A cocycle | `𝔾_m` on `𝔾_a`, weight 1 | `a(ts)=a(t)+ta(s)` forces `a=a₀+a₁t` with `a₁=−a₀`, so `a=dv` with `v=a₁` | Pass |
| §6B check | `g=diag(2,1)`, `h=[[0,1],[1,0]]` | `ggᵗ=(gh)(gh)ᵗ=diag(4,1)`; `gᵗg=diag(4,1)`, `(gh)ᵗ(gh)=diag(1,4)` | Pass |
| §9A.1b folds | A₃, A₄, D₄ triality; `γY=[[0,−1],[1,−1]]` | `[[2,−2],[−1,2]]`, `[[2,−1],[−2,2]]`, `[[2,−3],[−1,2]]` from `d_O,c_O`; `γY³=I`, Smith form `diag(1,3)`, fixed `(1,−1)` mod 3 | Pass |
| §9A.1b counts | D₄ triality; E₆ | `6` fixed `+ 6` orbits, `12+2=14`; `24+24=48`, `48+4=52` | Pass |
| §9B special isogeny | B₂, G₂, F₄ | `τ*α=β`, `τ*β=2α`; G₂ string `b−2a,…,b+a`, constant ±3; F₄ ±2 | Pass |
| §10 checks | `SL₂`, `p=2,3`; `PGL₂` | `dim L(p)=2`, `dim ∇(p)=p+1`; Steinberg dims `2,3`; `ρ=α/2∉X` | Pass |
| Layer 11 `𝔰𝔩₂` | `𝔱_reg=ℂ*`, `W=ℤ/2` | loop `e^{2πis}` lifts to `e^{πis}`, ending at −1 | Pass |

## Not verifiable

- **Lean at main's pins.** The brief allows Lean runs only from this worktree, which pins `a91d3aaf`. R02's signature was elaborated with body-identical local predicates.
- **Duplication audit (R03) is partial.** Between the two pins Tau Ceti added 1045 files under `Algebra/AlgebraicGroup`, `Algebra/Coalgebra`, `RepresentationTheory` and braid groups. I checked these directories:
  - `Dynamic/`, `Solvable/`, `Unipotent/`, `PseudoReductive/`;
  - `SpecialLinear/{BinaryForm,LinearlyReductive,CentralIsogeny}`;
  - `GeneralLinear/{Polynomial,Unipotent}`;
  - `Representation/ProjectiveOrbit/` (Borel fixed point, used by the pinned Borel conjugacy the README consumes);
  - `Coalgebra/Comodule/` (no enough-injectives or rational cohomology there).

  The rest, for example `RepresentationTheory/ClassicalGroups/WeylModule` and `Derived/`, was not compared against Layers 6, 9 and 10.
- **Other heads.** The heads of #1332, #1797, #1807, #1808 and #1854 were read only through the overlap index and `roadmaps grep`.
- **Cited by locator only:** Waterhouse, Borel, Springer (settled as uncertified); Jantzen 2003; Conrad–Gabber–Prasad; Lang 1956; Steinberg 1968; Howlett–Lehrer; Dipper–Du; Carter; Serre; Gassmann.
- **Cached but not re-read this round:** `sga1`, `riche`, `gros-kaneda`, `brieskorn`, `salvetti`, `callegaro`, `heden`, `dudas-michel`, `frenkel-kac`, `mcninch`, `conrad-feng`, `conrad-adelic`. Earlier rounds checked their locators, and the passages are unchanged.
- **Manifest mismatch.** The manifest key `milne-iag` records Milne's 2015 notes (v2.00), whose numbering differs. The README cites the 2017 book (`iAG2017.pdf`). I read the 2017 text from the author's page without recording it, since this review edits no manifest.

## Source issues

- **Error** in Milne, *Algebraic Groups* (2017) at Remark 12.56, p. 249: the source says that in characteristic `p` an algebraic group is linearly reductive iff `G°` is a torus and `p` does not divide `(G:G°)`; it should be `G°` of multiplicative type (`μ_p` is linearly reductive by 12.54, connected, not a torus); affects nothing.
