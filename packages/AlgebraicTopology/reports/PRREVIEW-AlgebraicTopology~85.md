# Review of AlgebraicTopology (pull request #1652 at 287181d)

**Verdict:** needs changes

Incremental re-review of the 90 lines of `TauCetiRoadmap/AlgebraicTopology/` changed since 1f5b3f6, the head the previous review read: the ClassifyingSpaces supplier bullet, §2.6's and §4.7's new locators, the rewrite of §8.8b's group-cohomology identification with its new Check, the two reference entries, and the module docstring of `Suggested.lean`. Two of the previous four findings are repaired and verified; the two carried below are the branch pin (with the two Hurewicz headlines it keeps out of `Suggested.lean`) and the pull request's own title and description. Neither is blocking. The rewritten mathematics of §8.8b is correct against the pinned declarations and against the instances computed below.

## R01 (P3) — The branch pin is still `358314d4`, so the two Hurewicz headlines stay absent from `Suggested.lean`

**Location.** `lake-manifest.json:8` (Tau Ceti `358314d4`); `Suggested.lean:35`–`:39` ("need based pairs, relative homotopy groups and the relative and absolute Hurewicz maps (`TauCeti.BasedTopPair`, `TauCeti.RelHomotopyGroup`, `TauCeti.RelHomotopyGroup.hurewicz`, `HomotopyGroup.hurewicz`), which the Tau Ceti revision this file is built against does not have"); `README.md:240`–`:243`.

**Claim.** The file states every headline statable at the pins; relative Hurewicz for a simply connected subspace and the universe-general absolute theorem are not statable.

**Witness.** `git diff origin/main HEAD -- lake-manifest.json` still changes 235 lines: the branch pins Tau Ceti `358314d4` while `README.md:240`–`:242` declares, and main's manifest records, `2fd255d9`. The branch's package has no `TauCeti/AlgebraicTopology/Homotopy/` directory. At `2fd255d9` every named carrier exists: `RelHomotopyGroup` (`AlgebraicTopology/Homotopy/Relative/Basic.lean:302`, on a `BasedTopPair`), `RelHomotopyGroup.hurewicz` (`Homotopy/Relative/Hurewicz.lean:324`) and `HomotopyGroup.hurewicz` (`Homotopy/Hurewicz/Basic.lean:201`). So the docstring's sentence is true only of a pin the README does not read its suppliers at, becomes false the moment main is merged, and two headlines the README names (`:2792`–`:2798` and §8.3–§8.4) are statable at the declared revision but absent.

**Repair.** Carried from the previous review's R01 (and its predecessors). Merge `origin/main` (keeping the deletions of the seven auxiliary Lean files at the modify/delete conflicts) and re-run the gate, so the file is built at the revision the README reads. Then state in Layer 8 relative Hurewicz for `n ≥ 2`, `A` nonempty and simply connected, `π_i(X,A,a₀) = 0` for `1 ≤ i < n`, in every universe (bijectivity of `TauCeti.RelHomotopyGroup.hurewicz` with coefficients `ModuleCat.of ℤ (ULift ℤ)`, evaluated at `1`), and the absolute theorem for `X : Type u` on `HomotopyGroup.hurewicz`; replace `:35`–`:39` by the sentence that the twisted, boundary and compact-triad dualities are not stated and why. The sentence "Results that Tau Ceti proves are consumed through the README's supplier contracts" (`:26`) can stay.

## R02 (P3) — The pull-request title and description are stale and state no merge order

**Location.** The title ("compact Cech pairs and relative cup modules") and description ("This amendment changes only README mathematics; existing Lean modules are unchanged"), byte-identical to the two previous rounds.

