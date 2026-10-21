# Repair report: SelmerIwasawaCohomologyPartII

## F01 (P1) — applied

§2.6: globally trivial exceptional bundle → ℙ_lines(L₀⊕L₁), with tautological generator η, Chern relation, two section classes and both exceptional normal lines. The additive blowup splitting remains. §§5.3–5.4 use these splittings and products. Added the quartic section of square −16 as a negative control. Evidence: ltxzz line 2823; stacks-projective line 3479; chart calculation below.

## F02 (P2) — applied

§2.5: unrestricted edge maps → ∇₁ only for odd N=2r+1 and ∇₀ only for even N=2r, in both definitions and formulas. Boundary cancellation and coinvariant descent are odd; the three-step filtration and singular sequence are even. Added the rank-two/rank-three cancellation Check. Evidence: ltxzz line 4081; ltxzz line 4110; ltxzz line 4214; ltxzz line 4219.

## F03 (P2) — applied

§2.6: component “strict transforms” → `resolvedProductComponent`, defined by scheme-theoretic closure over P∖P††, where σ is an isomorphism. Intersection strata are scheme-theoretic intersections. Explicit charts prove both equal-component blowup identifications. Ordinary strict transform remains for QΔ. Added the empty ordinary centre transform versus nonempty resolved component Check. Evidence: stacks-blowup line 3919; ltxzz line 4715.

## F04 (P3) — applied

The supplier locator `Mathlib/RingTheory/reesAlgebra.lean` → `Mathlib/RingTheory/ReesAlgebra.lean`. Read the latter at Mathlib commit `6b7abb3c7686292736be2955bd3eb9ebf63b456a`: `reesAlgebra` is at line 40 and `mem_reesAlgebra_iff` at line 65, with `[CommRing R]` and `I : Ideal R`. No declaration, hypothesis or supplier obligation changed.

## Mathematical verification

The product chart has xy=p and uv=p, with balloon branches x=0 and u=0. Blowing up (x,u) gives the charts xtv=p, with u=xt and y=tv, and usy=p, with x=us and v=sy. The overlap has s=t⁻¹. Outside Z=P†† the centre ideal is invertible. Thus all four component closures have a definition even when their images lie in the blowup centre. The ordinary strict transform of the centre instead blows up its zero image ideal: every positive Rees degree is zero, so its Proj is empty (stacks-blowup line 3906; stacks-blowup line 3919).

On Q°° these are the charts for blowing up the two link divisors. Its exceptional intersection is the lines projectivization of their normal sum. Write a=c₁(L₀), b=c₁(L₁). Applying the quotient convention to the dual sum gives `(eta + rho*a)(eta + rho*b)=0`; hence η²=−ρ*(a+b)η−ρ*(ab). The two summand sections have normal lines L₀∨⊗L₁ and L₁∨⊗L₀. This also checks the section-class restrictions. The exceptional normal in Q°° is the tautological subline; the chart identification with the ground normal sum tensors it by (L₀⊗L₁)∨. Consequently the two Gysin self-intersections multiply by −η and −η−ρ*(a+b). Their sum plus the two triple-section classes is zero, as required by the principal special-fibre divisor. These calculations use stacks-blowup line 3632 and stacks-projective line 3361, stacks-projective line 3391 and stacks-projective line 3479, together with the supplied projective/Gysin formalism.

For n=2,p=3 the restricted sum is O_C⊕O_C(4) on a smooth plane quartic. Its second section has normal O_C(−4), degree −4·4=−16. Every section of C×ℙ¹ is the graph of a morphism f and has normal f*Tℙ¹ of nonnegative degree. This disproves geometric triviality. The printed adjective at ltxzz line 4759 and ltxzz-published line 5418 therefore cannot be used. The additive projective-bundle and blowup formulas require no product identification. They use η of relative degree one, with ρ!η=1, ρ!1=0 and ρ!(η²)=−(a+b). The exceptional blowup summand has zero component pushforward, since σ!j!ρ*z factors through ρ!ρ*z=0. Thus the resolved incidence maps retain their specified domains and traces; §§5.3–5.4 explicitly use the corrected products. The first geometric identities of §5.2 concern the product incidence cycles themselves.

