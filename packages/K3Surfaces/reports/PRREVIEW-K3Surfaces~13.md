# Review of K3Surfaces (pull request #1285 at 2ddcd6b)
**Verdict:** needs changes

This is a full review of head `2ddcd6b`; the folder changed by 199 lines since `5108929`. The mathematics of the new §7.1 surjectivity argument and of the two new Layer 0 headlines checks out, including brute-force computations over 𝔽₂ and E₈. One blocking defect remains: the folder is written against two different Tau Ceti commits. A carried P3 about the Part II's ownership of the reduction (U) at p=2 is still open.

## R01 (P1) — The folder needs two different Tau Ceti commits: §7.1's homomorphism exists only at main's pin, Suggested.lean's import only at the branch pin

**Location:**
- `TauCetiRoadmap/K3Surfaces/README.md:113–119`: "the action of O(L) on the discriminant form is `TauCeti.IntegralLattice.Isometry.discriminantOrthogonalHom` … Tau Ceti supplies the homomorphism and its kernel, not its surjectivity".
- The same names at `:115–116`, `:904` and `:968`.
- `TauCetiRoadmap/K3Surfaces/Suggested.lean:2`: `import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower`, with the matching file path at `README.md:93`.

**Claim:** This branch pins Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c` in its `lake-manifest.json`. Main pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, since main's pin-bump commit `a891cd19`.

The README and the Lean file each match a different one of these pins:
- **At the branch pin** (where the gate builds), `discriminantOrthogonalHom`, `discriminantKernel` and `ker_discriminantOrthogonalHom` do not exist, and neither does the file `Discriminant/OrthogonalGroup.lean`.
  - §7.1's target "O(S)→O(q_S), that is `discriminantOrthogonalHom` for S, is surjective" therefore names a map that nothing supplies.
  - The supplier claim at `:118–119` is false at this pin.
- **At main's pin**, those declarations exist. But the module `TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower` does not: it moved to `…ExteriorPower.Basic`.
  - This pull request does not touch `lake-manifest.json`, so once merged, `Suggested.lean` is built at main's pin and its import line 2 fails.
  - The worker's own signature elaboration ran against main's packages and failed on exactly this missing object file (`scratch/signatures.md`).

Whichever pin applies, one half of the folder fails.

**Witness:**
- Branch pin `a91d3aaf`:
  - `TauCeti/LinearAlgebra/IntegralLattice/Discriminant/` holds only Bilinear, Cardinality, CoordinatePower, Group, Operations, Quadratic and Smith.
  - A grep of the whole of `TauCeti/` and `Mathlib/` for `discriminantOrthogonalHom|discriminantKernel` finds nothing.
- Main pin `2fd255d9`:
  - `Discriminant/OrthogonalGroup.lean` defines the three names at `:120`, `:249` and `:278`.
  - `Sheaf/ExteriorPower.lean` is absent, and `exteriorPower` is defined at `Sheaf/ExteriorPower/Basic.lean:66`.

**Exact repair:**
1. Bring the branch onto main's pins by merging `origin/main` into it. `git merge-tree --write-tree origin/main HEAD` completes with no conflict (tree `2937822f`), because the folder is new.
2. `Suggested.lean:2`: replace the import by `import TauCeti.Algebra.Category.ModuleCat.Sheaf.ExteriorPower.Basic`.
3. `README.md:93`: replace the path by `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean`.
4. Re-run the gate's targeted build `lake build TauCetiRoadmap.K3Surfaces.Suggested` at the new pins.

If the branch must instead stay at `a91d3aaf`, §7.1 has to define O(L)→O(q_L) itself from `TauCeti.IntegralLattice.Isometry.discriminantGroupEquiv` (`Discriminant/Group.lean:165`) and drop the three names. That would duplicate Tau Ceti once merged, so the merge is the right repair.

**Tested on the instance:**
- **Names, at main's pin, by reading the sources:**
  - Every other name `Suggested.lean` uses exists at Tau Ceti `2fd255d9` / Mathlib `1b1ccf4b`:
    - `Scheme.relativeDifferentials` (`Differentials/Basic.lean:85`), `Scheme.Modules.Cohomology` (`Cohomology/Basic.lean:61`), `LineBundleClass` (`LineBundle/Class.lean:50`);
    - `DiscriminantGroup`, `discriminantQuadraticMap`, `discriminantGroupOrthogonalSumEquiv` (`Discriminant/Operations.lean:143`), `orthogonalSum`, `intermediateCarrierOfDiscriminantSubgroup`, `IsNondegenerate`, `IsEven`, `discriminantGroupEquiv`;
    - Mathlib `RationalMap.IsOver`, `RationalMap.IsDominant` (`Dominant.lean:74`) and the `𝔸(n; S)` notation (`AffineSpace.lean:49`).
  - A script comparing all 39 backticked library names of the README across both pins finds only the three names above missing at the branch pin, and nothing missing at main's.
  - At `2fd255d9`, `discriminantOrthogonalHom` is `O(L) →* O(q_L)` for even nondegenerate L, its kernel is the discriminant kernel, and no surjectivity theorem exists anywhere in Tau Ceti. That is what the README says.
- **Elaboration:** I did not elaborate at main's pin. This brief's Lean commands run only in this worktree at its own pins.

## R02 (P3) — The Part II still re-proves (U) at p=2, and the description still records no order

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:1139–1144`: "its §2.1a consumes §0.2's vanishing theorem and its unirationality reduction (U), `unirational_of_nontrivial_vectorField`, at p=2 … without restating the reduction".