**Witness.** `git diff --stat origin/main...HEAD` deletes seven Lean files of the folder and rewrites `Suggested.lean`; `README.md:161`–`:162` puts compact closed-pair Čech theory outside scope. The overlap report lists six conflicting heads that change this folder (#1663 by the same author on the same two files; #1797, #1807, #1808, #1854; #1187 on `Suggested.lean` and the manifest), and the description names none.

**Repair.** Carried from the previous review's R04. Retitle and rewrite the description to what the head does (README in the standard shape, `Suggested.lean` reduced to its headlines, seven auxiliary files deleted, compact Čech pairs out of scope), and state which of #1652 and #1663 is rebased onto the other and that #1797, #1807, #1808, #1854 and #1187 are rebased onto whichever lands.

## Previous findings

- R01 — not repaired: `lake-manifest.json:8` still pins `358314d4`; `Suggested.lean:35`–`:39` now names the four missing carriers in one sentence but states neither Hurewicz theorem. Now R01.
- R02 — repaired: `README.md:3054`–`:3073` makes §6.1's direct cochains on the nerve's covering `Eπ→Bπ` the one identification `H^n(Bπ;A) ≅ groupCohomology A n`, names the two natives as its trivial-coefficient and dual-system special cases with their exact target modules, and adds the ℤ/2 Check at `:3095`–`:3099`; the supplier bullet `:367`–`:376`, `:380`–`:382` names each native's module. All verified at `2fd255d9` and by the computed instances below.
- R03 — repaired: §2.6 `:820`–`:823` cites Hatcher §3.H, p.333 (hatcher 14562–14575: homotopic maps give isomorphic pullback bundles, the pair sequence, excision by subdivision, additivity); §4.7 `:1337`–`:1339` cites May §14, Theorem 14.1 (by locator; the reference entry `:3654`–`:3657` now links May's own page) and `:1346`–`:1348` VBKT Proposition 1.20, p.36 (vbkt 1445, page marker 40: every CW complex is paracompact), added to the VBKT entry at `:3647`–`:3649`.
- R04 — not repaired: title and description unchanged. Now R02.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate at 287181d prints every counter zero (`… sorry-data=0 … imports=0 … dropped=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 … outside-folder=0 … build=0 OK`). `git diff --stat origin/main...HEAD` outside the folder is empty.
- The dependency check re-run here prints `depcheck: 238 roadmaps, 2324 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` at the branch pin: 13 s, exactly 12 "declaration uses `sorry`" warnings and nothing else.

**Lean statements.** The diff changes only the module docstring (`:26`–`:41`); the 21 declarations (12 sorried theorems, 8 definitions, the coercion class) are byte-identical to 1f5b3f6, so the previous report's signature comparison (`#check @name` for every declaration, no section `variable` in the file, each type matching its README statement) and its one-tactic padding probe (nothing closes; nothing restates a definition, mirrors a Check or computes a value) stand. The worker's elaborated-signature file lists the same 21 and reports no lost binder.

**The changed passages.**
- Supplier bullet (`:355`–`:383`), read at `2fd255d9`: `classifyingSpaceSingularCohomologyIsoGroupCohomology` (`ClassifyingSpace/Cohomology.lean:89`) lands in `groupCohomology (Rep.trivial k G M) n` for `k G M : Type u`; `classifyingSpaceTwistedHomologyIsoGroupHomology` (`LocalCoefficients.lean:136`) lands in `groupHomology A n` for every `A : Rep k G`; `classifyingSpaceTwistedCohomologyIsoGroupCohomology` (`:150`) has source `(classifyingSpaceLocalSystem k A).twistedCohomology k (ModuleCat.of k N) n` and target `groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n`; `IsQuotientCoveringMap.singularCohomologyIsoGroupCohomology` (`Cohomology/GroupCohomology.lean:248`) has `[ContractibleSpace E]` as its only extra hypothesis and lands in `groupCohomology (Rep.trivial k G M) n`. Every clause of the bullet says exactly this. `classifyingSpaceSingularHomologyIsoGroupHomology` (`Homology.lean:69`), untouched, lands in `groupHomology (Rep.trivial k G k) n`, coefficients `k` only; the bullet claims nothing more for it.
- §8.8b (`:3054`–`:3073`): the direct cochains of §6.1 on the covering `Eπ→Bπ` are the π-equivariant `A`-valued cochains of `Eπ`, whose normalized cellular chains (one cell per nondegenerate simplex of the nerve of the action groupoid) are the bar resolution; the comparison with `TauCeti.universalGSpaceResolution` up to augmentation-preserving chain homotopy is the standard comparison of free resolutions. The sentence on agreement "exactly under §6.1's fibrewise reflexivity, for N=ℤ when the fibre of A is free of finite rank" matches §6.1 at `:1801`–`:1802` and `:1861` (reflexivity, with finite projectivity as the example); "when" is a sufficient condition, as written. Universe: Mathlib's `Rep ℤ π` already puts π in `Type 0`, so the natives' one-universe constraint costs nothing here.
- New Check (`:3095`–`:3099`): values recomputed in the table. §2.6 and §4.7 locators: verified in the cached texts as under Previous findings; May's Theorem 14.1 is cited by locator (Not verifiable).
- Docstring (`:26`–`:41`): the names it lists exist at `2fd255d9` and not at `358314d4` (R01); the rest is unchanged from the passed version.

**Sample targets falling in the change.** Of the seeded sample, "8.8 Nonabelian classifying spaces" is the only target the diff touches: Hatcher Proposition 1B.9, p.90 (hatcher 3905) for the `[X,Bπ]` classification was verified in the previous round and is unchanged; the group-cohomology sentence is verified above. "1.5", "1.6", "3.2", "3.5", "5.1", "5.4", "6.3", "7.1"–"7.4", "8.4", "8.7", "8.10" are untouched and were verified at 1f5b3f6 (that report's sample table).

**Adversarial table.** Rows marked "carried" are the previous report's rows for statements the diff leaves untouched, with the values as computed there; the remaining rows are computed here for the changed passages.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| 2.6 homotopy invariance via pullback (new locator) | rank-one system on S¹, monodromy u = −1 over ℤ; f₀ = id, f₁ = rotation by π; g(z) = z² | pullbacks along f₀, f₁ both have monodromy −1: H₀ = ℤ/2, H₁ = ker(−2) = 0 on both sides; pullback along g has monodromy (−1)² = 1: H₀ = H₁ = ℤ, so a non-homotopic map changes the groups while homotopic ones do not | Holds |
| 2.6 pair sequence with local coefficients | (S¹, {p}), monodromy u = 2 over ℤ/5 | H₁(S¹;L) = ker(u−1) = ker(1) = 0, H₀ = coker(1) = 0; H₀({p};L) = ℤ/5; the pair sequence gives H₁(S¹,{p};L) = ℤ/5 = H₀({p}) and H₀(S¹,{p};L) = 0 | Holds |
| 4.7 realization CW structure (May 14.1) | Δ[0], Δ[1], ∂Δ[2] | one 0-cell; 2 + 1 cells, χ = 1; 3 + 3 cells, χ = 0, H₁ = ℤ; counting the degenerate 1-simplex s₀v of Δ[0] would add a cell and give χ = 0 ≠ 1 | Holds |
| 4.7 paracompactness (VBKT 1.20) | countable wedge of circles with the weak topology; the long line | the wedge is CW, hence paracompact, though not first countable at the wedge point; the long line is Hausdorff and locally Euclidean but not paracompact, so admits no CW structure, consistent with the proposition | Holds |
| 8.8b direct identification `H^n(Bπ;A) ≅ groupCohomology A n` | π = ℤ/2, A = ℤ/2 trivial; π = ℤ/2, A = ℤ trivial; π = ℤ/2, A = ℤ with sign action; π = S₃, A = ℤ trivial | ℤ/2 in every degree on both sides (Bπ ≃ RP^∞); ℤ, 0, ℤ/2, 0, ℤ/2, … on both sides; 0, ℤ/2, 0, ℤ/2, … = H^n(RP^∞; ℤ_w); H¹ = Hom(S₃,ℤ) = 0 and H² = Hom(S₃^ab, ℚ/ℤ) = ℤ/2 on both sides, the nonabelian group allowed | Holds |
| 8.8b trivial-coefficient natives as special cases | π = ℤ, M = ℤ; π = ℤ/2, M = ℤ | H¹(S¹;ℤ) = ℤ = H¹(ℤ;ℤ_triv), H² = 0 = H²(ℤ;ℤ_triv); H²(RP^∞;ℤ) = ℤ/2 = H²(ℤ/2;ℤ_triv); both agree with the direct identification at `A = Rep.trivial ℤ π M` | Holds |
| 8.8b dual-system native and the new Check | π = ℤ/2, A = ℤ/2 trivial, N = ℤ; A = ℤ trivial, N = ℤ; A = ℤ_sign, N = ℤ; A = ℤ^ℕ, N = ℤ | Hom(ℤ/2,ℤ) = 0, so the native gives H^n(ℤ/2;0) = 0 ≠ ℤ/2 = `groupCohomology A n`: a different group, as the Check says; Hom(ℤ,ℤ) = ℤ trivial, agree; dual of the sign representation is the sign representation, agree; ℤ^ℕ is reflexive without finite rank, so "free of finite rank" is sufficient, not necessary, which is what "when" states | Holds; no change |
| 8.8b compared resolutions | π trivial; π = ℤ | nerve of the trivial group: one nondegenerate simplex in degree 0, normalized bar resolution ℤ in degree 0; `universalGSpaceResolution` of the countable join has countably many vertices, so the comparison is a chain homotopy equivalence, not an isomorphism, as the README says ("up to augmentation-preserving chain homotopy"); for ℤ the bar complex has rank 1 in each degree with differentials 0, t−1, 0, … | Holds |
| Docstring carriers | `BasedTopPair`, `RelHomotopyGroup`, `RelHomotopyGroup.hurewicz`, `HomotopyGroup.hurewicz` at `358314d4` and `2fd255d9` | absent (no `Homotopy/` directory) vs present at `Relative/Basic.lean:302`, `Relative/Hurewicz.lean:324`, `Hurewicz/Basic.lean:201` | R01 |
| 1.3 based theorem (carried) | S¹ by two arcs through x₀ | U₁∩U₂ has 2 components; free product of trivial groups → ℤ not onto; groupoid colimit gives ℤ | Holds |
| 1.6 topological groups (carried) | U(1): zᵐ·zⁿ; squaring; SO(3) | class m+n; 2m+2n both ways, 2m+n for a one-factor model; π₁ = ℤ/2, nontrivial class squares to 1 | Holds |
| 2.1 quotient chains (carried) | X = pt, A = ∅; A = X | C_n(pt)/0 = ℤ, H_n(pt,∅) = H_n(pt); 0 | Holds |
| 2.3 pair and triple (carried) | (D¹,S⁰); (D¹,S⁰,pt) | H₁(D¹,S⁰) = ker(ℤ² → ℤ, (a,b) ↦ a+b) = ℤ; triple map H₁(D¹,S⁰) → H₀(S⁰,pt) = ℤ iso | Holds |
| 2.5 shuffle class, n = 2 (carried) | T₁ − T₂ | ∂ = right + bottom − top − left; swap gives −1; unsigned sum leaves 2·diagonal | Holds |
| 2.5 S⁰ class (carried) | [q] − [−q] vs [q] + [−q] | local images (+1,−1) vs (+1,+1); augmentation 0 vs 2 | Holds |
| 2.6 transport convention (carried) | rank-one system on S¹, monodromy u | zeroth face transported: δ⁰(a) = u⁻¹a − a; forward model ua − a; u = 2 over ℤ/5 gives 2a vs a | Holds |
| 3.1 Sd, T on [v₀,v₁] (carried) | Hatcher formulas | Sd σ = [b,v₁] − [b,v₀]; ∂T + T∂ = σ − Sd σ; T[v] = [v,v] | Holds |
| 3.2 small chains (carried) | two-arc cover of S¹ | after one subdivision each half lies in an arc; H₁ = ℤ on both sides | Holds |
| 3.3 excision with ε on S¹ (carried) | p ∈ S¹, arc U ∋ p | H₁(S¹,S¹∖{p};ε) ≅ H₁(U,U∖{p};ℤ) = ℤ while H₁(S¹;ε) = 0 | Holds |
| 3.4 two-arc S¹ (carried) | H₀(U∩V) = ℤ² | (a,b) ↦ (a+b, −a−b), kernel ℤ(1,−1) = H₁(S¹) | Holds |
| 4.2 degree formula (carried) | RP², RP³ | d₁ = 0, d₂ = 2, d₃ = 0: H(RP³) = (ℤ, ℤ/2, 0, ℤ); 1 + (−1)^k is 0, 2, 0 | Holds |
| 4.3 RP² cellular (carried) | d₁ = 0, d₂ = 2 | H₁ = ℤ/2, H₂ = 0; d₂ = 0 would give H₂ = ℤ | Holds |
| 4.4 quotients (carried) | X/∅, X/X, (D⁰,∅), (I,∂I) | X₊; point; [−p] − [p]; winding +1 and −1 | Holds |
| 4.5 pushouts (carried) | S⁰ → pt; degree m on S¹; (∅,∅) | χ = 1 − 1 = 0 vs 3 − 1, 2 − 1; d₂ = m (S¹∨S², RP²); identity | Holds |
| 4.6 RPⁿ and sign system (carried) | n = 2 constant/ε; RP¹; S² frames | (ℤ,ℤ/2,0) vs (ℤ/2,0,ℤ); d₁ = 2, H₁(RP¹;ε) = 0, H₀ = ℤ/2; det(−A) = −det A in ℝ³, +det A in ℝ² | Holds |
| 4.7 cell homeomorphism (carried) | n = 1, z = ±1; n = 2, z = (1,0) | z = 1 ↦ e₁, z = −1 ↦ e₀; w = (−1,1,0), m = 1, weights (0, 2/3, 1/3) on the face opposite e₀ | Holds |
| 4.8 Sierpiński (carried) | opens ∅,{1},{0,1} | k-topology identical, not T2 | Holds |
| 5.1 Künneth (carried) | RP²×RP² over 𝔽₂ and ℤ | H₂ = 𝔽₂³ vs ℤ/2 = Tor(ℤ/2,ℤ/2) | Holds |
| 5.2 Wang (carried) | Klein bottle, reflection r | id − r_* = 2 on H₁(S¹); H₁(K) = ℤ ⊕ ℤ/2 | Holds |
| 5.3 transfer (carried) | identity; two sheets over a point, ℤ and 𝔽₂; ∅ → B; S² → RP² over 𝔽₃ | id; 1 ↦ (1,1) ↦ 2, (1,1) ≠ 0 while 2 = 0 in 𝔽₂; zero map; π^* injective onto the ℤ/2-invariants H^0 = 𝔽₃, H² = 0 | Holds |
| 5.4 torus (carried) | T², T³; 2×2 matrix on H₁ | Betti 1,2,1 and 1,3,3,1; Λ² acts by det | Holds |
| 5.5 Serre Checks (carried) | S¹×S² → S² vs Hopf; ∅ → B; {1} → S¹ | E² = ℤ at (0,0),(0,1),(2,0),(2,1); d² = 0 vs iso; E² = 0; E²₍₁,₀₎ = ℤ vs H₁ = 0 | Holds |
| 5.6 Čech differential (carried) | three opens; (1,1) term | δδc has U₂-component c − c = 0 vs 2c; D² = 0 vs 2δ∂c | Holds |
| 5.7 point cover (carried) | 0 → R → R² → R → 0 | c ↦ (−c,c), (a,b) ↦ a+b exact; H₀ = R | Holds |
| 6.0 towers (carried) | (3,1,0,…); ×2; ×3 | δ gives (2,1,0,…); 3x₀ + 1 ≡ 0 mod 4ᵏ impossible; Σ3ⁿ = −1/2 ∉ ℤ | Holds |
| 6.0 homotopy-square maps (carried) | fₙ = n·id on R → R; g = f | squares fail by id, correction −xₙ₊₁ cancelled; composite fails by 2n+1 = (n+1) + n | Holds |
| 6.1 transport (carried) | rank one, u = 2 over ℤ/5; fibre ℤ/2 over ℤ on a point | u⁻¹ − 1 = 2 vs u − 1 = 1; direct cochains ℤ/2, dual-system cochains 0 | Holds |
| 6.2 `lsCupLength_add_one_le_of_categoricalCover` (carried) | point; S¹; CP^∞ over ℤ; zero ring; ∅; n = 0 | 0+1 ≤ 1; 1+1 ≤ 2; length ⊤, no finite categorical cover; sSup ∅ = 0 and 1 ≤ n; excluded by `[Nonempty X]`; `Fin 0` cover forces X = ∅ | Holds |
| 6.3 local generator (carried) | m = 1,2; reflection; m = 0 | det(I+J) = 1+m > 0; −1; empty determinant +1 | Holds |
| 6.4 `IsFundamentalClass` (carried) | S¹/ℤ: identity class and twice it; RP²/ℤ/4: the class 2; two points/ℤ; zero ring | generator caps ℤ → ℤ iso; 2 ∈ ℤ/4 not a generator, excluded; (u₁,u₂) bijective, (1,0) fails; both sides 0 | Holds |
| 6.4 `poincareDuality_twoTorsionCoefficients` (carried) | S¹/𝔽₂; RP²/𝔽₂; RP²/ℤ/4; n = 0 | caps 𝔽₂ → 𝔽₂ bijective; Betti 1,1,1; 2 ≠ 0 excludes it; μ = 1 | Holds |
| 6.4 Lefschetz D² (carried) | k = 0,1,2 | R ↔ R, 0 ↔ 0, R ↔ R; absolute version fails at k = 0 | Holds |
| 6.5 linking (carried) | RP³; L(5,1), L(5,2); (5,2); 3-manifolds | 1/2; {1/5,4/5} vs {2/5,3/5}; exponent 9 skew; exponent (i+1)(n−i) even | Holds |
| 7.1 Euler and local systems (carried) | point; circle (1 or 2 cells); S²; Möbius system over ℚ, 𝔽₂ | 1; 0 = 0; 2; d₁ = 2 invertible so 0 = 1·0; trivial system, sum 0 | Holds |
| 7.2 `finsum_finrank_singularHomology_fiberBundle` (carried) | S³ → S²; Klein bottle over ℚ and 𝔽₂; S²×S²; empty base or fibre | 0 = 2·0 with d² ≠ 0; Betti 1,1,0 and 1,2,1, sum 0 = 0·0; 4 = 2·2; 0 = 0 | Holds |
| 7.4 standard values (carried) | S⁰, S¹, S²; T¹; CP⁰ | 2, 0, 2 = 1 + (−1)ⁿ; 0; 1 = 0 + 1 | Holds |
| 8.1 relative groups (carried) | (D²,S¹); RP² rel RP¹; k(S¹×S¹) | π₂ ≅ π₁(S¹) = ℤ; π₁(RP²,RP¹) = 0, ℤ → ℤ/2 onto not injective; diagonal loop ↦ (1,1) not (1,0) | Holds |
| 8.2 nerve of S₃; Moore complex (carried) | g = (12), h = (23); ℤ[Δ¹/∂Δ¹]; constant S₃ | d₁(g,h) = hg sends 1 ↦ 3, gh sends 1 ↦ 2; N₁ = ℤ(e − s₀v), N₂ = 0, unnormalized ranks 1,2,3; π₀ = S₃ nonabelian, π_n = 0 | Holds |
| 8.3 absolute Hurewicz (carried) | S¹ loops; S¹∨S¹; S² | k[S¹]; a^m b^n ↦ (m,n), commutator ↦ 0; identity ↦ +[S²], antipodal ↦ −[S²] | Holds |
| 8.4 relative Hurewicz (carried) | (D²,S¹∨S¹); (Dⁿ,Sⁿ⁻¹), n ≥ 3; (ℝ,(0,1)) | π₂ = F₂, H₂ = ℤ², abelianization; ℤ → ℤ, +1; 0 → 0 | Holds |
| 8.5 `homologicalWhitehead` (carried) | point; Poincaré sphere → S³; degree ±1, 2 on S² | identity; homology iso but π₁ of order 120, excluded by `SimplyConnectedSpace`; ±1 equivalence, ×2 not | Holds |
| 8.5 `properStrongDeformationRetract_of_inverse` (carried) | A = X; I with A = {0}; ℝ with A = {0}; A = ∅ | r = id, preimages I×K; H(t,x) = (1−t)x proper; constant inverse has preimage ℝ, so `hg` fails; g : C(X,∅) forces X = ∅ | Holds |
| 8.5 ends (carried) | ℝ, ℝ², ℝ³ | ends 2,1,1; SC at infinity true, false, true; stable π₁ 0, ℤ, 0 | Holds |
| 8.6 normalization (carried) | n = 1 | t ↦ t to winding +1, reflection to −1 | Holds |
| 8.7 CW type and recognition (carried) | n = 0; I; D²; Sⁿ; Poincaré sphere; n = 1; n = 0 in Lean | finite discrete; 2+1 cells; point; identity; excluded; H₁ = 0 ≠ ℤ contradictory; hypotheses are a point's homology, X ≃ pt, X ≃ S⁰ false, excluded by `2 ≤ n` | Holds |
| 8.8 `groupClassifyingSpace_isEMOne` (carried) | trivial group; ℤ; S₃ | point; S¹, generator edge +1; six elements, (12)(23) ≠ (23)(12), allowed since the predicate is `IsAspherical ∧ Nonempty (π₁ ≃* G)` | Holds |
| 8.8b comparison `c_G` (carried) | G = ℤ: nerve ≃ S¹, Milnor model ≃ S¹ | two equivalence classes, degrees ±1; `exists_homotopyEquiv` with φ = κ_model⁻¹κ_bar selects degree +1, the degree −1 model is excluded | Holds |
| 8.9 obstruction (carried) | D², f₁ of degree k, attaching degree m | c(f₀) = m, c(f₁) = km, δd = m(k−1) | Holds |
| 8.10 representability (carried) | X = ∅; S¹⊔S¹, A = ℤ, n = 1; n = 0 | one element vs 0; ℤ×ℤ; functions π₀X → A | Holds |
| 8.11 metric realization, ANR, domination (carried) | Δ¹; wedge x_j; Cantor set; S¹ → * → S¹ | d = 2|t−s|; 2/j → 0 only in K_m; no retraction; 0 ≠ 1 on H₁ | Holds |
| 8.11 `finiteSourceMappingCWType` (carried) | X = ∅; Y = ∅, X ≠ ∅; Y Sierpiński | C(∅,Y) a point; C(X,∅) = ∅ with the empty complex; contractible, K a point | Holds |
| 8.12 EM comparisons (carried) | RP¹, CP¹ | π₁ = ℤ ≠ ℤ/2; π₃ = ℤ ≠ 0 | Holds |

**Library declarations opened this round** (file:line at the revision named).
- `2fd255d9` (the README's declared revision, the content checkout's package): `TauCeti/AlgebraicTopology/ClassifyingSpace/LocalCoefficients.lean:126` (`classifyingSpaceLocalSystem`, `(A : Rep.{u} k G)` with `k G : Type u`), `:136` (`classifyingSpaceTwistedHomologyIsoGroupHomology`, target `groupHomology A n`), `:150` (`classifyingSpaceTwistedCohomologyIsoGroupCohomology`, target `groupCohomology ((Rep.ihom A).obj (Rep.trivial k G N)) n`); `ClassifyingSpace/Cohomology.lean:89` (target `groupCohomology (Rep.trivial k G M) n`); `ClassifyingSpace/Homology.lean:69` (target `groupHomology (Rep.trivial k G k) n`); `Cohomology/GroupCohomology.lean:248` (`[ContractibleSpace E]`, target `groupCohomology (Rep.trivial k G M) n`); `Homotopy/Relative/Basic.lean:302`, `Homotopy/Relative/Hurewicz.lean:324`, `Homotopy/Hurewicz/Basic.lean:201`.
- `358314d4` (branch pin): the six imported modules elaborate; no `TauCeti/AlgebraicTopology/Homotopy/` directory.

**Cross-roadmap citations in the changed passages.** §8.8b cites §6.1 (`:1795`–`:1825`, `:1855`–`:1861`: direct cochains, dual system, reflexivity), Layer 6's first-vertex cochains, DGFloer Layer 1 item 4 and Hatcher 1B.9, all unchanged and resolved in the previous round. §4.7 cites AffineMorseLefschetz A4, GeometricTopology Layer 11 and CharacteristicClasses C1.2, unchanged. Remark, not a finding: ClassifyingSpaces on main (e7bcd5eb, `README.md:43`–`:45`, item 17 at `:238`–`:241`) states for Milnor's model that cohomology with coefficients in a `G`-module is `groupCohomology`, without saying through which cochains; Tau Ceti's realization of that plan is the Hom-of-twisted-chains form, and §8.8b's direct-cochain identification on the nerve model is the different, more general object the previous review already passed as this roadmap's. ClassifyingSpaces does not cite this roadmap for it and this roadmap does not cite ClassifyingSpaces, so there is no cycle.

**Overlaps.** The changed passages touch no cited or dropped id; the four dropped `stage-k` anchors remain mapped at `:581`–`:596`. The six conflicting heads are R02. Ownership against open pull requests: the changed passages add no new object; the previous round's `roadmaps grep` for the direct group-cohomology identification, `IsFundamentalClass`, the proper SDR, the nerve K(G,1) and the bundle Euler formula found no second owner, and no open pull request listed in the overlap report changes §8.8b.

## Not verifiable

- May, *Simplicial Objects in Algebraic Topology*, §14, Theorem 14.1 (and §§3, 17): the manifest's copy is image-only and OCR is unavailable on this worker; the README now links the author's own page, a legal copy; cited by locator. The statement as the README phrases it (one n-cell per nondegenerate n-simplex) is the standard content of that theorem.
- Milnor 1957, Eilenberg–Steenrod, G. W. Whitehead, Dold, Serre 1951, McCleary, K. Brown, Conway–Friedl–Herrmann: no open copy in the manifest; cited by locator. Uncertified by the manifest: Freedman–Quinn, Milnor 1963, Weibel, Lee, tom Dieck.
- Elaboration of `Suggested.lean` at `2fd255d9`: not run (the permitted Lean commands run in the branch worktree, pinned at `358314d4`); the Hurewicz carriers were checked by reading the files at that revision.

## Source issues

- none