For the odd boundary, put d=p+1. The odd incidence matrix takes `(d,-1,0)` to `(d,d²,-T•°)`. Applying `(0,T•°,d²)` gives zero. This is the cancellation of ltxzz line 4081 and ltxzz line 4087. At N=2 the link pair is zero but the even ∇₀ retains its balloon term; no odd descent follows from that convention. The parity and descent locators are ltxzz line 4214 through ltxzz line 4224. The even filtration and singular sequence are ltxzz line 4122 and ltxzz line 4151.

## Adversarial mathematics pass

Each section row covers its defining data, named API, identities and Checks. “Retained” means the stated hypotheses and supplier contracts survive the indicated controls; it is not a formal proof of unimplemented geometry or an independent acceptance verdict.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Standing ranks, twists and polarization | n=0,1; n=2,3; (I,−1)c | Small ranks are outside n≥2; rank-(2,3) tensor has rank 6, twist 2, weight −1; square has GL component −I | Retained |
| Coefficients and universes | m=0,1,2; ramified Oλ; zero coefficients | m≥1 excludes the degenerate congruence datum; no replacement of λ by ℓ; coefficient universes stay independent | Retained |
| Frobenius, coboundary and shifts | Inert p=3; sign action on ℤ; two-term cochain degree | Tate scalars 9 and 1/9; coboundary of 1 is −2; regulator coefficient degree is 2n−1 | Retained |
| Hecke, Haar and factor order | Degrees 1,2; r=1,q=3; odd n; changed level | Reciprocal signs alternate; even I°=16, odd T°=9/2; factor exchange and normalized level volumes remain explicit | Retained |
| Torus descent and trace | Free two-point orbit with 𝔽₂ coefficients; empty indexing set | Orbit trace is 1 while total trace is 0; no division by group order or unrestricted exactness of invariants | Retained |
| §1.5 inert predicates and transport API | ℚ(i) at 2,3,5; inert residue degree two; identity transport | 3 accepted with residue size 9; 2,5 and degree-two base completion rejected | Retained |
| §1.6 admissibility and its four API statements | n=2; ℓ=2,3; identity scalar; ξ=±1; homothety | L1 excludes small primes; L5 witnesses require their nonidentity conditions; conjugation preserves all seven clauses | Retained |
| §2.1 level data and contractions | Empty raising set; infinite exceptional support; m=1 versus 2; changed level | Empty raising set allowed; finite support and depth required; P6 needs a new verification after level change | Retained |
| §2.2 basic correspondence | N=2,3; empty source; residue extension | Fibre dimensions 0,1 and codimensions 1,1; empty source contributes nothing | Retained |
| §2.3 strata, local charts and normal bundles | xy=p; p=3 quartic; invert p | Two reduced branches; link normals have degrees ±16; generic chart smooth | Retained |
| §2.4 link cohomology and excess | Minimal relative position; ℓ dividing p+1; free C₂ orbit in characteristic two coefficients | Projective fibre is ℙ⁰; unit hypothesis is essential for restriction; orbit trace remains valid | Retained |
| §2.5 incidence definitions and matrices | N=2,3,4; p=3; two restriction basis vectors | N=2 has zero link pair; odd diagonal −16 and even diagonal 4; alternating restriction has values 1,−1 | Parity guards applied |
| §2.5 edge maps and descent | N=2 versus N=3; boundary (p+1)Inc°!−Inc†! | Odd cancellation computes to zero; even formula retains a balloon contribution | F02 Check added |
| §2.5 filtration and singular sequence | Even N=2,4; Frobenius 4 on ℤ₃; p²−1 not a unit | Filtration is even; invariants 0 differ from coinvariants ℤ₃/3; unit condition retained | Explicit even domain |
| §2.6 component definition and chart API | Centre itself; U=P∖Z; empty centre; both blowup charts | Ordinary centre transform empty; component closure nonempty; mixed components unchanged; at most three branches | F03 applied |
| §2.6 exceptional bundle and Chern API | Geometric point; trivial two-line sum; O_C⊕O_C(4) | Point fibre ℙ¹; η²=0 only in the trivial Chern case; quartic section square −16 | F01 applied |
| §2.6 section restrictions and Gysin products | D₀,D₁; both equal components; quartic | Section classes are disjoint; both exceptional normal formulas satisfy the special-fibre divisor relation; ρ!(η²)=−a−b | Chern terms retained |
| §2.6 lifting, graph and coefficient APIs | Effective-Cartier inverse image; exceptional point; generic graph; coefficient reduction | Sufficient lifting criterion holds; arbitrary exceptional-point maps have several lifts; graph has dense generic part | Retained |
| §3.1 localization and concentration | Unlocalized bad constituent; adjacent integral torsion | Intertwiners require localized support; derived reduction required for freeness | Retained |
| §3.2 odd comparison | N=3; omitted H(N); nonsemisimple Frobenius | Surjectivity, concentration and coinvariant isomorphism have distinct premises | Correct odd domain retained |
| §3.3 even freeness | N=2,4; zero support; levels outside S_FL supplier domain | Nonzero support and residual hypotheses remain; broader transferable levels use the declared gap | Retained |
| §3.4 ground eigenvalues | Candidate eigenvalues 1,p²; level-raising eigenpair | Exclusions use the full even hypothesis list | Retained |
| §3.5 singular comparison | N=2; torsion quotient versus annihilator | Actual nΠ quotient and filtered inertia map remain the objects | Correct even domain retained |
| §3.6 multiplicity realization | μ=1,2; changed multiplicity basis | Existence of an isomorphism gives no canonical coordinate | Retained |
| §3.7 changing odd levels | Empty set; singleton; repeated rational support | Empty change is identity; repeated support is outside the theorem's domain | Retained |
| §4.1 diagonal datum and refinement API | n=2; incompatible levels; source-only degree-two refinement | Dimensions 1,2,3; level inclusion necessary; commuting refinement need not be Cartesian | Retained |
| §4.2 graph cycle API | Δ−Δ; degree-two cover; identity point graph | Class zero, pushforward 2Δ and positive point class 1 respectively | Retained |
| §4.3 projected regulator API | Zero cycle; n=2; point class on ℙ¹; nonproper reducible residual system | H¹ of H³(2) is the rank-(2,3) target; arbitrary point cycle has no such edge; integral boundary premise separate | Retained |
| §4.4 finite membership | Weight calculation; ℓ ramified in F; ramified coefficient field | Weight −1; L1 excludes ramification in F, while coefficient ramification remains allowed | Retained |
| §4.5 multiplicities and conjugation | Reducible factor; zero tuple; nonzero tuple with changed basis | H(N) needs its irreducibility antecedent; nonzero tuple has some nonzero coordinate | Retained |
| §4.6 regulator naturality | Identity cover; degree two; non-Cartesian square | Trace uses source degree; pullback uses every component of the full fibre product | Retained |
| §5.1 first datum and pairing API | Zero localization; m=1,2; given 𝔽₁₁ roots | Nonzero support required; factor polynomial conditions do not imply tensor simple-root condition | Retained |
| §5.1 period definition and API | Empty, singleton and double source; infinite target; cancellation; characteristic two | Values 0,1,2; cancellation and torsion forbid converse nonzero claims or averaging | Retained |
| §5.2 geometric first law | p=3; multiplicity one; zero cycle | Factors 4 and 16 persist; formulas are linear in actual product cycles | Retained |
| §5.3 product concentration | Ranks 2,3; integral Tor; nontrivial exceptional bundle | Freeness removes Tor; additive blowup decomposition uses η without triviality | Updated reference to §2.6 |
| §5.4 potential map and boundary API | Two-term differential π²; reduction; unipotent Frobenius over 𝔽₃; both section classes | Cokernel class of π has exponent 1; invariants cannot replace coinvariants; exceptional products carry base Chern classes | Updated geometric computation |
| §5.5 first explicit law | p=3; zero test function; actual n₀ then n₁ quotients | Factor (p+1) and both Hecke values retained; no quotient/eigenspace substitution | Retained |
| §5.6 exponent identity | Unit multiple; zero class; nonunit multiple | Equality uses PI2/PI4/PI5 units; nonunit multiplication would change exponent | Retained |
| §6.1 second datum and API | Two coincident source points; m=0; changed first-law rigidity label | Multiplicity 2; positive exponent required; second datum independent of first-law-only labels | Retained |
| §6.2 geometric second law | Zero cycle; rank-(2,3) degree and twist | Degree 2r₀ and twist r₀ match the pushforward; both correspondence legs retained | Retained |
| §6.3 odd coinvariants | Odd rank 3; omitted A7.3.2; invariant/coinvariant distinction | Comparison retains concentration, H(n₁) and weak semisimplicity | Retained |
| §6.4 second explicit bound | O/π²→O/π; zero class | Exponents 2 and 1 show strict inequality is possible; no equality asserted | Retained |
| §7.1 polarized image lifting | m=1,2; ξ²=1; simple rank-one fixed line | ξ²−1 must be a unit; simple residual line lifts on the stated image-lifting contract | Retained |
| §7.2 realised detection | Zero realised span; c=0; c≥k; displayed triangular D,C; primitive vectors | Fixed line alone insufficient; positive loss gives a submodule, not a basis; primitive kernel vector has the stated exponent | Retained |
| §7.3 annihilator APIs and rigidity | Empty raising set; two detecting places; N=2 at p=3 mod 11; N=4 double pair mod 19 | Correct simple Frobenius pair passes; double pair fails; primitive first kernel kills the unwanted term | Retained |
| §7.3 finite conditions and pairings | Zero argument; perfect/nonperfect A₅ pairing; uniformizer Kummer class; other place above p₁ | Exponent is max(0,a+b−m) only for perfect pairing; both coefficient-place classes must be finite; native specialization covers the other place | Retained |
| §7.4 eventual admissibility | F⁺=ℚ; CM/isogenous elliptic factors; missing supercuspidal component | Only the two stated families and F⁺≠ℚ domain apply; no uniform span conclusion inferred | Retained |
| §8.1 rank zero | Hypothetical rank-one lattice; large m; ramified Oλ | Contradiction threshold retains detection, lattice and different losses, all independent of m | Retained |
| §8.2 rank one | Nonzero regulator; hypothetical rank-two lattice; nonbasis primitive pair | Multiplicity gives lower bound; two-place pairing gives upper bound with total loss 2c | Retained |
| §8.3 removing H(N) | n=2 over ℚ; n≥3 over ℚ versus larger F⁺ | Only N≤3 or F⁺≠ℚ discharges multiplicity; all uniform span and admissibility premises remain | Retained |
| §8.4 small-rank specialization | Rank pair (2,3); ℓ=2,3; absence of L6/L7 | Small coefficient primes fail L1; specialization retains L6 and L7 | Retained |
| §8.5 Hilbert comparison | Odd g=1,3; even g; missing LIInd or residual dimension equality | Only odd degree with all native supplier hypotheses is asserted | Retained |
| Downstream L-value interface | Definite period witness versus only derivative nonvanishing | Extra theorem producing the period is required; no derivative-to-cycle implication exported | Retained |
| Lean `definiteDiagonalPeriod` | Empty and double source; arbitrary X,Y | Actual finite sum on source; no target finiteness premise | Unchanged |
| Lean `definiteDiagonalPeriod_add` | Zero functions; torsion monoid coefficients | Termwise additivity uses only AddCommMonoid | Unchanged |
| Lean `definiteDiagonalPeriod_smul` | c=0; zero semiring; noncommutative semiring | Left regular action distributes over the finite sum | Unchanged |
| Lean `definiteDiagonalPeriod_map` | Zero additive map; reduction to ZMod 2 | Additive map commutes with the sum | Unchanged |
| Lean `definiteDiagonalPeriod_reindex` | Identity; swapping Bool; empty source | Equivalence permutes source terms with multiplicity | Unchanged |
| Lean `definiteDiagonalPeriod_fiber` | Empty target; double fibre; unhit pair | Finite fibres partition S; Nat.card gives multiplicity 2 or 0 | Unchanged |
| Lean `definiteDiagonalPeriod_exists_ne_zero` | Empty source; signed cancellation | Contrapositive of all summands zero; no converse used | Unchanged |
| Two proved Lean examples | Singleton/double/empty over ℤ; signed Bool; double over ZMod 2 | Expected values 1,2,0 and 0,0; proofs unchanged, not re-elaborated | Unchanged |