**Claim:** This folder now exports (U) as a Lean headline for every prime p, `hp : p.Prime`, 2 included. That is the side the merge order supports: K3Surfaces is at line 133 of the order, K3SurfacesAndSymplecticBoundedness at line 314.

The Part II's head is unchanged since the last review, and it still owns and re-proves the p=2 case. So "without restating the reduction" is false of that head. The description still says nothing about the order between the two pull requests.

**Witness:** K3SurfacesAndSymplecticBoundedness at `c1d6da0`, `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md`:
- `:9`: "Section 2.1a owns only the infinite-height kernel statement and the characteristic-2 case of the reduction".
- `:74`: "§2.1a extends that reduction to p=2".
- `:406`: "At p=2, outside K0.A's binder, prove the vector-field unirationality reduction by the argument of K3Surfaces K0.A step 1".

**Exact repair:** Nothing changes in the folder.
- The description's merge-order paragraph should state two things:
  - K3SurfacesAndSymplecticBoundedness consumes §0.2's `unirational_of_nontrivial_vectorField` at p=2.
  - That pull request rebases after this one and replaces its own p=2 proof (`:9`, `:74`, `:406`, `:414`) with a citation of "K3Surfaces §0.2 (U)".
- The same description edit should replace "its ten prospective proof targets remain admitted" by the four acceptance theorems `Suggested.lean` now states.

This is carried from the previous review's R03 at the same severity. The duplicated object is already settled in this folder's favour, so what remains is the other head and the unstated order. No repair report marked it "not actionable in this package".

## Previous findings

- **R01 (P1), §7.3's discriminant surjectivity unowned: repaired.**
  - `:902–923` now states the surjectivity as a §7.1 target, with the route through M/2M and transvections. Its Needs line is at `:964–971`, and `:1094` cites "§7.1's discriminant surjectivity".
  - The supplier row at `:150` now reads "IntegralLattices 0G, 1B–1F, 5F, 5G, 5J, 6A".
  - §7.2 at `:1032` derives the isometry class of S from §6A after halving the form.
  - §6.2 at `:820–822` cites "§§5F–5G for primitive embeddings".
  - The only remaining problem is the pin of the Tau Ceti carrier: R01 above.
- **R02 (P2), (U) and (i) statable but absent: repaired.** `Suggested.lean:67–83` states both. `:63–76` gives docstrings with locators, and `:5` adds `TauCeti.AlgebraicGeometry.LineBundle.Class`. The README names both at `:199–200`, `:310` and `:321`, and Conventions `:51` says that ρ is the ℤ-rank of Pic (Huybrechts Proposition 1.2.4, p.12).
- **R03 (P3), the Part II re-proves (U) at p=2: not repaired.** The other head and the description are unchanged. Carried as R02.
- **R04 (P3), §4.1 locator range: repaired.** `:640–641` now reads "Huybrechts draft §§6.1.1–6.1.2, Proposition 6.1.5 and Remark 6.1.6, pp.99–101". The cited items are at `huybrechts-k3` lines 3705 and 3718–3720.

