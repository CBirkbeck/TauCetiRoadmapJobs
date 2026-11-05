# GATE-TopologicalSheafCohomology~1: answers to human review

Reviewed head `f06755a`; repairs committed as `6e3d3a95` (not pushed).

## H01 (roed-math) — applied

TS1.3 now states the sheafification lemma only for presheaves with P(∅)=0: "a presheaf P with P(∅)=0 and zero sheafification has zero cover-colimit Čech cohomology", and the comparison of P with P^# carries the same hypothesis. The fixed-cover construction stays unrestricted, and the two-point counterexample is written out in TS1.3 and added to the acceptance list. Recomputed: on the native tuple complex for ({a},{b}), C⁰=0, C¹=R² on (a,b),(b,a), the tuple (a,b,a) forces v=−u, B¹=0, so Ȟ¹=R; the singleton cover refines every cover, so the colimit is R while Ȟ¹(P^#)=0. The same hypothesis is carried to TS2.3 in three places, and the open/compact cover comparison is kept separate from the sheafification step, as asked:
- the open-presheaf vanishing claim now reads "If P(∅)=0 and P has zero sheafification …";
- the continuity K-presheaf step requires G(∅)=0, with the two-point K-presheaf (continuity holds, αOpen G = P, G(∅)=R) as the reason;
- the complex-valued step requires G(∅) to be acyclic, which a homotopy K-sheaf has by TS2.2.

The TS1.4 use is unaffected because the presheaf H^q(F) vanishes at ∅ (each F^p(∅)=0); this is now stated there. No other use of the pattern was found: TS3.2 applies it to section-support sheaves, which are sheaves.

## H02 (roed-math) — applied

TS4.1 used to say only "fix the sign by the displayed cone differential and the outward-first boundary generator". It now gives the formula: a cone cycle has ∂b=−i_*a, the pair connecting map gives −[a], and the evaluation is `[(b,a)] ↦ β⁻¹(−[a])` with β:o_M|_N→o_N the outward-first map. The half-line witness is written into the README and the acceptance list. It was recomputed: with M=[0,∞), N={0}, K=[0,1], b the path 0→2 and a=[0], we get ∂b ≡ −[0] mod M\K, so (b,a) is a cycle. Interior evaluation at y=1/2 is positive, the outward-first boundary orientation is −[0], and β⁻¹(−[a]) is positive while β⁻¹([a]) is negative. The pinned `mappingCone` in `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean` (`inl_v_d`, `d_fst_v`) has d(a,b)=(−d a, φa + d b), which agrees with the displayed differential after reindexing.

## H03 (roed-math) — applied

TS3.7 is changed, and the ownership paragraph's reference to CC's "singular resolution" now says it lives on the Hausdorff CW representatives where CC constructs it. On a compact X of CW type, TS3.7 now identifies the TS cover-colimit Čech groups with CC's cover-colimit groups on X by TS1.2 cofinality, then composes with `cechSingularCWTypeComparison`. The direct diagram TS fixed-cover Čech → TS derived global sections → resolution sections → singular cochains is stated only on a compact Hausdorff CW complex, where it must agree with that composite. This matches CharacteristicClasses C1.2b on main: its `cechSingularCWTypeComparison` paragraph builds the resolution "On a Hausdorff CW representative" and transports "through a CW homotopy equivalence". The comb space is added as the guard example, with the argument in our own words: near (0,t) with t>0, a sheafified singular 0-cocycle can take different constant values on neighbouring teeth. No new source is cited.

## Other changes made so the gate passes

- `Suggested.lean`: the ten `import Mathlib.<submodule>` lines become the single `import Mathlib`; the two `TauCeti.*` imports, which exist at the pin, are kept. Nothing else in the file changed.
- README TS4.1: `ℝ_{≥0}` (a TeX residue) → `[0,∞)`.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| TS1.3 zero-sheafification ⇒ zero cover-colimit Čech | X={a,b} discrete, P(∅)=R, P(U≠∅)=0 | Ȟ¹(cover)=R; colimit R; Ȟ¹(P^#)=0 | false without P(∅)=0 | hypothesis P(∅)=0 added |
| same, with P(∅)=0 | X=∅ (empty cover is finest) | all groups 0 on both sides | consistent | — |
| TS1.3 P vs P^# comparison | kernel and cokernel of P→P^# at ∅ | ker(∅)=P(∅), coker(∅)=0 | needs P(∅)=0 for the kernel to vanish at ∅ | hypothesis added |
| TS1.4 E₂ route | H^q(F)(∅) for a sheaf complex | F^p(∅)=0 ⇒ H^q=0 | hypothesis holds | stated |
| TS2.3 continuity K-presheaf G | G = two-point P on compacts | continuity colim at ∅ = G(∅)=R; αOpen G(∅)=R, αOpen G(U≠∅)=G(U)=0 | continuity does not give G(∅)=0 | G(∅)=0 required; complex case: G(∅) acyclic |
| TS4.1 boundary evaluation sign | M=[0,∞), N={0}, b: 0→2, a=[0] | connecting map −[0]; β(+)=−[0]; β⁻¹(−[a])=+ | sign β⁻¹(−[a]) | formula and witness added |
| TS3.7 resolution carrier | comb space, point (0,t), t>0 | 0-cocycle germ ≠ constant germ | no resolution on X | diagram restricted to a compact CW complex |

The `#check` scratch-file comparison was not run. The brief allows only the two Lean commands it names, and the only Lean change is to imports; the full build elaborates every declaration unchanged.

## Remaining issues, not repaired here

- `Suggested.lean` is still an interface sketch (abbrevs, restriction lemmas, examples), not a headline-theorem acceptance test, and the README does not follow the house shape (no Checks lists, no Layer/Dependencies sections). Restructuring both goes beyond answering this review.
- The README names `TopologicalSpace.cechCochainAddCommGrpCatIso`, which is absent at the Mathlib pin: it belongs to an unmerged Mathlib pull request that the References paragraph cites by number.
- No new ownership claims were added, so ownership against open pull requests was not re-checked.

## Build and gate

- `lake build TauCetiRoadmap.TopologicalSheafCohomology.Suggested`: `Build completed successfully (8985 jobs).`
- Gate after commit: `gate TopologicalSheafCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 148 roadmaps, 1002 edges, 0 problem(s)` (no UPWARD or CYCLE line).