## Checks and outcomes

- **Elaborate `Suggested.lean`: not available.** Not run, as specified. No Lean command or background Lean process was started. No elaborated-type or build success is claimed.
- **Dependency direction:** both runs exited with status 0. Initial exact output was `depcheck: 6 roadmaps, 58 edges, 0 problem(s)`; final exact output was:

  ```text
  depcheck: 7 roadmaps, 63 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line occurred.
- **`git diff --check`:** exit status 0, no output.
- **Static consistency:** source and metadata TOML and plan JSON parse. All six source records have the required bibliographic, locator and service provenance fields. Every existing gap has its matching supplier-contract line. `Suggested.lean`, `metadata.toml` and `design/plan.json` are byte-for-byte unchanged from HEAD. All seven Lean declaration names remain in the README; the file has one `import Mathlib`, one real definition, six theorem signatures and two proved examples, with no forbidden options or admitted data.
- **Source access:** all five original works were readable in the legal cache; the additional `stacks-projective` text was fetched through the sources service and is certified. No missing reference was encountered. Updated `sources.toml` records the new work and the added strict-transform, section-normal and parity locators. No source text was copied into the package or report.
- **Ownership:** checked the relevant main sections of StableReduction, SchemeAndStackFoundations, EtaleCohomologyFoundations and ProfiniteCohomology, the shape of Chebotarev, and the five named sibling packages. No sibling owns the two-factor component-closure calculation. General projective bundles, Chern and self-intersection theory remain imported by exact supplier section; no new gap or ownership move is needed.
- **Pins:** searched the library objects and read the pinned Mathlib Rees file and Tau Ceti affine chart file at the manifest commits. General Rees algebra and affine charts remain supplier APIs rather than new targets.

## Maintainer notes

Changed only `packages/SelmerIwasawaCohomologyPartII/README.md`, `packages/SelmerIwasawaCohomologyPartII/sources.toml` and this report. No commit or GitHub write was made.

No Lean name was renamed or deleted. `resolvedProductComponent` is a new README construction on native geometric carriers; it has a component API and seven discriminating Checks in §2.6. Its native carriers, and those of the new bundle and Gysin controls, are not available at the pins, so no substitute encoding was added to `Suggested.lean`.

Consumers of §2.6 must use the component closures and the projective-bundle splitting with η, retaining its Chern terms. They must not consume a global exceptional product identification or the ordinary strict transform of the blowup centre as a component. The ∇₁ and ∇₀ names retain their intended odd and even uses in §§3.2 and 3.5. The rank and reciprocity endpoints keep their existing hypotheses and names. Fresh independent mathematical review remains necessary.