## Verified sound

This is an independent AI review of `TauCetiRoadmap/K3Surfaces/` at `2ddcd6be04dd7a8ff3dbdea356f7b7b9a2028be7`.

**Gate, folder and dependency check**
- `git diff --stat origin/main...HEAD` outside the folder prints nothing. The folder holds `README.md` (1202 lines), `Suggested.lean` (117 lines) and `metadata.toml`.
- Gate rerun with `--base origin/main`: every scanner prints 0, it ends "OK", exit 0. The worker's gate also reports `build=0` at the branch pin.
- Dependency check:

```text
depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or `moved:` line. K3Surfaces is at line 133 of the merge order and FourManifolds at 132; the other ordered suppliers sit above it, as recorded last round.
- PCurvature is a new roadmap folder in an open pull request and is named in the description. No forbidden supplier is cited, and no process words, pull-request numbers or LaTeX delimiters appear.

**Elaboration, signatures and padding (branch pin)**
- `lake env lean` on `Suggested.lean` gives exactly four `declaration uses sorry` warnings, at `:56`, `:67`, `:77` and `:101`.
- A scratch copy printed `#check @` for all six declarations. Every binder matches its README statement:
  - `IsAlgebraicK3` keeps `[Field k] [IsAlgClosed k] [X.Over (Spec ↧k)]`;
  - the vanishing theorem keeps `[CharP k p]` and `2 < p`;
  - (U) keeps `Nat.Prime p` and `[CharP k p]`, with no restriction to p>2;
  - (i) has no characteristic hypothesis;
  - the gluing theorem keeps both `IsNondegenerate`, both `IsEven`, `hγ`, `hform` and `hcarrier`.
- **One-tactic probe:** each `sorry` was replaced by `first | simp | rfl | infer_instance | trivial | (constructor <;> infer_instance) | exact ⟨fun _ _ => Subsingleton.elim _ _⟩ | sorry`. All four theorems still use `sorry`, so there is no padding.

**Headlines**
- **Stated:** the vanishing theorem, (U), Picard number 22 for unirational K3 surfaces, and the gluing criterion.
- **Named as not statable** in the docstring, each for lack of analytic carriers: Kählerness, Hodge diamond, projectivity, the Picard segment, Ricci-flat metrics, simple connectivity, the cup lattice, deformation theorems, local and global Torelli, twistor lines, period surjectivity, monodromy, cone and polarized images, free involutions, fixed loci and the free and nodal period loci.
- **Supporting results, not headlines:**
  - §7.1's discriminant surjectivity and the characteristic-2 generation theorem;
  - the finite-order fixed-locus formula;
  - H²(T_X)=0.

**Library declarations opened (27)**
- **Branch pin, Mathlib `6b7abb3c`:**
  - `Birational/Dominant.lean:73`: `IsDominant`, "some (equivalently, any) representative";
  - `Birational/RationalMap.lean:392`: `IsOver`, "some partial map … is an S-map";
  - `AffineSpace.lean:49`: the `𝔸(n; S)` notation;
  - `Birational/Birational.lean:231`: `IsRationalOver`, which leaves n unbounded;
  - no "unirational" anywhere in Mathlib.
- **Branch pin, Tau Ceti `a91d3aaf`:**
  - `QuadraticForm/OrthogonalGroup/Basic.lean:180` (`orthogonalGroup`), `:818–823` (`reflection`, y−⅟(Q v)·polar(v,y)·v), `:915` (`reflectionOrthogonal`);
  - `QuadraticForm/CartanDieudonne/Basic.lean:673`: `[NeZero (2 : K)]` and `Q.Nondegenerate`, so it does not apply over 𝔽₂, as the README says;
  - `IntegralLattice/Scaling.lean:74` (`scale`) and `Dual/Scaling.lean:71` (`dualCarrier_smul`, n≠0, stated for `n • L`, which is `scale n L`);
  - `Discriminant/Group.lean:165`, `Discriminant/Quadratic.lean:122`, `Overlattice/Basic.lean:127`;
  - `LineBundle/Class.lean:50` and `:142`: `Skeleton (InvertibleSheaf X)` with its `CommGroup`, which is Pic(X);
  - `Differentials/Basic.lean:85` and `:101`, `Cohomology/Basic.lean:61`, `Sheaf/ExteriorPower.lean:49`.
- **Main pin, Tau Ceti `2fd255d9` / Mathlib `1b1ccf4b`:**
  - `Discriminant/OrthogonalGroup.lean:120`, `:249`, `:278`, with no surjectivity theorem;
  - `Sheaf/ExteriorPower/Basic.lean:66`;
  - `QuadraticForm/Transvection/Basic.lean:200`: an Eichler transvection with Q(u)=0, not an orthogonal transvection;
  - Mathlib `Dominant.lean:74` and `Birational.lean:234`.

**Sources: the seeded sample of 13 targets, and the locators new at this head.** Every locator was opened in the cached text. Printed pages equal PDF pages.

| Target | Locators opened (source line) and result |
| --- | --- |
| 0.1 | Huybrechts Def 1.1, Rem 1.2 p.7 (135, 147); Ex 1.1.3(iv) pp.8–9 (226); Rem 1.2.5 p.12 (349); §1.2.4 p.13 (373–375). All match. |
| 0.2 | Martin Thm D p.3 (126–128), Cor 1.1 p.4 (140), proof p.40 (1713–1716), Ex 5.12 p.36 (1544); RS76 Lemma 1 p.1206 (75), Thm 5 p.1216 (440), Cor 1 p.1217 (481). Huybrechts Prop 9.4.6 p.180 (6797–6798, every p>0), Prop 17.2.7 pp.367–368 (14076–14090), Prop 11.1.3 p.208 (7879–7887, isotropy step characteristic-free), Rem 8.2.13 p.151 (5646–5656), Prop 2.3.10 p.32 (1103), Prop 1.2.4 p.12 (335–338, new). Liedtke Thm 4.2, §4.3 p.20 (718, 726), Thms 4.4, 4.6 p.21 (755, 770), Thm 6.1 p.25 (934). Gounelas–Liedtke Prop 2.2(2) p.6 (253–258). Stacks 02UP (6305). All match. |
| 1.1 | Stacks 09NU (217); Huybrechts Prop 1.3.2 p.14 (420), Ex 1.3.3 (432), §1.3.2 p.15 (452–454), §1.3.3 p.16 (498), footnote 9 (515). All match. |
| 2.1 | Thm 7.3.6 p.131 (4903), Thm 9.4.11 p.183 (6904), Prop 1.3.5 and Rem 1.3.6 p.17 (525, 546). All match. |
| 3.1 | Cor 6.2.7 p.107 (3955); §6.2.4 p.108 (3980). Match. |
| 4.1 | §6.1.1 p.99 (3649), Prop 6.1.5 and Rem 6.1.6 p.101 (3705, 3718–3720); Prop 6.2.8 p.107 (3960); §6.2.5 p.108 (4001); Rem 7.3.8 and Prop 7.3.9 p.133 (4954–4987). All match. |
| 5.1 | Prop 7.3.7 p.132 (4940). Matches. |
| 5.2 | Huybrechts v1 Prop 3.10 p.10 (375), Lem 3.11 p.11 (417); draft Prop 7.3.4 and Lem 7.3.5 p.131 (4884–4889); generic line (4826). All match. |
| 6.1 | Prop 7.2.2 p.129 (4780); Cor 7.5.1 p.135 (5049); Thm 7.5.3 p.135 (5066–5068); §7.5.3–§7.5.5 (5082, 5169); v1 Prop 4.7 p.14 (527). All match. |
| 6.2 | Thm 8.5.2 p.163 (6152); Cor 8.2.9 (5618); Rem 6.3.7 p.114 (4232); §6.4 p.115 (4258). All match. |
| 7.1 | §14.0.3(vii) p.284 (10894–10896). GH §2 p.3 (109–114): D_M≅D_N≅𝔽₂¹⁰, the order of O⁺, and Nikulin 3.6.3 surjectivity for M and N. Hunnell–Hutchens–Schwartz v3 §3 p.6 (186–188): generation by orthogonal transvections unless V=H⊥H over 𝔽₂, with "nonsingular" meaning a zero radical (107), quoting Grove Thm 14.16. All match. |
| 7.2 | Shen Assumption 2.1, (2.7)–(2.8) pp.256–257 (442–468); AST Thm 3.1 p.10 (497–503); Huybrechts §15.4.3(ii) p.330 (12702). All match. |
| 7.3 | GH §2 Thm 2.1, Rem 2.2 pp.4–5 (157–188); §3 p.8, eq. (8), Namikawa Prop 6.2 (259–287); Dolgachev §5 p.15 (607). All match. |

**Cross-roadmap citations resolved**
- **On main at `35884a8`, IntegralLattices:**
  - Labels resolve: 0G (`:438`), 1B (`:441`), 1C–1D (`:442`), 1E–1F (`:443`, glossed at `:455`), 5F (`:1899`), 5G (`:1915`), 5J (`:1974`, with `:1980` leaving isometry classes to `IntegralLatticesPartII`) and 6A (`:2019`).
  - `:122` and `:1780` assign Nikulin's surjectivity theorems to `IntegralLatticesPartII`. No such roadmap is on main or in the merge order, so the special case moving down into §7.1 is correct. Recorded here as a move.
- **Other main suppliers:** none of their READMEs changed since the last review; the only commit touching one was `3d6e09ef`, MorseNovikov PROGRESS/STATUS. The earlier resolutions stand.
- **Open heads re-resolved:**
  - IndexTheory, new head `75046fc`: I6 `:1231`, I7.1 `:1337`, I7.2 `:1364`, I7.3 `:1385`, I8 `:1568`.
  - EnriquesSurfaces, new head `e852f4d`: consumes K0.A, K1–K6, K7.A–B and §7.3 (`:11`, `:42`, `:687`). Its U2 (`:654–658`) uses Γ(2)=ker(O⁺(M)→O(M/2M)) and claims no surjectivity.
- **Open heads unchanged since the last review:** PCurvature `13eb63f`, NeronModelsAndSemistableAbelianVarieties `4c22d44`, NeronModelsAndSemistableAbelianVarietiesPartII `9027cc3`, ComplexComparisonPartII `9cd29e4`, AlgebraicModuliForArithmeticGeometry `4f0ad34`, FourManifolds `46ee76a`. K3SurfacesAndSymplecticBoundedness `c1d6da0`: R02.

**Overlaps and ownership**
- The leads saying "only #1797 defines IntegralLattices §0G/§1B/§1E/§5J/§6A" are false: all resolve on main, as above.
- #1797's IntegralLattices README is byte-identical (2468 lines, empty `diff`) to main's version before the 2026-11-08 rewrite. Its 5E and 3.6.3 text is therefore a stale copy, not a second owner of §7.1's surjectivity.
- `roadmaps grep` on main and every open head for transvection, Dieudonné, Dickson, O(q_S), "discriminant kernel" and "orthogonal transvection" finds no owner of characteristic-2 generation by orthogonal transvections. Completed/OrthogonalSpinGroups excludes characteristic 2 (`:84`), and its transvections are Eichler's (2C, `:684`). So §7.1 is the owner, as its Scope paragraph (`:38–41`) says.
- Both declared gaps ask for something no supplier provides on main: neither SchemeAndStackFoundations nor ComplexKahlerGeometry states Enriques' ruledness theorem or Pic_hol(M)≃H¹(M,O_Mˣ).

**Adversarial table**

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| `IsAlgebraicK3` | Fermat quartic in char 3; abelian surface; empty scheme; square-zero thickening | ∂ᵢ=4xᵢ³=xᵢ³ (4=1), common zero only 0, so smooth; ω=O(4−4)=O, h¹(O)=0: passes. Abelian surface h¹(O)=2: fails. Empty: `IsIntegral` needs `Nonempty`: fails. Thickening: not smooth. | Sound |
| §0.1 numerics and contraction | K3 against torus; ι(dx∧dy); 2σ in char 2 and 3 | χ=1−0+1=2, c₂=12·2−0=24; torus 0 and 0. ι_∂x=dy, ι_∂y=−dx. Char 3: 2·2=1. Char 2: 2σ=0. | Sound |
| `algebraicK3_differential_vanishing` | binder; p=2; probe | `[CharP k p]` and 2<p force an odd prime. p=2 is excluded though true (G–L line 258, all p>0). The probe leaves `sorry`. | Sound |
| Restricted structure | x∂ₓ on 𝔸¹; t²∂ₜ on ℙ¹; D=t∂ₜ+c·u∂ᵤ; étale fixed points | (x∂)ᵖxⁿ=nᵖxⁿ=nxⁿ. (t²∂)ᵖtⁿ=n(n+1)⋯(n+p−1)t^{n+p}≡0. (cᵖD−cD^[p])/(cᵖ−c)=t∂ₜ. The Jacobian of xᵢᵖ−ΣNᵢⱼxⱼ is −N, invertible. | Sound |
| (U) `unirational_of_nontrivial_vectorField` | p=2; meaning of `Nontrivial`; true statement?; probe | `hp : p.Prime` admits 2. Hom is preadditive, so Nontrivial means a nonzero map exists. Huybrechts 9.4.6 (6797) covers every p>0. T_X≅Ω¹⊗ω^∨≅Ω¹, so by G–L the hypothesis never holds: a route lemma, used contrapositively by the Part II at p=2. Not closed by one tactic. | Sound |
| (i) `finrank_lineBundleClass_eq_twentyTwo_of_unirational` | Fermat quartic char 3; char 0; ℙ², ℙ¹×ℙ¹; `finrank` junk value | ρ=22 (p.367); b₂=24−1−1−0−0=22. Char 0: σ would pull back to a nonzero 2-form on Bl ℙ², but p_g=0, so the statement is vacuous. Control surfaces have ranks 1, 2 = b₂. `finrank`=0 on infinite rank, so "=22" excludes the junk value. | Sound |
| (i) finite generation | G=ℤe, Gram (2) | D=2; (x,e)=2c∈ℤ gives c∈½ℤ⊇ℤ, so G⊂(1/D)ℤʳ. | Sound |
| Steps (ii)–(iii) | rank 22, signature (1,21); reflection degree | Indefinite of rank ≥5, so isotropic (7886). (s_C L·H)=(L·H)+(L·C)(C·H)<(L·H) when (L·C)<0 (5653). | Sound |
| Step 3 | k=1, 2 | Values 0; 12; 3^{2k}+3 = 12, 84; 3^{2k−1}+9 = 12, 36. Reaching 24 needs 21 or 15 as a power of 3. | Sound |
| §1.1 segment and cone | logs ¼, ¼, ±½; diag(1,−1); L⊗L | ¼−½+¼=0 and ¼+½+¼=1, with units i, i, −1. (κ,κ)=1, (−κ,κ)=−1, (1,1)²=0. 2d becomes 8d. | Sound |
| §2.1 | V↦2V; σ=ω_J+iω_K; Λ | c=½. σ²=2−2=0 and (σ,σ̄)=4. det Λ=(−1)³, rank 22, τ=(0−48)/3=−16=3−19. | Sound |
| §3.1 | ε²=0; quartic; 2h | Tangent dimension 20; polarized 20−1=19; (2h)²=8. | Sound |
| §4.1 | B=±I₂, z=(1,i); c=3+4i; ranks 0, 1 | Values 0 and 2, or −2. \|c\|²=25, giving 50. Ranks 0 and 1 give empty sets. Locator fixed. | Sound |
| §§5.1–5.2 | κ²=2; conic; (I+J)/√2 | Squares 2 and 8; (−κ,κ)=−2. z²=0 and B(z,z̄)=2; ((I+J)/√2)²=−1. | Sound |
| §§6.1–6.2 | φ against −φ; reflection | Orientations (−1)³=−1. (x+δ)²=2+2−2=2, whereas the minus-sign formula gives −2. χ(O(δ))=2−1=1. | Sound |
| §7.1 model | ranks, discriminants, pairings | Ranks 10 and 12, signatures (1,9) and (2,10). \|A\|=2¹⁰ each; 2²⁰/2²⁰=1. (e,e)·(f,−f)=0; (e,e)·(f,f)=2. | Sound |
| `gluing_isometry_extension_iff` | ⟨2⟩⊕⟨−2⟩, g=−id; ⟨4⟩⊕⟨−4⟩; ⟨2⟩⊕⟨2⟩; rank 0 | First: both sides true. Second: 3≠1, and (−e+f)/4 is outside the graph, so both false; with both signs negative, 3=3. Third: q=½, so no anti-isometry. Rank 0: trivially true. Probe leaves `sorry`. | Sound |
| §7.1 classes with Q=1 | enumeration of E₈ mod 2E₈ | 240 roots give 120 classes; 2160 norm-4 vectors give 135; 1+120+135=256. 1·136+3·120=496=2⁹−2⁴. Representatives: (e−f)²=−2, (e+f+y)²=2−4, (e+y)²=0−2. | Sound |
| §7.1 generation (HHS) | n·H over 𝔽₂, n=1, 2, 3, by brute force | n=1: 1 transvection generates order 2. n=2: 6 generate 36 of \|O\|=72 (the exception). n=3: 28 generate 40320=\|O⁺(6,2)\|. \|O⁺(10,2)\|=46998591897600=2²¹·3⁵·5²·7·17·31. | Sound |
| §7.1 controls | E₈ reflections only; U(2); x̄↦x̄+b(x̄,ē)ē; ⟨12⟩ | E₈ reflections fix U/2U. O(q_{U(2)})={id, ē↔f̄}, reached by s_{e−f}. f̄ (Q=0) goes to ē+f̄ (Q=1), so the map is not orthogonal. ⟨12⟩: O(q)={1,5,7,11}, while O={±1} reaches {1,11}. | Sound |
| §7.1 O⁺(T) step | −id_U⊕id_S | Acts trivially on A_T (A_U=0); on ⟨u₊,s₊⟩ the determinant is −1, so it swaps the two components. | Sound |
| §7.1 Tau Ceti carriers | both pins | `discriminantOrthogonalHom` absent at `a91d3aaf`, present at `2fd255d9`. `Sheaf.ExteriorPower` present at `a91d3aaf`, absent at `2fd255d9`. | R01 |
| §7.2 fixed-locus formula | id on S²; reflection; antipodal; double sextic | 2=χ(S²); 1−1=0=χ(S¹); antipodal 0; −18=2+(1−21); normal factors 2, 4, 3. | Sound |
| §7.2 AST and the isometry class | (1,1,1), (10,10,0), (10,8,0); ⟨2⟩⊕⟨−2⟩⁹ | g=10 gives χ=−18=2+2−22. (10,10,0): S(½)=U⊕E₈(−1) by 6A. Control: q(e/2)=¼ gives δ=1, and the halved form ⟨1⟩⊕⟨−1⟩⁹ is odd. | Sound |
| §7.3 marking group and loci | restriction onto O⁺(T); e−f, e′−f′, e−2f; C−jC | ḡ=γ⁻¹h̄γ is lifted by surjectivity. Squares and divisibilities −2/1, −4/2, −4/1. (C−jC)²=−4. | Sound |
| Downstream consumers | K3SurfacesAndSymplecticBoundedness head | `:406` re-proves (U) at p=2. | R02 |

## Not verifiable

- **Rudakov–Shafarevich 1983, p.1502**, the pencil step of sub-target (iv): recorded as uncertified. Martin's proof on p.40 quotes it (line 1714).
- **Nikulin 1983, Theorem 4.2.2:** recorded as uncertified. The statement is certified through Artebani–Sarti–Taki Theorem 3.1 (lines 497–503).
- **Grove, *Classical Groups and Geometric Algebra*, Theorem 14.16:** the primary source behind the Hunnell–Hutchens–Schwartz sentence §7.1 cites. It is not in the cache, and the README does not cite it.
- **Gap registration:** the board package has no `design/plan.json`, so I could not confirm that `gap:integral-topology` and `gap:enriques-ruledness` are registered where the intake reads them.
- **Elaboration at main's pins:** not run. This brief's Lean commands run only in this worktree at its pins. R01's repair re-runs the targeted build there.

## Source issues

- **Misprint** in char2-orthogonal-involutions at §3, p.6: the source writes that V is "not of the from" H⊥H; it should read "not of the form"; affects nothing.
